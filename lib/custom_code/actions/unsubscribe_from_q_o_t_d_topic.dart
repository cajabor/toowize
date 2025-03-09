// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:firebase_messaging/firebase_messaging.dart';

Future<bool> unsubscribeFromQOTDTopic() async {
  try {
    // Initialize Firebase Messaging
    FirebaseMessaging messaging = FirebaseMessaging.instance;

    // Get the FCM token
    //String token = await messaging.getToken();
    //print("FCM Token: $token");

    // Unsubscribe from the desired topic (e.g., "QOTD")
    await messaging.unsubscribeFromTopic("QOTD");
    print("Unsubscribed from QOTD topic successfully");

    // TODO: Send the token to your server or handle it as needed.

    // Return true indicating successful unsubscription
    return true;
  } catch (e) {
    print("Error unsubscribing: $e");
    // Handle the error as needed

    // Return false indicating unsuccessful unsubscription
    return false;
  }
}
