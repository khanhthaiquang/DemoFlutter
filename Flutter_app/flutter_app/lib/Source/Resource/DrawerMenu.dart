import 'package:flutter/material.dart';
import 'loginPage.dart';

class DrawerMenu {
  Drawer buildDrawer(context) {
    return new Drawer(
      child: new ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          new Container(
            child: UserAccountsDrawerHeader(
                currentAccountPicture: new CircleAvatar(
                  backgroundImage: AssetImage("assets/images/profile.jpg"),
                  backgroundColor: Colors.transparent,
                ),
                accountName: new Text("Thái Quang "),
                accountEmail: new Text("khanhthaiquang96@gmail.com")),
          ),
          new Column(
            children: <Widget>[
              new ListTile(
                leading: Icon(Icons.info),
                title: Text("My info"),
                onTap: (){
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
