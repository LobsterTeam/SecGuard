import 'package:flutter/material.dart';
import '../utils/theme.dart';

class HomeTab extends StatelessWidget {
  HomeTab();

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new ListView.builder(
        itemExtent: 160.0,
        itemCount: 2,
        itemBuilder: (_, index) => createCard(index),
      ),
    );
  }

  Container createCard(int type) {
    return new Container(
      height: 120.0,
      margin: const EdgeInsets.only(top: 20.0, bottom: 8.0),
      child: new Stack(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(left: 20.0, right: 20.0),
            decoration: new BoxDecoration(
                color: ThemeColors.lightRedViolet,
                shape: BoxShape.rectangle,
                borderRadius: new BorderRadius.circular(8.0)
            ),
            child: new Container(
              margin: const EdgeInsets.only(top: 16.0, left: 16.0),
              constraints: new BoxConstraints.expand(),
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: type == 0 ? hardwareWidgets() : softwareWidgets(),
              ),
            ),
          )
        ],
      ),
    );
  }

  List<Widget> hardwareWidgets() {
    return <Widget>[
      new Text(
          "Hardware",
          style: ThemeTextStyles.homeCardTitle
      ),
      new Container(
        color: Colors.white,
        width: 100.0,
        height: 1.0,
      ),
      new Padding(padding: EdgeInsets.only(top: 5.0)),
      new Row(
        children: <Widget>[
          Text(
            "key",
            textAlign: TextAlign.left,
            style: ThemeTextStyles.rowKey,
          ),
          Padding(padding: EdgeInsets.only(right: 15.0)),
          Text(
            "value",
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
            "key",
            textAlign: TextAlign.left,
            style: ThemeTextStyles.rowKey,
          ),
          Padding(padding: EdgeInsets.only(right: 15.0)),
          Text(
            "value",
            textDirection: TextDirection.ltr,
            textAlign: TextAlign.left,
            style: ThemeTextStyles.rowValue,
          )
        ],
      )
    ];
  }

  List<Widget> softwareWidgets() {
    return <Widget>[
      new Text(
          "Software",
          style: ThemeTextStyles.homeCardTitle
      ),
      new Container(
        color: Colors.white,
        width: 90.0,
        height: 1.0,
      ),
      new Padding(padding: EdgeInsets.only(top: 5.0)),
      new Row(
        children: <Widget>[
          Text(
            "key",
            textAlign: TextAlign.left,
            style: ThemeTextStyles.rowKey,
          ),
          Padding(padding: EdgeInsets.only(right: 15.0)),
          Text(
            "value",
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
            "key",
            textAlign: TextAlign.left,
            style: ThemeTextStyles.rowKey,
          ),
          Padding(padding: EdgeInsets.only(right: 15.0)),
          Text(
            "value",
            textDirection: TextDirection.ltr,
            textAlign: TextAlign.left,
            style: ThemeTextStyles.rowValue,
          )
        ],
      )
    ];
  }
}