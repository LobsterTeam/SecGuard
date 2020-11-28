import 'package:flutter/material.dart';
import 'navigation.dart';
import 'package:device_info/device_info.dart';
import 'utils/theme.dart';

void main() {
  runApp(SecGuard());
  processorCheck();
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

Future<void> processorCheck() async {
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin(); // instantiate device info plugin
  AndroidDeviceInfo androidDeviceInfo = await deviceInfo.androidInfo; // instantiate Android Device Information
  var board = androidDeviceInfo.board; //this will return you device model name
  var manufacturer = androidDeviceInfo.manufacturer;
  var model = androidDeviceInfo.model;
  var hardware = androidDeviceInfo.hardware;

  print("board: " + board);
  print("manufacturer " + manufacturer);
  print("model " + model);
  print("hardware " + hardware);
}
