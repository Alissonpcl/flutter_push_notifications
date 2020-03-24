import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

abstract class FCMHandlerState<T extends StatefulWidget> extends State<T> {
  final FirebaseMessaging _fcm = FirebaseMessaging();
  StreamSubscription iosSubscription;

  @override
  void initState() {
    debugPrint('initing mixin');
    super.initState();
    _fcm.requestNotificationPermissions(const IosNotificationSettings(
        sound: true, badge: true, alert: true, provisional: true));
    _saveDeviceToken();

    _fcm.configure(
      onMessage: onMessage,
      onLaunch: onLaunch,
      onResume: onResume,
    );
  }

  @override
  void dispose() {
    debugPrint('disposing mixin');
    if (iosSubscription != null) iosSubscription.cancel();
    super.dispose();
  }

  _saveDeviceToken() async {
    String fcmToken = await _fcm.getToken();
    debugPrint('token: $fcmToken');
  }

  Future<dynamic> onMessage(Map<String, dynamic> message);
  Future<dynamic> onLaunch(Map<String, dynamic> message);
  Future<dynamic> onResume(Map<String, dynamic> message);

}
