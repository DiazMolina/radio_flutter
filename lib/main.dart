import 'package:flutter/material.dart';
import 'package:fluttery_audio/fluttery_audio.dart';

void main() {
  runApp(MaterialApp(
    title: "radio",
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  AudioPlayer audioPlayer;

  @override
  void initState() {
    super.initState();
    audioPlayer = FlutteryAudio.audioPlayer();
  }

  void _onradio() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text(
            "¿You want to activate the radio?",
            style: new TextStyle(color: Colors.black.withOpacity(0.6)),
          ),
          actions: <Widget>[
            new FlatButton(
              child: new Text("Yes"),
              onPressed: () {
                audioPlayer.loadMedia(
                    Uri.parse("http://stream01051.westreamradio.com/wsm3-mp3"));
                audioPlayer.play();
                Navigator.of(context).pop();
              },
            ),
            new FlatButton(
              child: new Text("No"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _offradio() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text(
            "¿You want to deactivate the radio ?",
            style: new TextStyle(color: Colors.black.withOpacity(0.6)),
          ),
          actions: <Widget>[
            new FlatButton(
              child: new Text("Yes"),
              onPressed: () {
                audioPlayer.stop();
                Navigator.of(context).pop();
              },
            ),
            new FlatButton(
              child: new Text("No"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          FlatButton.icon(
              onPressed: _onradio,
              icon: Icon(Icons.radio),
              label: Text("radio on")),
          SizedBox(height: 10.0),
          FlatButton.icon(
              onPressed: _offradio,
              icon: Icon(Icons.laptop),
              label: Text("radio off"))
        ],
      ),
    );
  }
}
