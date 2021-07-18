import 'package:flutter/material.dart';

import 'package:allskills/ui/widgets/match_card.dart';
import 'package:allskills/ui/widgets/vote_button.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';

class MyFieldPage extends StatefulWidget {
  MyFieldPage({Key? key}) : super(key: key);

  @override
  _MyFieldPageState createState() => _MyFieldPageState();
}

class _MyFieldPageState extends State<MyFieldPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/background.png'),
                fit: BoxFit.cover)),
        child: MyFieldPageView());
  }
}

class MyFieldPageView extends StatelessWidget {
  const MyFieldPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController(initialPage: 0);

    return Center(
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      Container(
          height: 400,
          child: PageView.builder(
            controller: controller,
            itemBuilder: (context, int index) {
              return VoteView();
            },
            itemCount: 3,
          )),
      Row(children: [
        Expanded(
            child: GestureDetector(
                onTap: (() {
                  controller.previousPage(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeIn);
                }),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Icon(Icons.arrow_back_ios_rounded,
                            size: 30, color: Colors.white))))),
        Expanded(
            child: GestureDetector(
                onTap: (() {
                  controller.nextPage(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeIn);
                }),
                child: Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Icon(Icons.arrow_forward_ios_rounded,
                            size: 30, color: Colors.white))))),
      ])
    ]));
  }
}

class VoteState {
  final bool voted = false;
  final bool votedLeft = false;
  final bool votedRight = false;
}

class VoteView extends StatefulWidget {
  VoteView({Key? key}) : super(key: key);

  @override
  _VoteViewState createState() => _VoteViewState();
}

class _VoteViewState extends State<VoteView> {
  bool voteCast = false;
  bool hasVotedLeft = false;
  bool hasVotedRight = false;
  //VoidCallback voteCallBack;

  void voteCallBack(bool) {
    setState(() {
      voteCast = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(children: [
      Padding(padding: EdgeInsets.all(10), child: MatchCard()),
      Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        SizedBox(
            height: hasVotedRight ? 0 : 30,
            child: ElevatedButton(
              onPressed: (() {
                setState(() {
                  hasVotedLeft = true;
                });
              }),
              style: ButtonStyle(
                  padding:
                      MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(0)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0))),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Color(0XFF852ee7))),
              child: hasVotedLeft
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
            )),
        CountdownTimer(
            endTime: DateTime.now().millisecondsSinceEpoch + 1000 * 60 * 60,
            textStyle: TextStyle(color: Colors.white, fontSize: 30)),
        SizedBox(
            height: hasVotedLeft ? 0 : 30,
            child: ElevatedButton(
              onPressed: (() {
                setState(() {
                  hasVotedRight = true;
                });
              }),
              style: ButtonStyle(
                  padding:
                      MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(0)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0))),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Color(0XFF852ee7))),
              child: hasVotedRight
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
            )),
      ]),
    ]));
  }
}
