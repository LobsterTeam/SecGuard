import 'package:flutter/material.dart';
import '../utils/theme.dart';
import 'package:device_info/device_info.dart';

class HomeTab extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeTabState();
  }
}

class _HomeTabState extends State<HomeTab> {
  bool loading = true;
  Map<String, String> deviceInfoMap = {};

  @override
  void initState() {
    getDeviceInfo();
  }

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return Center(
          child: CircularProgressIndicator(
              valueColor:
                  AlwaysStoppedAnimation<Color>(ThemeColors.redViolet)));
    } else {
      return new Container(
          child: new Stack(
        children: <Widget>[
          ListView.builder(
            itemCount: 2,
            itemBuilder: (_, index) => createCard(index),
          ),
          Container(
            margin: const EdgeInsets.all(15.0),
            child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: RaisedButton.icon(
                onPressed: () {
                  print('button click'); // TODO
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                label: Text('Check for Updates',
                    style: ThemeTextStyles.homeButtonTitle),
                icon: Icon(
                  Icons.download_rounded,
                  color: Colors.white,
                ),
                color: ThemeColors.redViolet,
              ),
            ),
          ),
        ],
      ));
    }
  }

  Future<Map<String, String>> getDeviceInfo() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    AndroidDeviceInfo androidDeviceInfo = await deviceInfo.androidInfo;

    deviceInfoMap["manufacturer"] = androidDeviceInfo.manufacturer;
    deviceInfoMap["model"] = androidDeviceInfo.model;
    deviceInfoMap["board"] = androidDeviceInfo.board;
    deviceInfoMap["hardware"] = androidDeviceInfo.hardware;
    deviceInfoMap["version"] = androidDeviceInfo.version.release;
    deviceInfoMap["API"] = androidDeviceInfo.version.sdkInt.toString();
    deviceInfoMap["secPatch"] = androidDeviceInfo.version.securityPatch;
    deviceInfoMap["googlePlaySecPatch"] =
        androidDeviceInfo.version.securityPatch; // TODO

    setState(() {
      loading = false;
    });
  }

  Container createCard(int type) {
    return new Container(
      height: type == 0 ? 160.0 : 140.0,
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
      new Text("Hardware", style: ThemeTextStyles.homeCardTitle),
      new Container(
        color: Colors.white,
        width: 100.0,
        height: 1.0,
      ),
      new Padding(padding: EdgeInsets.only(top: 10.0)),
      createRow("Manufacturer", deviceInfoMap["manufacturer"]),
      new Padding(padding: EdgeInsets.only(top: 5.0)),
      createRow("Model", deviceInfoMap["model"]),
      new Padding(padding: EdgeInsets.only(top: 5.0)),
      createRow("SoC vendor", deviceInfoMap["board"]),
      new Padding(padding: EdgeInsets.only(top: 5.0)),
      createRow("SoC model", deviceInfoMap["hardware"])
    ];
  }

  List<Widget> softwareWidgets() {
    return <Widget>[
      new Text("Software", style: ThemeTextStyles.homeCardTitle),
      new Container(
        color: Colors.white,
        width: 90.0,
        height: 1.0,
      ),
      new Padding(padding: EdgeInsets.only(top: 10.0)),
      createRow("Android Version",
          deviceInfoMap["version"] + " (API " + deviceInfoMap["API"] + ")"),
      new Padding(padding: EdgeInsets.only(top: 5.0)),
      createRow("Android Security Patch", deviceInfoMap["secPatch"]),
      new Padding(padding: EdgeInsets.only(top: 5.0)),
      createRow(
          "Google Play Security Patch", deviceInfoMap["googlePlaySecPatch"])
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
