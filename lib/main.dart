import 'package:flutter/material.dart';
import './songs.dart';

import './songs.dart' as songs;
import './playMusic.dart' as playMusic;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  TabController controller;

  @override
  void initState() {
    controller = new TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.purple[200],
        title: new Text('menu'),
        bottom: new TabBar(
          controller: controller,
          tabs: <Widget>[
            new Tab(
              icon: new Icon(
                Icons.play_circle_filled,
                size: 30,
              ),
              text: "Music Player",
            ),
            new Tab(
              icon: new Icon(
                Icons.headset,
                size: 30,
              ),
              text: "Songs",
            ),
          ],
        ),
      ),
      body: new TabBarView(
        controller: controller,
        children: <Widget>[
          new playMusic.playMusicPage(),
          new songs.songsPage(),
        ],
      ),
      drawer: new Drawer(
          child: ListView(children: [
        Ink(
          color: Colors.red,
          child: ListTile(
            title: Text('deneme'),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (BuildContext context) => new songsPage()));
            },
          ),
        )
      ])),
    );
  }
}
