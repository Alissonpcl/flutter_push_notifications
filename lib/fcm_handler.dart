import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

//Esse handler foi criado para que possa ser reutilizado em diversas telas
class FCMHandler extends StatefulWidget {
  final Widget child;
  final MessageHandler onMessage;
  final MessageHandler onLaunch;
  final MessageHandler onResume;

  FCMHandler({@required this.child, this.onMessage, this.onLaunch, this.onResume});

  @override
  _FCMHandlerState createState() => _FCMHandlerState();
}

class _FCMHandlerState extends State<FCMHandler> {
  final FirebaseMessaging _fcm = FirebaseMessaging();
  StreamSubscription iosSubscription;

  @override
  void initState() {
    super.initState();
    _fcm.requestNotificationPermissions(const IosNotificationSettings(
        sound: true, badge: true, alert: true, provisional: true));
    _saveDeviceToken();

    _fcm.configure(
      onMessage: widget.onMessage,
      onLaunch: widget.onLaunch,
      onResume: widget.onResume,
    );
  }

  @override
  void dispose() {
    if (iosSubscription != null) iosSubscription.cancel();
    super.dispose();
  }

  _saveDeviceToken() async {
    String fcmToken = await _fcm.getToken();
    debugPrint('token: $fcmToken');
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
