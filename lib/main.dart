import 'package:flutter/material.dart';
import 'navigation.dart';
import 'utils/theme.dart';

void main() {
  runApp(SecGuard());
}

class SecGuard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SecGuard',
      home: Navigation(),
      theme: ThemeData(
        primaryColor: ThemeColors.redViolet, // appbar color
      ),
    );
  }
}
