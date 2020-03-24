import 'package:flutter/material.dart';
import 'package:flutter_push_notifications/fcm_handler_abstract.dart';

class ScreenTree extends StatefulWidget {

  @override
  _ScreenTwoState createState() => _ScreenTwoState();
}

class _ScreenTwoState extends FCMHandlerState<ScreenTree>{
  String _fromAction;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Screen Two'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Chegou na tela dois a partir de $_fromAction',
            ),
          ],
        ),
      ),
    );
  }

  @override
  Future onLaunch(Map<String, dynamic> message) {
    setState(() {
      _fromAction = "onLaunch";
    });
  }

  @override
  Future onMessage(Map<String, dynamic> message) {
    setState(() {
      _fromAction = "onMessage";
    });
  }

  @override
  Future onResume(Map<String, dynamic> message) {
    setState(() {
      _fromAction = "onResume";
    });
  }

}
