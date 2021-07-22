import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class MatchCard extends StatefulWidget {
  MatchCard({Key? key}) : super(key: key);

  @override
  _MatchCardState createState() => _MatchCardState();
}

class _MatchCardState extends State<MatchCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
        color: Theme.of(context).primaryColor,
        elevation: 10.0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
            side: BorderSide(width: 1, color: Colors.black38)),
        child: Stack(alignment: AlignmentDirectional.center, children: [
          Padding(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Row(children: [
                MatchSingleCard(
                    videoLink: 'assets/videos/Video_1.mp4',
                    user: 'Charles Hamelin',
                    title: 'See-Saw Shot'),
                Container(width: 5),
                MatchSingleCard(
                    videoLink: 'assets/videos/Video_2.mp4',
                    user: 'Francois Sammut',
                    title: 'Baby got bank shot')
              ])),
          Align(
              alignment: Alignment.center,
              child: Text('VS',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Asphaltic',
                      fontSize: 72)))
        ]));
  }
}

class MatchCardDetails {}

class MatchSingleCard extends StatefulWidget {
  bool voteEnabled;
  final String videoLink;
  final String user;
  final String title;

  MatchSingleCard(
      {Key? key,
      this.voteEnabled = false,
      required this.videoLink,
      required this.user,
      required this.title})
      : super(key: key);

  @override
  _MatchSingleCardState createState() => _MatchSingleCardState();
}

class _MatchSingleCardState extends State<MatchSingleCard> {
  late VideoPlayerController _controller;
  bool isFavorited = false;

  @override
  void initState() {
    super.initState();
    // _controller = VideoPlayerController.network(
    //     'https://sample-videos.com/video123/mp4/720/big_buck_bunny_720p_1mb.mp4',
    //     videoPlayerOptions: VideoPlayerOptions(mixWithOthers: false));
    _controller = VideoPlayerController.asset(widget.videoLink,
        videoPlayerOptions: VideoPlayerOptions(mixWithOthers: false));

    _controller.addListener(() {
      if (mounted) {
        setState(() {});
      }
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
    return Flexible(
        child: Column(children: [
      Padding(
          padding: EdgeInsets.only(top: 10),
          child: Text(widget.user,
              style: TextStyle(
                  color: Colors.white, fontFamily: 'Asphaltic', fontSize: 24))),
      ClipRRect(
          borderRadius: BorderRadius.circular(32.0),
          child: AspectRatio(
            aspectRatio: 9 / 16,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: <Widget>[
                VideoPlayer(_controller),
                ClosedCaption(text: _controller.value.caption.text),
                _ControlsOverlay(controller: _controller),
                VideoProgressIndicator(_controller, allowScrubbing: true),
              ],
            ),
          )),
      Padding(
          padding: EdgeInsets.only(top: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  child: Row(children: [
                Padding(
                    padding: EdgeInsets.only(right: 3),
                    child:
                        Icon(Icons.sports_golf, size: 16, color: Colors.white)),
                Expanded(
                    child: Text(widget.title,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: Colors.white, fontSize: 14)))
              ])),
              InkWell(
                  onTap: () {
                    setState(() {
                      isFavorited = !isFavorited;
                    });
                  },
                  child: Icon(
                      isFavorited
                          ? Icons.favorite_rounded
                          : Icons.favorite_border_rounded,
                      color: isFavorited ? Colors.pink : Colors.grey.shade700)),
              // IconButton(),
              // IconButton(),
            ],
          ))
    ]));
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
