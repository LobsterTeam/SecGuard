import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sec_guard/utils/theme.dart';

class SupportTab extends StatelessWidget {
  SupportTab();

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new ListView.builder(
        itemExtent: 200.0,
        itemCount: 3,
        itemBuilder: (_, index) => createCard(index),
      ),
    );
  }

  Container createCard(int type) {
    return new Container(
      height: 200.0,
      margin: const EdgeInsets.only(top: 20.0, bottom: 8.0),
      child: new Stack(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(left: 20.0, right: 20.0),
            decoration: new BoxDecoration(
                color: ThemeColors.lightRedViolet,
                shape: BoxShape.rectangle,
                borderRadius: new BorderRadius.circular(8.0)),
            child: new Container(
              margin: const EdgeInsets.only(top: 16.0, left: 16.0),
              constraints: new BoxConstraints.expand(),
              child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: getWidgets(type)),
            ),
          )
        ],
      ),
    );
  }

  List<Widget> getWidgets(type) {
    if (type == 0)
      return vendorWidgets();
    else if (type == 1)
      return callWidgets();
    else if (type == 2) return mailWidgets();
  }

  List<Widget> vendorWidgets() {
    return <Widget>[
      new Text("Access Your Phone Vendor",
          style: ThemeTextStyles.homeCardTitle),
      new Container(
        color: Colors.white,
        width: 270.0,
        height: 1.0,
      ),
      new Padding(padding: EdgeInsets.only(top: 5.0)),
      new Row(
        children: <Widget>[
          Flexible(
              child:
              Text(
            "\u2022 You can always call or mail your vendor for security updates",
            textDirection: TextDirection.ltr,
            textAlign: TextAlign.left,
            style: ThemeTextStyles.rowKey,
          ))
        ],
      ),
      new Padding(padding: EdgeInsets.only(top: 5.0)),
      new Row(
        children: <Widget>[
          Text(
            "E-mail",
            textAlign: TextAlign.left,
            style: ThemeTextStyles.rowKey,
          ),
          Padding(padding: EdgeInsets.only(right: 15.0)),
          Text(
            "samsung@samsung.com",
            textDirection: TextDirection.ltr,
            textAlign: TextAlign.left,
            style: ThemeTextStyles.rowValue,
          )
        ],
      ),
      new Padding(
        padding: EdgeInsets.only(top: 5.0),
      ),
      new Row(
        children: <Widget>[
          Text(
            "Phone",
            textAlign: TextAlign.left,
            style: ThemeTextStyles.rowKey,
          ),
          Padding(padding: EdgeInsets.only(right: 15.0)),
          Text(
            "+90 565 654 41 23",
            textDirection: TextDirection.ltr,
            textAlign: TextAlign.left,
            style: ThemeTextStyles.rowValue,
          )
        ],
      ),
      new Align(
        alignment: Alignment.bottomRight,
        heightFactor: 0.5,
        child: FlatButton(
          onPressed: () {},
            color: Colors.transparent,
          child: Column( // Replace with a Row for horizontal icon + text
            children: <Widget>[
              Icon(Icons.phone, color: Colors.white,)
            ],
          )
        ),
      )
    ];
  }

  List<Widget> callWidgets() {
    return <Widget>[
      new Text("Call Us",
          style: ThemeTextStyles.homeCardTitle),
      new Container(
        color: Colors.white,
        width: 70.0,
        height: 1.0,
      ),
      new Padding(padding: EdgeInsets.only(top: 5.0)),
      new Row(
        children: <Widget>[
          Flexible(
              child: Text(
                "\u2022 Ask anything about security questions",
                textDirection: TextDirection.ltr,
                textAlign: TextAlign.left,
                style: ThemeTextStyles.rowKey,
              ))
        ],
      ),
      new Padding(padding: EdgeInsets.only(top: 5.0)),
      new Row(
        children: <Widget>[
          Flexible(
              child: Text(
                "\u2022 Purchase security tests",
                textDirection: TextDirection.ltr,
                textAlign: TextAlign.left,
                style: ThemeTextStyles.rowKey,
              ))
        ],
      ),
      new Padding(padding: EdgeInsets.only(top: 5.0)),
      new Row(
        children: <Widget>[
          Flexible(
              child: Text(
                "\u2022 Connect to vendor specialists",
                textDirection: TextDirection.ltr,
                textAlign: TextAlign.left,
                style: ThemeTextStyles.rowKey,
              ))
        ],
      ),
      new Padding(padding: EdgeInsets.only(top: 5.0)),
      new Row(
        children: <Widget>[
          Text(
            "Phone",
            textAlign: TextAlign.left,
            style: ThemeTextStyles.rowKey,
          ),
          Padding(padding: EdgeInsets.only(right: 15.0)),
          Text(
            "+90 565 654 41 23",
            textDirection: TextDirection.ltr,
            textAlign: TextAlign.left,
            style: ThemeTextStyles.rowValue,
          )
        ],
      ),
      new Align(
        alignment: Alignment.bottomRight,
        heightFactor: 0.5,
        child: FlatButton(
            onPressed: () {},
            color: Colors.transparent,
            child: Column( // Replace with a Row for horizontal icon + text
              children: <Widget>[
                Icon(Icons.phone, color: Colors.white,)
              ],
            )
        ),
      )
    ];
  }

  List<Widget> mailWidgets() {
    return <Widget>[
      new Text("Mail Us",
          style: ThemeTextStyles.homeCardTitle),
      new Container(
        color: Colors.white,
        width: 70.0,
        height: 1.0,
      ),
      new Padding(padding: EdgeInsets.only(top: 5.0)),
      new Row(
        children: <Widget>[
          Flexible(
              child: Text(
                "\u2022 Ask anything about security questions",
                textDirection: TextDirection.ltr,
                textAlign: TextAlign.left,
                style: ThemeTextStyles.rowKey,
              ))
        ],
      ),
      new Padding(padding: EdgeInsets.only(top: 5.0)),
      new Row(
        children: <Widget>[
          Flexible(
              child: Text(
                "\u2022 Purchase security tests",
                textDirection: TextDirection.ltr,
                textAlign: TextAlign.left,
                style: ThemeTextStyles.rowKey,
              ))
        ],
      ),
      new Padding(padding: EdgeInsets.only(top: 5.0)),
      new Row(
        children: <Widget>[
          Text(
            "E-mail",
            textAlign: TextAlign.left,
            style: ThemeTextStyles.rowKey,
          ),
          Padding(padding: EdgeInsets.only(right: 15.0)),
          Text(
            "info@secguard.com",
            textDirection: TextDirection.ltr,
            textAlign: TextAlign.left,
            style: ThemeTextStyles.rowValue,
          )
        ],
      ),
      new Align(
        alignment: Alignment.bottomRight,
        heightFactor: 0.5,
        child: FlatButton(
            onPressed: () {},
            color: Colors.transparent,
            child: Column( // Replace with a Row for horizontal icon + text
              children: <Widget>[
                Icon(Icons.email_outlined, color: Colors.white,)
              ],
            )
        ),
      )
    ];
  }

  Row createRow(String key, String value) {
    return new Row(
      children: <Widget>[
        Text(
          key,
          textAlign: TextAlign.left,
          style: ThemeTextStyles.rowKey,
        ),
        Padding(padding: EdgeInsets.only(right: 15.0)),
        Text(
          value,
          textDirection: TextDirection.ltr,
          textAlign: TextAlign.left,
          style: ThemeTextStyles.rowValue,
        )
      ],
    );
  }


}

class MyBullet extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 5.0,
      width: 5.0,
      decoration: new BoxDecoration(
        color: Colors.black,
        shape: BoxShape.circle,
      ),
    );
  }
}
