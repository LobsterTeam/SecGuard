import 'package:flutter/material.dart';
import 'theme.dart';

AppBar app_bar() {
  return AppBar(
      title: Text(
        'SecGuard',
        style: ThemeTextStyles.appBarTitle,
      ),
      backgroundColor: ThemeColors.redViolet,
      centerTitle: true);
}
