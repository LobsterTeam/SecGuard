import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  NotificationPage(
      {Key key,
      this.androidVersion,
      this.vendorPatchLevel,
      this.androidPathLevel})
      : super(key: key);

  final String androidVersion;
  final String vendorPatchLevel;
  final String androidPathLevel;

  @override
  State<StatefulWidget> createState() {
    return _NotificationState();
  }
}

class _NotificationState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          // TODO the second parameter will be replaced with widget.androidVersion
          customCard("Android Version", "9"),
          // TODO the second parameter will be replaced with widget.vendorPatchLevel
          customCard("Vendor security patch level", "01 September 2020"),
          // TODO the second parameter will be replaced with widget.androidPatchLevel
          customCard("Android security patch level", "01 October 2020"),
        ],
      ),
    );
  }

  Card customCard(String title, String subtitle) {
    return Card(
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
        ),
      ),
    );
  }
}
