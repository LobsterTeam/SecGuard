import 'package:flutter/material.dart';

AppBar app_bar(){
  return AppBar(
    title: Center(
      child: Text(
        'SecGuard',
        style: TextStyle(
          color: Colors.white,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w600,
          fontSize: 30.0
        )
      )
    ),
    backgroundColor: Color(0xff922b3e),
  );
}
