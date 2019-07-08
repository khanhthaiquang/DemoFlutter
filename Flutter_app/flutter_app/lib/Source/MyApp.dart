import 'package:flutter/material.dart';

import 'Resource/loginPage.dart';

void main() => runApp(new Home());

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "This is first app",
      home: new MainPage(),
    );
  }
}