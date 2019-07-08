import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter_app/Source/Resource/DrawerMenu.dart';



class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new HomeStage();
  }
}

class HomeStage extends State<HomePage> {
  final _words = <WordPair>[];
  final checkedWord = new Set<WordPair>();
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('List of english word'),
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.add), onPressed: _pushToAddScreen)
        ],
      ),
      body: new ListView.builder(itemBuilder: (context, index) {
        if (index >= _words.length) {
          _words.addAll(generateWordPairs().take(10));
        }
        return _buildRow(_words[index], index);
      }),
      drawer: new DrawerMenu().buildDrawer(context),
    );
  }

  _pushToAddScreen() {
    final pageRoute = new MaterialPageRoute(builder: (context) {
      final listTitles = checkedWord.map((_words) {
        return new ListTile(
          title: new Text(
            _words.asUpperCase,
            style: new TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
        );
      });
      return new Scaffold(
        appBar: new AppBar(
          title: new Text('Checked Words'),
        ),
        body: new ListView(
          children: listTitles.toList(),
        ),
      );
    });
    Navigator.of(context).push(pageRoute);
  }

  Widget _buildRow(WordPair wordPair, int index) {
    final color = index % 2 == 0 ? Colors.red : Colors.blue;
    final isCheck = checkedWord.contains(wordPair);
    return new ListTile(
      leading:
      new Icon(isCheck ? Icons.check_box : Icons.check_box_outline_blank),
      title: new Text(wordPair.asUpperCase,
          style: new TextStyle(fontSize: 20.0, color: color)),
      onTap: () {
        setState(() {
          if (isCheck) {
            checkedWord.remove(wordPair);
          } else {
            checkedWord.add(wordPair);
          }
        });
      },
    );
  }
}


