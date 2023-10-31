import 'package:flutter/material.dart';
import 'package:globalstate/globalstate.dart';

void main() => runApp(MyEphemeralApp());

class MyEphemeralApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: GlobalState(),
    );
  }
}

