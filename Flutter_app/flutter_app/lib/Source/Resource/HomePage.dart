import 'package:flutter/material.dart';
import 'package:flutter_app/Source/Resource/DrawerMenu.dart';
import 'package:flutter_app/Source/Resource/Model/DeviceData.dart';
import 'ItemListview/ItemInfoDevice.dart';
import 'package:material_search_bar/material_search_bar.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new HomeStage();
  }
}

class HomeStage extends State<HomePage> {
  final _device = <DeviceData>[
    new DeviceData("SamSung GalaxyS6", "Thai Quang Khanh",
        AssetImage("assets/images/profile.jpg")),
    new DeviceData(
        "Iphone 8", "Võ Thiện Chương", AssetImage("assets/images/profile.jpg")),
    new DeviceData(
        "Iphone 5s", "Lâm Công Đỉnh ", AssetImage("assets/images/profile.jpg")),
    new DeviceData(
        "Iphone X", "Trần Văn Sắt", AssetImage("assets/images/profile.jpg"))
  ];
//  final checkedWord = new Set<WordPair>();
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('List Device'),
        actions: <Widget>[
          new IconButton(
              icon: new Icon(Icons.search), onPressed: () {
          })
        ],
      ),
      body:
      new ListView.builder(
          itemCount: _device.length,
          itemBuilder: (context, index) {
            return _buildRow(_device[index]);
          }),
      drawer: new DrawerMenu().buildDrawer(context),
      floatingActionButton: new FloatingActionButton(
        onPressed: () {
          _pushToAddScreen();
        },
        child: Icon(Icons.add),
      ),
    );
  }

  _pushToAddScreen() {
    final pageRoute = new MaterialPageRoute(builder: (context) {
      return new Scaffold(
          appBar: new AppBar(
            title: new Text('Checked Words'),
          ),
          body: Text("dafadf"));
    });
    Navigator.of(context).push(pageRoute);
  }

  _openSearchBar() {

  }
  Card _buildRow(DeviceData device) {
    return ItemDevice(device).buildItemDevice();
  }
}
