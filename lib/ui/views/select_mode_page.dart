//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SelectModePage extends StatelessWidget {
  const SelectModePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.cancel))),
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/background.png'),
                  fit: BoxFit.cover)),
          child: Center(
              child: Column(
            children: [
              Padding(
                  padding: EdgeInsets.only(top: 40, bottom: 5),
                  child: Image.asset('assets/images/logo_small.png',
                      width: 75, height: 75)),
              Text(
                'SELECT YOUR GAME MODE',
                style: TextStyle(
                    fontFamily: 'Asphaltic', fontSize: 40, color: Colors.white),
              ),
              GameModeRow(
                  image: Image.asset('assets/images/the_player_icon.png'),
                  heading: 'THE PLAYER',
                  text:
                      'The player is a user who actively participates in the game by posting "trickshots" in the different game modes'),
              GameModeRow(
                  imageLeft: false,
                  image: Image.asset('assets/images/the_gm_icon.png'),
                  heading: 'THE GM',
                  text:
                      'The player is a user who actively participates in the game by posting "trickshots" in the different game modes'),
              GameModeRow(
                  image: Image.asset('assets/images/the_scout_icon.png'),
                  heading: 'THE SCOUT',
                  text:
                      'The player is a user who actively participates in the game by posting "trickshots" in the different game modes'),
              // Container(
              //     padding: const EdgeInsets.only(top: 30, right: 20, left: 20),
              //     child: Row(children: [
              //       Image.asset('assets/images/the_player_icon.png'),
              //       Expanded(
              //           child: Column(children: [
              //         Text('THE PLAYER',
              //             style: TextStyle(
              //                 fontFamily: 'Asphaltic',
              //                 fontSize: 30,
              //                 color: Colors.white)),
              //         Container(
              //             padding: const EdgeInsets.only(left: 20, right: 20),
              //             child: Text(
              //                 'The player is a user who actively participates in the game by posting "trickshots" in the different game modes',
              //                 softWrap: true,
              //                 style: TextStyle(color: Colors.white)))
              //       ]))
              //     ])),
            ],
          )),
        ));
  }
}

class GameModeRow extends StatelessWidget {
  // final Widget child;
  // final GestureTapCallback onPressed;
  final Image image;
  final String heading;
  final String text;
  bool imageLeft;
  GameModeRow(
      {required this.image,
      required this.heading,
      required this.text,
      this.imageLeft: true});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(top: 30, right: 20, left: 20),
        child: imageLeft
            ? Row(children: [
                image,
                Expanded(
                    child: Column(children: [
                  Text(heading,
                      style: TextStyle(
                          fontFamily: 'Asphaltic',
                          fontSize: 30,
                          color: Colors.white)),
                  Container(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Text(text,
                          softWrap: true,
                          style: TextStyle(color: Colors.white)))
                ]))
              ])
            : Row(children: [
                Expanded(
                    child: Column(children: [
                  Text(heading,
                      style: TextStyle(
                          fontFamily: 'Asphaltic',
                          fontSize: 30,
                          color: Colors.white)),
                  Container(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Text(text,
                          softWrap: true,
                          style: TextStyle(color: Colors.white)))
                ])),
                image
              ]));
  }
}
