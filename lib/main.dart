import 'package:flutter/material.dart';
import 'navigation.dart';
import "package:system_info/system_info.dart";

void main() {
  processorCheck();
  runApp(SecGuard());
}

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

void processorCheck() {
  var processors = SysInfo.processors;
  print("Number of processors    : ${processors.length}");
  for (var processor in processors) {
    print("  Architecture          : ${processor.architecture}");
    print("  Name                  : ${processor.name}");
    print("  Socket                : ${processor.socket}");
    print("  Vendor                : ${processor.vendor}");
  }
}
