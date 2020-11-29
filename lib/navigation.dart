import 'package:flutter/material.dart';
import 'home/home.dart';
import 'status/status.dart';
import 'support/support.dart';
import 'utils/app_bar.dart';
import 'package:device_info/device_info.dart';
import 'utils/theme.dart';

class Navigation extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _NavigationState();
  }
}

class _NavigationState extends State<Navigation> {
  int _currentIndex = 0;
  Map<String, String> deviceInfoMap = {};
  bool loading = true;

  @override
  void initState() {
    getDeviceInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: app_bar(),
      body: (() {
        if (loading) {
          return progressIndicator;
        } else {
          if (_currentIndex == 0) {
            return HomeTab(deviceInfoMap: deviceInfoMap);
          } else if (_currentIndex == 1) {
            return StatusTab(deviceInfoMap: deviceInfoMap);
          } else {
            return SupportTab();
          }
        }
      }()),
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTap,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.security_sharp),
            label: 'Status',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.support_agent),
            label: 'Support',
          ),
        ],
      ),
    );
  }

  Future<void> getDeviceInfo() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    AndroidDeviceInfo androidDeviceInfo = await deviceInfo.androidInfo;

    deviceInfoMap["manufacturer"] = androidDeviceInfo.manufacturer;
    deviceInfoMap["model"] = androidDeviceInfo.model;
    deviceInfoMap["board"] = androidDeviceInfo.board;
    deviceInfoMap["hardware"] = androidDeviceInfo.hardware;
    deviceInfoMap["version"] = androidDeviceInfo.version.release;
    deviceInfoMap["API"] = androidDeviceInfo.version.sdkInt.toString();
    deviceInfoMap["secPatch"] = androidDeviceInfo.version.securityPatch;
    deviceInfoMap["googlePlaySecPatch"] =
        androidDeviceInfo.version.securityPatch; // TODO

    setState(() {
      loading = false;
    });
  }

  final progressIndicator = new Center(
      child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(ThemeColors.redViolet)));

  void onTabTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
