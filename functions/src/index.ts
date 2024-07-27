import * as functions from "firebase-functions";
import * as admin from "firebase-admin";

admin.initializeApp();

// Function to send notifications to all users
const sendNotificationToAllUsers = async (message: string) => {
  const payload = {
    notification: {
      title: "Warning",
      body: message,
    },
  };

  try {
    const res = await admin.messaging().sendToTopic("warning", payload);
    console.log("Successfully sent message:", res);
    return true;
  } catch (error) {
    console.error("Error sending message:", error);
    return false;
  }
};

export const onWarningChange = functions.database
  .ref("/isWarning")
  .onUpdate(async (change) => {
    const before = change.before.val();
    const after = change.after.val();
    console.log("Successfully sent message:", after);
    if (before != true && after == true) {
      await sendNotificationToAllUsers("Warning is now active!");
    }
  });
