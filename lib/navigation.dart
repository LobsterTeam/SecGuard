import 'package:flutter/material.dart';
import 'home/home.dart';
import 'status/status.dart';
import 'support/support.dart';
import 'utils/app_bar.dart';

class Navigation extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _NavigationState();
  }
}

class _NavigationState extends State<Navigation> {
  int _currentIndex = 0;
  final List<Widget> _children = [HomeTab(), StatusTab(), SupportTab()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: app_bar(),
      body: _children[_currentIndex],
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

  void onTabTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
