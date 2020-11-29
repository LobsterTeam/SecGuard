import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:sec_guard/status/status_details.dart';
import 'package:sec_guard/utils/theme.dart';

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
  // TODO Mediatek or Qualcomm will be removed wrt phone type

  Map<String, String> titleNames = {
    "system": "System",
    "google_play_system_updates": "Google Play System Updates",
    "android_runtime": "Android Runtime",
    "mediatek": "Mediatek",
    "qualcomm": "Qualcomm",
    "framework": "Framework",
    "media_framework": "Media Framework"
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: FutureBuilder(
        future:
            DefaultAssetBundle.of(context).loadString("assets/android.json"),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            /** system - 0xFFFF0000
                    google_play_system_updates - 0xFFFFA500
                    android_runtime - 0xFFffae42
                    mediatek veya qualcomm - 0xFFFFFF00
                    framework - 0xFF9acd32
                    media_framework - 0xFF008000
                 * */
            final parsed = jsonDecode(snapshot.data);
            List<Map<String, int>> errorTypeMaps = List();
            List<String> titles = [
              "system",
              "google_play_system_updates",
              "android_runtime",
              "mediatek",
              "qualcomm",
              "framework",
              "media_framework"
            ];
            List<Color> colorList = [
              ThemeColors.redCard,
              ThemeColors.orangeCard,
              ThemeColors.yellowOrangeCard,
              ThemeColors.yellowCard,
              ThemeColors.yellowCard, // TODO delete
              ThemeColors.yellowGreenCard,
              ThemeColors.GreenCard
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

            return Container(
              child: new ListView.builder(
                // TODO itemCount will be 6 after mediatek vs qualconn info
                itemCount: 7,
                itemBuilder: (_, index) => createCard(
                    errorTypeMaps[index], titles[index], colorList[index]),
              ),
            );
          } else {
            // TODO No data message can be added here
          }
          return Container();
        },
      ),
    ));
  }

  Container createCard(Map<String, int> data, String title, Color color) {
    return new Container(
      height: 120.0,
      margin: const EdgeInsets.only(top: 12.0, bottom: 12.0),
      child: new Stack(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(left: 20.0, right: 20.0),
            decoration: new BoxDecoration(
                color: color,
                shape: BoxShape.rectangle,
                borderRadius: new BorderRadius.circular(8.0)),
            child: FlatButton(
              onPressed: () {
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => StatusDetails(
                              errorType: title,
                            )));
              },
              child: new Container(
                margin: const EdgeInsets.only(top: 10.0, left: 10.0),
                constraints: new BoxConstraints.expand(),
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: customCard(title, data["Critical"].toString(),
                      data["High"].toString()),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  List<Widget> customCard(
      String title, String criticalValue, String highValue) {
    return <Widget>[
      new Text(titleNames[title], style: ThemeTextStyles.homeCardTitle),
      new Padding(padding: EdgeInsets.only(top: 5.0)),
      new Container(
        color: Colors.white,
        width: 50.0,
        height: 1.0,
      ),
      new Padding(padding: EdgeInsets.only(top: 10.0)),
      new Row(
        children: <Widget>[
          Text(
            "Critical\t",
            textAlign: TextAlign.left,
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 16.0),
          ),
          Padding(padding: EdgeInsets.only(right: 15.0)),
          Text(
            criticalValue,
            textDirection: TextDirection.ltr,
            textAlign: TextAlign.left,
            style: ThemeTextStyles.rowValue,
          )
        ],
      ),
      new Padding(padding: EdgeInsets.only(top: 5.0)),
      new Row(
        children: <Widget>[
          Text(
            "High\t\t\t\t\t",
            textAlign: TextAlign.left,
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 16.0),
          ),
          Padding(padding: EdgeInsets.only(right: 15.0)),
          Text(
            highValue,
            textDirection: TextDirection.ltr,
            textAlign: TextAlign.left,
            style: ThemeTextStyles.rowValue,
          )
        ],
      )
    ];
  }
}
