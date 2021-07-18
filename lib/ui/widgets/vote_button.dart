import 'dart:ui';

import 'package:flutter/material.dart';

class VoteButton extends StatefulWidget {
  bool waitingForVote;
  bool votedFor;
  final VoidCallback voteCallBack;

  VoteButton(
      {Key? key,
      this.waitingForVote = true,
      this.votedFor = false,
      required this.voteCallBack})
      : super(key: key);

  @override
  _VoteButtonState createState() => _VoteButtonState();
}

class _VoteButtonState extends State<VoteButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: widget.votedFor | widget.waitingForVote ? 30 : 0,
        child: ElevatedButton(
          onPressed: widget.voteCallBack,
          style: ButtonStyle(
              padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(0)),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0))),
              backgroundColor:
                  MaterialStateProperty.all<Color>(Color(0XFF852ee7))),
          child: widget.votedFor
              ? Row(children: [
                  Icon(Icons.check),
                  Text(
                    'VOTED',
                    style: TextStyle(
                        fontFamily: 'Asphaltic',
                        fontSize: 16,
                        color: Colors.white),
                  )
                ])
              : Text(
                  'VOTE',
                  style: TextStyle(
                      fontFamily: 'Asphaltic',
                      fontSize: 16,
                      color: Colors.white),
                ),
        ));
  }
}

// class VoteButton extends StatelessWidget {
//   final bool voteCast;
//   final bool votedFor;
//   const VoteButton({Key? key, this.voteCast = false, this.votedFor = false})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//         height: 30,
//         child: ElevatedButton(
//           onPressed: () {},
//           style: ButtonStyle(
//               padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(0)),
//               shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//                   RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(18.0))),
//               backgroundColor:
//                   MaterialStateProperty.all<Color>(Color(0XFF852ee7))),
//           child: Text(
//             votedFor ? 'VOTE' : 'VOTED',
//             style: TextStyle(
//                 fontFamily: 'Asphaltic', fontSize: 16, color: Colors.white),
//           ),
//         ));
//   }
// }
