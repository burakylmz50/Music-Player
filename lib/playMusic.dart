import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:audioplayers/audio_cache.dart';




//
//  müzikleri switch içerisinde
//



typedef void OnError(Exception exception);

void main() {
  runApp(new MaterialApp(home: new playMusicPage()));
}

class playMusicPage extends StatefulWidget {
  @override
  _playMusicPageState createState() => _playMusicPageState();
}

class _playMusicPageState extends State<playMusicPage> {
  Duration _duration = new Duration();
  Duration _position = new Duration();
IconData icon=Icons.play_arrow;
bool deneme=true;

  AudioPlayer audioPlayer = new AudioPlayer();

  AudioPlayer advancedPlayer;
  AudioCache audioCache;
  bool isOpened = false;

  @override
  void initState() {
    super.initState();
    initPlayer();
  }

  void initPlayer() {
    advancedPlayer = new AudioPlayer();
    audioCache = new AudioCache(fixedPlayer: advancedPlayer);

    advancedPlayer.durationHandler = (d) => setState(() {
          _duration = d;
        });

    advancedPlayer.positionHandler = (p) => setState(() {
          _position = p;
        });
  }

  String localFilePath;

  Widget _tab(List<Widget> children) {
    return Center(
      child: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: children
              .map((w) => Container(child: w, padding: EdgeInsets.all(6.0)))
              .toList(),
        ),
      ),
    );
  }

  Widget _btn(String txt, VoidCallback onPressed) {
    return ButtonTheme(
        minWidth: 48.0,
        child: RaisedButton(child: Text(txt), onPressed: onPressed));
  }

  Widget slider() {
    return Slider(
        value: _position.inSeconds.toDouble(),
        min: 0.0,
        max: _duration.inSeconds.toDouble(),
        onChanged: (double value) {
          setState(() {
            seekToSecond(value.toInt());
            value = value;
          });
        });
  }

  Widget localAsset() {
    return _tab([
      CreateIconButton(Icons.play_arrow, Colors.purple, () {
        audioCache.play('deneme.mp3');
      }),
      CreateIconButton(Icons.stop, Colors.green, () {
        advancedPlayer.stop();
      }),
      slider()
    ]);
  }

  void seekToSecond(int second) {
    Duration newDuration = Duration(seconds: second);

    advancedPlayer.seek(newDuration);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('Play Music Page'),
          centerTitle: true,
        ),
        body: new Column(
          children: <Widget>[
            // 1. KISIM
            new Expanded(child: new Container()),

            // 2. KISIM

            // 3. KISIM

            new Container(   //TABBAR YAPILACAK 125 DEDİĞİM İÇİN SIKINTI VAR
              width: double.infinity,
              height: 125.0,
              color: Colors.yellow,
            ),
            new Container(
         //     color: Colors.yellow,
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0, bottom: 10.0),
                child: new Column(
                  children: <Widget>[
                    new Row(
                      children: <Widget>[
                        Expanded(

                            child: FloatingActionButton(
                                elevation: 0.0,
                                child: new Icon(icon),
                                backgroundColor: new Color(0xFFE57373),
                                onPressed: () {
                                  setState(() {
                                    if(deneme){
                                      audioCache.play('deneme.mp3');
                                      icon=Icons.pause;
                                      deneme=false;
                                    }
                                    else{
                                      advancedPlayer.pause();
                                      icon=Icons.play_arrow;
                                      deneme=true;
                                    }

                                  });

                                })),
                        Expanded(
                          child: slider(),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        )

/*


    body: Center(
        child: Container(
          color: Colors.red,
          child: Row(
            children: <Widget>[
              Expanded(
                child:CreateIconButton(Icons.play_arrow, Colors.purple, (){
                  audioCache.play('deneme.mp3');
                }),
              ),
              Expanded(
                child:CreateIconButton(Icons.stop, Colors.green, (){
                  advancedPlayer.stop();
                }),
              ),
              Expanded(
                child:slider(),
              ),
            ],
          ),
        )
    ),
  */
        );
  }

  Widget CreateIconButton(IconData icon, Color color, VoidCallback onPressed) {
    return IconButton(
      icon: Icon(icon),
      iconSize: 64,
      color: Colors.purple,
      onPressed: onPressed,
    );
  }
}
