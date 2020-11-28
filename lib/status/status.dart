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
            final parsed = jsonDecode(snapshot.data);
            List<Map<String, int>> errorTypeMaps = List();
            List<String> titles = [
              "android_runtime",
              "framework",
              "media_framework",
              "system",
              "google_play_system_updates",
              "mediatek",
              "qualcomm"
            ];

            for (int i = 0; i < parsed["2020-11-01"].length; i++) {
              int highCount = 0;
              int criticalCount = 0;
              int total = 0;
              String title = titles[i];

              for (int j = 0; j < parsed["2020-11-01"][title].length; j++) {
                String index = j.toString();
                if (parsed["2020-11-01"][title][index]["severity"] ==
                    "Critical") {
                  criticalCount++;
                } else if (parsed["2020-11-01"][title][index]["severity"] ==
                    "High") {
                  highCount++;
                } else {
                  total++;
                }
              }
              Map<String, int> map = {
                "Critical": criticalCount,
                "High": highCount,
                "Total": total,
              };
              errorTypeMaps.add(map);
            }
            print(errorTypeMaps);
            print(parsed["2020-11-01"].length);
            return Column(children: <Widget>[
              Card(
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(12.0)),
                color: Color(0xffffae42),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ListTile(
                      title: Text(
                        titles[0],
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25.0,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,),
                      ),
                      subtitle: Text(
                        "\n• Critical: " +
                            errorTypeMaps[0]["Critical"].toString() +
                            "\n" +
                            "• High: " +
                            errorTypeMaps[0]["High"].toString(),
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        RaisedButton(
                          shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(12.0)),
                          color: Colors.amber,
                          child: const Text(
                            'Details',
                            style: TextStyle(color: Colors.black, fontSize: 20, fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,),
                          ),
                          onPressed: () {
                            // TODO Open up new page
                          },
                        ),
                        const SizedBox(width: 8),
                        const SizedBox(width: 8),
                      ],
                    )
                  ],
                ),
              ),
            ]);
          } else {
            // TODO No data message can be added here
          }
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

  Card customCard(String title, String subtitle, Color color) {
    Card(
      color: color,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            title: Text(title),
            subtitle: Text(subtitle),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              TextButton(
                child: const Text('Details'),
                onPressed: () {
                  // TODO Open up new page
                },
              ),
              const SizedBox(width: 8),
              const SizedBox(width: 8),
            ],
          )
        ],
      ),
    );
    /*return Card(
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
    );*/
  }

  RaisedButton customRaisedButton(String text) {
    return RaisedButton(
      child: Text(text),
      onPressed: () {},
    );
  }
}
