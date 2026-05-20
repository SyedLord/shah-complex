const functions = require("firebase-functions");
const admin = require("firebase-admin");
exports.safepayWebhook = functions.https.onRequest(async (req, res) => {
  try {
    // Safepay webhook ka data fetch karna
    const data = req.body.data || req.body;
    const trackerToken = data.tracker;
    const paymentState = data.state;

    // Agar payment "PAID" nahi hai toh kuch na karo
    if (paymentState !== "PAID") {
      return res.status(200).send("Ignored: Payment not completed yet.");
    }

    if (!trackerToken) {
      return res.status(400).send("Missing tracker token");
    }

    // Firebase mein wo user dhoondo jiske paas yeh tracker_token hai
    const usersRef = admin.firestore().collection("users");
    const snapshot = await usersRef
      .where("current_tracker", "==", trackerToken)
      .get();

    if (snapshot.empty) {
      console.log("No matching user found for tracker:", trackerToken);
      return res.status(404).send("User not found");
    }

    // Snapshot mein jitne docs milen (waise 1 hi hoga), sabko update karo
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
        // Agar user pehle se Premium hai aur time bacha hai, toh purani date mein 30 din add karo
        newExpiryDate = new Date(
          currentExpiry.setDate(currentExpiry.getDate() + 30),
        );
      } else {
        // Agar naya user hai ya purana package expire ho chuka hai, toh aaj se 30 din add karo
        newExpiryDate = new Date(now.setDate(now.getDate() + 30));
      }

      batch.update(doc.ref, {
        member_Level: "Premium", // Aapke database ke mutabiq
        subscription_expiry: admin.firestore.Timestamp.fromDate(newExpiryDate),
        current_tracker: admin.firestore.FieldValue.delete(), // Token delete kar do taake reuse na ho
      });
    });

    await batch.commit();
    console.log("User upgraded successfully to Premium!");

    // Safepay ko 200 OK bhej do
    return res.status(200).send("Webhook Processed Successfully");
  } catch (error) {
    console.error("Error processing webhook:", error);
    return res.status(500).send("Internal Server Error");
  }
});
