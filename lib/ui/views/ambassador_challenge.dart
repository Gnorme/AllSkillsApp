import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class AmbassadorChallenge extends StatelessWidget {
  const AmbassadorChallenge({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
            flexibleSpace: Padding(
                padding: EdgeInsets.only(top: 35, left: 10),
                child: Row(children: [
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('NICK SUZUKI - Top Post Challenge',
                            style: TextStyle(
                                fontFamily: 'Asphaltic',
                                fontSize: 30,
                                color: Colors.white)),
                        Container(height: 5),
                        Text('1st Place:',
                            style: TextStyle(
                                fontFamily: 'Georgia',
                                fontSize: 20,
                                color: Colors.white)),
                        Container(height: 3),
                        Text('2nd Place:',
                            style: TextStyle(
                                fontFamily: 'Georgia',
                                fontSize: 20,
                                color: Colors.white)),
                        Container(height: 3),
                        Text('3rd Place:',
                            style: TextStyle(
                                fontFamily: 'Georgia',
                                fontSize: 20,
                                color: Colors.white))
                      ]),
                  Expanded(
                      child: Column(children: [
                    Align(
                        alignment: Alignment.topRight,
                        child: InkWell(
                            onTap: (() {
                              Navigator.of(context).pop();
                            }),
                            child: Padding(
                                padding: EdgeInsets.only(
                                    right: 10, bottom: 5, left: 10),
                                child:
                                    Icon(Icons.cancel, color: Colors.white)))),
                    Center(
                        child: Container(
                            width: 86,
                            height: 86,
                            decoration: new BoxDecoration(
                                // Circle shape
                                shape: BoxShape.circle,
                                //color: Theme.of(context).accentColor,
                                // The border you want
                                border: new Border.all(
                                  width: 1.0,
                                  color: Theme.of(context).accentColor,
                                ),
                                // The shadow you want
                                boxShadow: [
                                  new BoxShadow(
                                    color: Theme.of(context)
                                        .accentColor
                                        .withOpacity(0.6),
                                    blurRadius: 10.0,
                                  ),
                                ]),
                            child: CircleAvatar(
                                backgroundColor: Colors.black,
                                radius: 42,
                                child: Center(
                                    child: CircleAvatar(
                                        radius: 40,
                                        backgroundImage: AssetImage(
                                            'assets/images/nick_suzuki.jpg'))))))
                  ]))
                ])),
            // Padding(
            //     padding: EdgeInsets.only(top: 10),
            //     child: Row(
            //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //         children: [
            //           Column(
            //             children: [
            //               Text('1st Place:'),
            //               Text('2nd Place:'),
            //               Text('3rd Place:'),
            //             ],
            //           ),
            //           Padding(
            //               padding: EdgeInsets.only(right: 30),
            //               child: CircleAvatar(
            //                   radius: 40,
            //                   backgroundImage: AssetImage(
            //                       'assets/images/nick_suzuki.jpg')))
            //         ]))
            titleSpacing: 0,
            leadingWidth: 32,
            toolbarHeight: 190,
            shadowColor: Theme.of(context).accentColor,
            shape: TopSheetBorder(size: size),
            backgroundColor: Theme.of(context).primaryColor,
            elevation: 4,
            leading: Container()),
        // leading: Padding(
        //     padding: EdgeInsets.only(bottom: 25),
        //     child: Align(
        //         alignment: Alignment.bottomLeft,
        //         child: IconButton(
        //             onPressed: () {
        //               Navigator.pop(context);
        //             },
        //             icon: Icon(Icons.cancel))))),
        body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/background.png'),
                    fit: BoxFit.cover)),
            child: SafeArea(
                child: Column(children: [
              Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Text(
                      'Praesentium dolorem illo molestias ex dolore saepe eligendi voluptas. Ipsum aut quia vel nam. Ipsam odio consequatur officiis. Sunt aut ad aut et dignissimos cum ut natus.',
                      softWrap: true,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 16))),
              Card(
                  color: Theme.of(context).primaryColor,
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0)),
                  child: Padding(
                      padding: EdgeInsets.all(10), child: AmbassadorVideo())),
              Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: ElevatedButton(
                      onPressed: null,
                      style: ButtonStyle(
                          padding:
                              MaterialStateProperty.all<EdgeInsetsGeometry>(
                                  EdgeInsets.only(
                                      top: 7, bottom: 7, left: 12, right: 12)),
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Theme.of(context).accentColor)),
                      child: Text('PARTICIPATE NOW',
                          style: TextStyle(
                              fontFamily: 'Asphaltic',
                              color: Colors.black,
                              fontSize: 36))))
            ]))));
  }
}

class AmbassadorVideo extends StatefulWidget {
  AmbassadorVideo({Key? key}) : super(key: key);

  @override
  _AmbassadorVideoState createState() => _AmbassadorVideoState();
}

class _AmbassadorVideoState extends State<AmbassadorVideo> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
        'https://sample-videos.com/video123/mp4/720/big_buck_bunny_720p_1mb.mp4',
        videoPlayerOptions: VideoPlayerOptions(mixWithOthers: false));

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
    return Container(
        child: AspectRatio(
      aspectRatio: 16 / 9,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          VideoPlayer(_controller),
          ClosedCaption(text: _controller.value.caption.text),
          _ControlsOverlay(controller: _controller),
          VideoProgressIndicator(_controller, allowScrubbing: true),
        ],
      ),
    ));
  }
}

