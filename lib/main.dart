import 'package:flutter/material.dart';
import 'navigation.dart';
import 'status/status.dart';

void main() => runApp(SecGuard());

class SecGuard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SecGuard',
      home: Navigation(),
      theme: ThemeData(
        primaryColor: Color(0xff922b3e), // appbar color
      ),
    );
  }
}
