import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:audioplayers/audio_cache.dart';

void main() {
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MyApp());
  }
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  static AudioPlayer player = new AudioPlayer();
  AudioCache music = new AudioCache(fixedPlayer: player);
  bool isplaying = false;
  bool stop = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          Icon(Icons.search),
        ],
        backgroundColor: Colors.blue,
        leading: Icon(Icons.music_note),
        title: Text(" My Audio"),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage("images/music.jpg"),fit: BoxFit.fill)),
          ),
          Column(
            children: <Widget>[
              InkWell(
                onTap: () => print("hi"),
                child: Container(
                  margin: EdgeInsets.all(90.0),
                  width: 1200,
                  height: 250,
                  decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage("images/hi.jpg"),fit: BoxFit.contain),
                    borderRadius: BorderRadius.circular(300.0),
                    
                  ),
                ),
              ),
              Row(
                
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(bottom: 100.0,left: 10.0),
                     height: 70.0,
                      width: 80.0,
                    color: Colors.grey,
                    /*child: Ink(
                      decoration: ShapeDecoration(
                          color: Colors.orange, shape: CircleBorder()),*/
                      child: IconButton(
                        icon: Icon(Icons.play_circle_filled),
                        onPressed: () {
                          if (isplaying == false || stop == true) {
                            music.play("note1.wav");
                            stop = false;
                            isplaying = true;
                          }
                        },
                      ),
                  ),
                  Container(
                      margin: EdgeInsets.only(bottom: 100.0,left: 30.0),
                      height: 70.0,
                      width: 80.0,
                      color: Colors.grey,
                      child: Ink(
                          decoration: ShapeDecoration(
                              color: Colors.orange, shape: CircleBorder()),
                          child: IconButton(
                              icon: Icon(Icons.pause_circle_filled),
                              onPressed: () {
                                if (isplaying == true) {
                                  player.pause();
                                  isplaying = false;
                                }
                              }))),
                  Container(
                     height: 70.0,
                      width: 80.0,
                      margin: EdgeInsets.only(left: 30.0,bottom: 100.0),
                      color: Colors.grey,
                      child: Ink(
                          decoration: ShapeDecoration(
                              color: Colors.orange, shape: CircleBorder()),
                          child: IconButton(
                              icon: Icon(Icons.stop),
                              onPressed: () {
                                if (isplaying == true || stop == false) {
                                  player.stop();
                                  stop = true;
                                  isplaying = false;
                                }
                              })))
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
