import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sec_guard/utils/app_bar.dart';
import 'package:sec_guard/utils/theme.dart';

class StatusDetails extends StatefulWidget {
  StatusDetails({Key key, this.errorType}) : super(key: key);

  final String errorType;

  @override
  State<StatefulWidget> createState() {
    return _StatusDetailsState();
  }
}

class _StatusDetailsState extends State<StatusDetails> {
  // TODO Control the Android version
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
              final parsed = jsonDecode(snapshot.data);
              List<Map<String, String>> errorList = List();

              for (int i = 0;
                  i < parsed["2020-11-01"][widget.errorType].length;
                  i++) {
                if (widget.errorType != "google_play_system_updates") {
                  Map<String, String> map = {
                    "code": parsed["2020-11-01"][widget.errorType][i.toString()]
                        ["code"],
                    "details": "Type: " +
                        parsed["2020-11-01"][widget.errorType][i.toString()]
                            ["type"] +
                        "\nSeverity: " +
                        parsed["2020-11-01"][widget.errorType][i.toString()]
                            ["severity"] +
                        "\nUpdated Version: " +
                        parsed["2020-11-01"][widget.errorType][i.toString()]
                            ["updated_versions"] +
                        "\nDescription: " +
                        parsed["2020-11-01"][widget.errorType][i.toString()]
                            ["detailed_description"],
                  };
                  errorList.add(map);
                } else if (widget.errorType == "google_play_system_updates") {
                  Map<String, String> map = {
                    "code": parsed["2020-11-01"][widget.errorType][i.toString()]
                            ["name"] +
                        " - " +
                        parsed["2020-11-01"][widget.errorType][i.toString()]
                            ["code"],
                    "details": "Updated Version: " +
                        parsed["2020-11-01"][widget.errorType][i.toString()]
                            ["updated_versions"] +
                        "\nDescription: " +
                        parsed["2020-11-01"][widget.errorType][i.toString()]
                            ["detailed_description"],
                  };
                  errorList.add(map);
                }
              }

              return Container(
                child: new ListView.builder(
                  itemExtent: 280.0, //300.0,
                  itemCount: errorList.length,
                  itemBuilder: (_, index) => createCard(
                      errorList[index]["code"],
                      errorList[index]["details"],
                      Colors.black87),
                ),
              );
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
      margin: const EdgeInsets.only(top: 20.0),
      child: new Stack(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(left: 20.0, right: 20.0),
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
          Flexible(
              child: Text(
            details,
            textAlign: TextAlign.left,
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 16.0),
          )),
          Padding(padding: EdgeInsets.only(right: 5.0)),
        ],
      ),
    ];
  }
}
