import 'package:flutter/material.dart';
import 'package:flutter_push_notifications/fcm_handler.dart';

class ScreenTwo extends StatefulWidget {

  ScreenTwo();

  @override
  _ScreenTwoState createState() => _ScreenTwoState();
}

class _ScreenTwoState extends State<ScreenTwo> {
  String _fromAction;

  @override
  Widget build(BuildContext context) {
    return FCMHandler(
      child: Scaffold(
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
      ),
      onLaunch: (_){
        setState(() {
          _fromAction = 'onLaunch';
        });
        return;
      },
      onResume: (_){
        setState(() {
          _fromAction = 'onResume';
        });
        return;
      },
      onMessage: (_){
        setState(() {
          _fromAction = 'onMessage';
        });
        return;
      },
    );
  }
}
