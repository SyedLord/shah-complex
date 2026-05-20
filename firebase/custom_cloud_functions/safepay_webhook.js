const functions = require("firebase-functions");
const admin = require("firebase-admin");
exports.safepayWebhook = functions.https.onRequest(async (req, res) => {
  try {
    const payload = req.body;

    console.log("V2 Webhook Payload Received: ", JSON.stringify(payload));

    // 1. Guard: Sirf payment.succeeded event process karo
    if (payload?.type !== "payment.succeeded") {
      console.log("Ignored event type: ", payload?.type);
      return res.status(200).send("Event received but not processed"); //
    }

    // 2. V2 Structure se Token aur State nikalna
    const trackerToken = payload?.data?.tracker; //
    const trackerState = payload?.data?.state; //

    if (!trackerToken) {
      console.log("Error: Tracker missing from payload.data.tracker"); //
      return res.status(200).send("Tracker missing"); //
    }

    // 3. Status Check: V2 mein yeh hamesha TRACKER_ENDED hona chahiye
    if (trackerState !== "TRACKER_ENDED") {
      console.log("Unexpected tracker state: ", trackerState); //
      return res.status(200).send("Unexpected state"); //
    }

    // 4. Firebase mein user dhoondna
    const usersRef = admin.firestore().collection("users");
    const snapshot = await usersRef
      .where("current_tracker", "==", trackerToken)
      .limit(1)
      .get(); //

    if (snapshot.empty) {
      console.log("Error: No matching user found for tracker:", trackerToken); //
      return res.status(200).send("User not found"); //
    }

    // 5. Expiry Update Karna
    const doc = snapshot.docs[0]; //
    const userData = doc.data();
    let currentExpiry = userData.subscription_expiry
      ? userData.subscription_expiry.toDate()
      : null;
    let newExpiryDate;
    const now = new Date(); //

    if (currentExpiry && currentExpiry > now) {
      newExpiryDate = new Date(
        currentExpiry.setDate(currentExpiry.getDate() + 30),
      );
    } else {
      newExpiryDate = new Date(now.setDate(now.getDate() + 30)); //
    }

    // 6. Firestore Write
    await doc.ref.update({
      member_Level: "Premium", //
      subscription_expiry: admin.firestore.Timestamp.fromDate(newExpiryDate), //
      current_tracker: admin.firestore.FieldValue.delete(), //
      last_payment_at: admin.firestore.Timestamp.fromDate(now), //
    });

    console.log("BOOM! User upgraded successfully to Premium via V2!");
    return res.status(200).send("OK"); //
  } catch (error) {
    console.error("Error processing webhook:", error);
    return res.status(500).send("Database update error"); //
  }
});
