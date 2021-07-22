import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';
import 'package:video_player/video_player.dart';

class PublishSessionPage extends StatefulWidget {
  final String videoPath;
  PublishSessionPage({Key? key, required this.videoPath}) : super(key: key);

  @override
  _PublishSessionPageState createState() => _PublishSessionPageState();
}

class _PublishSessionPageState extends State<PublishSessionPage> {
  late VideoPlayerController _controller;
  bool isFavorited = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.file(File(widget.videoPath));

    _controller.addListener(() {
      setState(() {});
    });
    _controller.setLooping(true);
    _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
            toolbarHeight: 32,
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
            child: SafeArea(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Center(
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Container(
                            height: MediaQuery.of(context).size.height / 3,
                            child: AspectRatio(
                                aspectRatio: _controller.value.aspectRatio,
                                child: VideoPlayer(_controller))))),
                NameInputField(),
                TagsInputField(),
                ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Theme.of(context).accentColor)),
                    onPressed: null,
                    child: Text('PUT ME IN THE FIELD',
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.black,
                            fontFamily: 'Asphaltic')))
              ],
            ))));
  }
}

class NameInputField extends StatelessWidget {
  const NameInputField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text('NAME YOUR TRICKSHOT',
          style: TextStyle(
              fontSize: 30, color: Colors.white, fontFamily: 'Asphaltic')),
      Container(
        alignment: Alignment.center,
        child: Container(
          width: 300,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                  width: 1, color: Colors.purple, style: BorderStyle.solid)),
          child: TextField(
            textAlign: TextAlign.center,
            decoration: InputDecoration(
                hintText: 'Name',
                contentPadding: EdgeInsets.all(15),
                border: InputBorder.none),
            onChanged: (value) {},
          ),
        ),
      ),
    ]);
  }
}

class TagsInputField extends StatelessWidget {
  const TagsInputField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text('ADD SKILLSTAGS',
          style: TextStyle(
              fontSize: 30, color: Colors.white, fontFamily: 'Asphaltic')),
      Container(
          width: 300,
          height: 110,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.1),
            borderRadius: BorderRadius.circular(20),
          )),
    ]);
  }
}
