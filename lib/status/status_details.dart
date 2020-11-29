import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sec_guard/utils/app_bar.dart';
import 'package:sec_guard/utils/theme.dart';

class StatusDetails extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StatusDetailsState();
  }
}

class _StatusDetailsState extends State<StatusDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: app_bar(),
      body: Center(
        child: FutureBuilder(
          future:
              DefaultAssetBundle.of(context).loadString("assets/android.json"),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              /// No problem
              final parsed = jsonDecode(snapshot.data);

              /// TODO "android_runtime will be passed to this function from previous function
              //print(parsed["2020-11-01"]["android_runtime"]);
              List<Map<String, String>> errorList = List();

              for (int i = 0;
                  i < parsed["2020-11-01"]["android_runtime"].length;
                  i++) {
                print(parsed["2020-11-01"]["android_runtime"][i.toString()]
                    ["code"]);
                Map<String, String> map = {
                  "code": parsed["2020-11-01"]["android_runtime"][i.toString()]
                      ["code"],
                  "details": "• Type: " +
                      parsed["2020-11-01"]["android_runtime"][i.toString()]
                          ["type"] +
                      "\n• Severity: " +
                      parsed["2020-11-01"]["android_runtime"][i.toString()]
                          ["severity"] +
                      "\n• Updated Version: " +
                      parsed["2020-11-01"]["android_runtime"][i.toString()]
                          ["updated_versions"] +
                      "\n• Description: " +
                      parsed["2020-11-01"]["android_runtime"][i.toString()]
                          ["detailed_description"],
                };
                errorList.add(map);
                return Container(
                  child: new ListView.builder(
                    itemExtent: 160.0,
                    itemCount: errorList.length,
                    itemBuilder: (_, index) => createCard(
                        errorList[index]["code"],
                        errorList[index]["details"],
                        Colors.black),
                  ),
                );
              }
              print(errorList);
              return Container();
            } else {
              /// TODO Error widget can be added
              return Center();
            }
          },
        ),
      ),
    );
  }

  Container createCard(String title, String details, Color color) {
    return new Container(
      height: 120.0,
      margin: const EdgeInsets.only(top: 20.0, bottom: 8.0),
      child: new Stack(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(),
            decoration: new BoxDecoration(
                color: color,
                shape: BoxShape.rectangle,
                borderRadius: new BorderRadius.circular(8.0)),
            child: new Container(
              margin: const EdgeInsets.only(top: 16.0, left: 16.0),
              constraints: new BoxConstraints.expand(),
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: customCard(title, details),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> customCard(String title, String details) {
    return <Widget>[
      new Text(title, style: ThemeTextStyles.homeCardTitle),
      new Container(
        color: Colors.white,
        width: 100.0,
        height: 1.0,
      ),
      new Padding(padding: EdgeInsets.only(top: 5.0)),
      new Row(
        children: <Widget>[
          Text(
            details,
            textAlign: TextAlign.left,
            style: TextStyle(
                color:
          /*Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 16.0),0*/
          ),
          Padding(padding: EdgeInsets.only(right: 15.0)),
          /*Text(
            criticalValue,
            textDirection: TextDirection.ltr,
            textAlign: TextAlign.left,
            style: ThemeTextStyles.rowValue,
          )*/
        ],
      ),
      /*new Padding(padding: EdgeInsets.only(top: 5.0)),
      new Row(
        children: <Widget>[
          Text(
            "• High:\t\t\t\t\t",
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
      )*/
    ];
  }
}
