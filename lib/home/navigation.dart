import 'package:flutter/material.dart';
import 'home.dart';
import 'feed.dart';
import '../utils/app_bar.dart';

class Navigation extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _NavigationState();
  }
}

class _NavigationState extends State<Navigation> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    HomeTab(),
    FeedTab()
  ];

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
            icon: Icon(Icons.security_sharp),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.rss_feed),
            label: 'Feed',
          )
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
