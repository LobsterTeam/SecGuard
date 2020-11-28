import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:sec_guard/utils/app_bar.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: Colors.black87,
        body: Center(
      child: FutureBuilder(
        future:
            DefaultAssetBundle.of(context).loadString("assets/android.json"),
        builder: (context, snapshot) {
          if (snapshot.hasData) {

            /** system - FF0000
                google_play_system_updates - FFA500
                android_runtime - ffae42
                mediatek veya qualcomm - FFFF00
                framework - 9acd32
                media_framework - 008000
             * */
            //print(jsonDecode(snapshot.data));
            final parsed = jsonDecode(snapshot.data);
            List<Map<String, String>> errorTypeMaps = List();

            print(parsed);

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
