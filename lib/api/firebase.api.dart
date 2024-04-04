import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tcc_girls_in_ctrl/api/sharedprefereces.api.dart';
import 'package:tcc_girls_in_ctrl/models/notification.models.dart';

class FirebaseApi {
  final _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> initNotifications() async {
    await _firebaseMessaging.requestPermission();
    _firebaseMessaging.subscribeToTopic('todos');
    _firebaseMessaging.getToken().then((token) => print(token));
    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
  }

  Future<void> handleBackgroundMessage(RemoteMessage message) async {
    print('Title: ${message.notification?.title}');
    print('Body: ${message.notification?.body}');
    print('Payload: ${message.data}');

    await SharedPreferencesHelper.addNotification(
        '${message.notification?.title}',
        '${message.notification?.body}',
        message.data);
  }
}