class _ControlsOverlay extends StatelessWidget {
  const _ControlsOverlay({Key? key, required this.controller})
      : super(key: key);

  static const _examplePlaybackRates = [
    0.25,
    0.5,
    1.0,
    1.5,
    2.0,
    3.0,
    5.0,
    10.0,
  ];

  final VideoPlayerController controller;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AnimatedSwitcher(
          duration: Duration(milliseconds: 50),
          reverseDuration: Duration(milliseconds: 200),
          child: controller.value.isPlaying
              ? SizedBox.shrink()
              : Container(
                  color: Colors.black26,
                  child: Center(
                    child: Icon(
                      Icons.play_arrow,
                      color: Colors.white,
                      size: 100.0,
                    ),
                  ),
                ),
        ),
        GestureDetector(
          onTap: () {
            controller.value.isPlaying ? controller.pause() : controller.play();
          },
        ),
        Align(
          alignment: Alignment.topRight,
          child: PopupMenuButton<double>(
            initialValue: controller.value.playbackSpeed,
            tooltip: 'Playback speed',
            onSelected: (speed) {
              controller.setPlaybackSpeed(speed);
            },
            itemBuilder: (context) {
              return [
                for (final speed in _examplePlaybackRates)
                  PopupMenuItem(
                    value: speed,
                    child: Text('${speed}x'),
                  )
              ];
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(
                // Using less vertical padding as the text is also longer
                // horizontally, so it feels like it would need more spacing
                // horizontally (matching the aspect ratio of the video).
                vertical: 12,
                horizontal: 16,
              ),
              child: Text('${controller.value.playbackSpeed}x'),
            ),
          ),
        ),
      ],
    );
  }
}

class TopSheet extends StatelessWidget {
  const TopSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
        height: 210,
        decoration: ShapeDecoration(
            shadows: [
              BoxShadow(
                  color: Theme.of(context).accentColor,
                  blurRadius: 15.0,
                  spreadRadius: 10.0)
            ],
            color: Theme.of(context).primaryColor,
            shape: TopSheetBorder(size: size)),
        width: size.width,
        child: Padding(
            padding: EdgeInsets.only(top: 30),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('NICK SUZUKI - Top Post Challenge',
                                style: TextStyle(
                                    fontFamily: 'Asphaltic',
                                    color: Colors.white,
                                    fontSize: 30)),
                            Text('1st Place:',
                                style: TextStyle(
                                    fontFamily: 'Georgia',
                                    color: Colors.white,
                                    fontSize: 20)),
                            Text('2nd Place:',
                                style: TextStyle(
                                    fontFamily: 'Georgia',
                                    color: Colors.white,
                                    fontSize: 20)),
                            Text('3rd Place:',
                                style: TextStyle(
                                    fontFamily: 'Georgia',
                                    color: Colors.white,
                                    fontSize: 20))
                          ])),
                  Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: Align(
                          alignment: Alignment.topCenter,
                          child: CircleAvatar(
                              radius: 50,
                              backgroundImage: AssetImage(
                                  'assets/images/nick_suzuki.jpg')))),
                ])));
  }
}

class TBCustomPainter extends CustomPainter {
  final BuildContext context;
  TBCustomPainter(this.context);
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Theme.of(context).primaryColor
      ..style = PaintingStyle.fill;
    Path path = Path()..moveTo(0, size.height);
    path.quadraticBezierTo(
        30, size.height - 40, size.width * 0.25, size.height - 40);
    path.lineTo(size.width * 0.75, size.height - 40);
    path.quadraticBezierTo(
        size.width - 30, size.height - 40, size.width, size.height - 90);

    // Path path = Path()..moveTo(0, size.height - 80);
    // path.quadraticBezierTo(
    //     10, size.height - 30, size.width * 0.25, size.height - 30);
    // path.lineTo(size.width * 0.8, size.height - 30);
    // path.quadraticBezierTo(
    //     size.width - 30, size.height - 30, size.width, size.height);

    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class TopSheetBorder extends ShapeBorder {
  final Size size;
  final double height = 210;

  TopSheetBorder({required this.size});

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.only(bottom: 0);

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) => Path();

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    return Path()
      ..moveTo(0, height)
      ..quadraticBezierTo(30, height - 40, size.width * 0.25, height - 40)
      ..lineTo(size.width * 0.75, height - 40)
      ..quadraticBezierTo(size.width - 30, height - 40, size.width, height - 90)

      // Path path = Path()..moveTo(0, size.height - 80);
      // path.quadraticBezierTo(
      //     10, size.height - 30, size.width * 0.25, size.height - 30);
      // path.lineTo(size.width * 0.8, size.height - 30);
      // path.quadraticBezierTo(
      //     size.width - 30, size.height - 30, size.width, size.height);

      ..lineTo(size.width, 0)
      ..lineTo(0, 0)
      ..close();
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {}

  @override
  ShapeBorder scale(double t) => this;
}
