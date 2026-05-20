const admin = require("firebase-admin/app");
admin.initializeApp();

const safepayWebhook = require("./safepay_webhook.js");
exports.safepayWebhook = safepayWebhook.safepayWebhook;
