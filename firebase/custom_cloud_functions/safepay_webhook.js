const functions = require("firebase-functions");
const admin = require("firebase-admin");
exports.safepayWebhook = functions.https.onRequest(async (req, res) => {
  try {
    const data = req.body.data || req.body;

    // JSON mein se exactly "tracker" nikalna jo Firebase mein save hai
    const trackerToken = data.tracker;

    // ❌ YAHAN SE STATE WALI CONDITION HATA DI HAI ❌
    // Kyunke V1 API (payment:created) fire hi tab hoti hai jab payment 100% clear ho jaye.
    // Agar webhook aya hai, iska matlab hi yeh hai ke payment PAID hai!

    if (!trackerToken) {
      console.log("Error: Missing tracker token in payload");
      return res.status(400).send("Missing tracker token");
    }

    console.log("Success: Webhook received for tracker: ", trackerToken);

    // Firebase mein wo user dhoondo jiske paas yeh current_tracker hai
    const usersRef = admin.firestore().collection("users");
    const snapshot = await usersRef
      .where("current_tracker", "==", trackerToken)
      .get();

    if (snapshot.empty) {
      console.log(
        "Error: No matching user found in Firebase for tracker:",
        trackerToken,
      );
      return res.status(404).send("User not found");
    }

    // User mil gaya! Ab 30 Days Expiry update karo
    const batch = admin.firestore().batch();

    snapshot.forEach((doc) => {
      const userData = doc.data();
      let currentExpiry = userData.subscription_expiry
        ? userData.subscription_expiry.toDate()
        : null;
      let newExpiryDate;
      const now = new Date();

      // Smart 30-Day Logic
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
        current_tracker: admin.firestore.FieldValue.delete(), // Token ko delete kar do
      });
    });

    await batch.commit();
    console.log("BOOM! User upgraded successfully to Premium!");

    // Safepay ko 200 OK bhej do
    return res.status(200).send("Webhook Processed Successfully");
  } catch (error) {
    console.error("Error processing webhook:", error);
    return res.status(500).send("Internal Server Error");
  }
});
