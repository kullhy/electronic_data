import 'package:electronic_data/app.dart';
import 'package:electronic_data/firebase_options.dart';
import 'package:electronic_data/services/firebase_api.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseMessaging.instance.subscribeToTopic("warning");
  FireBaseApi().initNotifications();
  runApp(const MyApp());
}
