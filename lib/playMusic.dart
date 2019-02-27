import 'package:flutter/material.dart';

class playMusicPage extends StatefulWidget {
  @override
  _playMusicPageState createState() => _playMusicPageState();
}

class _playMusicPageState extends State<playMusicPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Play Music Page'),
      ),
    );
  }
}
