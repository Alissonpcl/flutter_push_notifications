import 'package:flutter/material.dart';

class ScreenTwo extends StatelessWidget {

  final String fromAction;

  ScreenTwo({@required this.fromAction});

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
            Text('Chegou na tela dois a partir de $fromAction',
            ),
          ],
        ),
      ),
    );
  }
}
