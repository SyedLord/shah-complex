const functions = require("firebase-functions");
const admin = require("firebase-admin");
exports.safepayWebhook = functions.https.onRequest(async (req, res) => {
  try {
    const payload = req.body.data || req.body;

    console.log("V2 Webhook Received: ", JSON.stringify(payload));

    // V2 proper structure use karta hai jisme tracker aur state dono clear hotay hain
    const trackerToken = payload.tracker;
    const paymentState = payload.state;

    // V2 ka strict security lock: Agar PAID nahi hai toh wahin reject kar do
    if (paymentState !== "PAID") {
      console.log(
        "Ignored: State is not PAID. Current state is: ",
        paymentState,
      );
      return res.status(200).send("Ignored: Payment not completed");
    }

    if (!trackerToken) {
      console.log("Error: Missing tracker token.");
      return res.status(400).send("Missing tracker token");
    }

    console.log("Success: Webhook validated for tracker: ", trackerToken);

    // Firebase mein user ko dhoondna
    const usersRef = admin.firestore().collection("users");
    const snapshot = await usersRef
      .where("current_tracker", "==", trackerToken)
      .get();

    if (snapshot.empty) {
      console.log("Error: User not found for tracker:", trackerToken);
      return res.status(404).send("User not found");
    }

    // Expiry Update Logic
    const batch = admin.firestore().batch();

    snapshot.forEach((doc) => {
      const userData = doc.data();
      let currentExpiry = userData.subscription_expiry
        ? userData.subscription_expiry.toDate()
        : null;
      let newExpiryDate;
      const now = new Date();

      if (currentExpiry && currentExpiry > now) {
        newExpiryDate = new Date(
          currentExpiry.setDate(currentExpiry.getDate() + 30),
        );
      } else {
        newExpiryDate = new Date(now.setDate(now.getDate() + 30));
      }

      batch.update(doc.ref, {
        member_Level: "Premium",
        subscription_expiry: admin.firestore.Timestamp.fromDate(newExpiryDate),
        current_tracker: admin.firestore.FieldValue.delete(),
      });
    });

    await batch.commit();
    console.log("BOOM! User upgraded successfully to Premium via Safepay V2!");

    return res.status(200).send("Webhook Processed Successfully");
  } catch (error) {
    console.error("Error processing webhook:", error);
    return res.status(500).send("Internal Server Error");
  }
});
