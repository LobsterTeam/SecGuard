import 'package:flutter/material.dart';
import 'home/navigation.dart';
import 'notification/notification.dart';

void main() => runApp(SecGuard());

class SecGuard extends StatelessWidget {
  bool notification = false;  // TODO: check if it is notification

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SecGuard',
      home: notification ? NotificationPage() : Navigation(),
      theme: ThemeData(
        primaryColor: Colors.white,  // appbar color
      ),
    );
  }
}
