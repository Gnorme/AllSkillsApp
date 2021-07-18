import 'package:flutter/material.dart';

class VideoGridTile extends StatefulWidget {
  VideoGridTile({Key? key}) : super(key: key);

  @override
  _VideoGridTileState createState() => _VideoGridTileState();
}

class _VideoGridTileState extends State<VideoGridTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      //width: 140,
      //height: 176,
      //padding: EdgeInsets.only(bottom: 10),
      child: Column(
        //crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Flexible(
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset('assets/images/video_thumbnail.jpg'))),
          Padding(
              padding: EdgeInsets.only(top: 5),
              child: Row(
                children: [
                  Padding(
                      padding: EdgeInsets.only(left: 10, right: 2),
                      child: Icon(Icons.sports_football,
                          size: 16, color: Colors.white)),
                  Text('Title',
                      style: TextStyle(color: Colors.white, fontSize: 14)),
                  Expanded(
                      child: Padding(
                          padding: EdgeInsets.only(right: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Icon(Icons.ios_share,
                                  color: Colors.grey.shade700),
                              Icon(Icons.favorite_border_rounded,
                                  color: Colors.grey.shade700),
                            ],
                          )))
                  // IconButton(),
                  // IconButton(),
                ],
              ))
        ],
      ),
    );
  }
}
