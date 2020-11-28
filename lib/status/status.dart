import 'dart:convert';
import 'package:flutter/material.dart';

class StatusTab extends StatefulWidget {
  StatusTab(
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
    return _StatusState();
  }
}

class _StatusState extends State<StatusTab> {
  //NotificationService notificationService = new NotificationService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: Colors.black87,
        body: Center(
      // padding: EdgeInsets.all(16.0),
      child: FutureBuilder(
        future:
            DefaultAssetBundle.of(context).loadString("assets/android.json"),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final parsed = jsonDecode(snapshot.data);
            List<Map<String, String>> criticalErrorList = List();
            List<Map<String, String>> highErrorList = List();

            for (int i = 0; i < parsed["Framework"].length; i++) {
              if (parsed["Framework"][i][3] == "Critical" &&
                  parsed["Framework"][i][4].contains("9")) {
                String key = parsed["Framework"][i][0];
                Map<String, String> map = {key: parsed["Framework"][i][2]};
                criticalErrorList.add(map);
              } else if (parsed["Framework"][i][3] == "High" &&
                  parsed["Framework"][i][4].contains("9")) {
                String key = parsed["Framework"][i][0];
                Map<String, String> map = {key: parsed["Framework"][i][2]};
                highErrorList.add(map);
              }
            }
            print(criticalErrorList);
            print(highErrorList);
            String s = "8.0, 8.1, 9";
            print(s.contains("9"));
          } else {}
          return Container();
        },
      ),
      /*Column(
                children: [
              // TODO the second parameter will be replaced with widget.androidVersion
              customCard("Android Version", "9"),
              // TODO the second parameter will be replaced with widget.vendorPatchLevel
              customCard("Vendor security patch level", "01 September 2020"),
              // TODO the second parameter will be replaced with widget.androidPatchLevel
              customCard("Android security patch level", "01 October 2020"),

              // TODO FutureBuilder widget will be here

                  Align(
                      alignment: Alignment.bottomLeft,
                      child: customRaisedButton("Contact"))
                ]),*/
    ));
  }

  Card customCard(String title, String subtitle) {
    return Card(
      margin: EdgeInsets.all(8),
      shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(12.0)),
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

  RaisedButton customRaisedButton(String text) {
    return RaisedButton(
      child: Text(text),
      onPressed: () {},
    );
  }
}
