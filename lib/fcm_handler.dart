import 'dart:async';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_push_notifications/screen_two.dart';

//Esse handler foi criado para que possa ser reutilizado em diversas telas
class FCMHandler extends StatefulWidget {
  final Widget child;

  FCMHandler({@required this.child});

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
      onMessage: (Map<String, dynamic> message) async {
        print("onMessage");

        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (ctx) => ScreenTwo(
              fromAction: 'onMessage',
            ),
          ),
        );
      },
      onLaunch: (Map<String, dynamic> message) async {
        print("onLaunch: $message");
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (ctx) => ScreenTwo(
              fromAction: 'onLaunch',
            ),
          ),
        );
      },
      onResume: (Map<String, dynamic> message) async {
        print("onResume");
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (ctx) => ScreenTwo(
              fromAction: 'onResume',
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    if (iosSubscription != null) iosSubscription.cancel();
    super.dispose();
  }

  _saveDeviceToken() async {
    // Get the current user
    String uid = 'jeffd23';
    // FirebaseUser user = await _auth.currentUser();

    // Get the token for this device
    String fcmToken = await _fcm.getToken();
    debugPrint('token: $fcmToken');
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
