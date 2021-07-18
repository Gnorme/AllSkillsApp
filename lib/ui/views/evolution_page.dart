import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//import 'package:allskills/utils/fire_auth.dart';

class EvolutionPage extends StatefulWidget {
  // final User user;

  //const EvolutionPage({required this.user});

  @override
  _EvolutionPageState createState() => _EvolutionPageState();
}

class _EvolutionPageState extends State<EvolutionPage> {
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
            child: SafeArea(
              child: Center(
                  child: Column(children: [
                Text('SKILLS MONEY',
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontFamily: 'Asphaltic')),
                Padding(padding: EdgeInsets.only(top: 20), child: MoneyRow()),
                SizedBox(height: 50),
                Text('SKILLS REPUTATION',
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontFamily: 'Asphaltic')),
                Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 20),
                    child: EvolveRow()),
                Text('SKILLS LEVEL',
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontFamily: 'Asphaltic')),
                Padding(
                    padding: EdgeInsets.only(left: 30, right: 30, top: 10),
                    child: LevelCard())
              ])),
            )));
    //bottomNavigationBar: BottomNavigationBar(items: []));
  }
}

class LevelCard extends StatefulWidget {
  const LevelCard({Key? key}) : super(key: key);

  @override
  _LevelCardState createState() => _LevelCardState();
}

class _LevelCardState extends State<LevelCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
        //padding: EdgeInsets.only(left: 20, right: 20),
        decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.25),
            borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: [
            RichText(
                text: TextSpan(
                    style: TextStyle(
                        fontSize: 60,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                    text: 'LVL ',
                    children: [
                  TextSpan(
                      text: '4', style: TextStyle(color: Color(0XFF2fe7cf)))
                ])),
            Divider(
                height: 1,
                thickness: 1,
                indent: 20,
                endIndent: 20,
                color: Colors.white),
            Padding(
                padding:
                    EdgeInsets.only(left: 50, right: 50, top: 6, bottom: 6),
                child: Text('Win 5 more matches to reach the next level',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                    softWrap: true))
          ],
        ));
  }
}

class EvolveRow extends StatefulWidget {
  const EvolveRow({Key? key}) : super(key: key);

  @override
  _EvolveRowState createState() => _EvolveRowState();
}

class _EvolveRowState extends State<EvolveRow> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Expanded(
          child: Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                  onPressed: (() {}),
                  child: Icon(Icons.north_rounded),
                  style: ButtonStyle(
                      padding: MaterialStateProperty.all<EdgeInsets>(
                          EdgeInsets.all(0)),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Color(0XFF2fe7cf)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0))))))),
      Padding(
          padding: EdgeInsets.only(left: 10, right: 10),
          child: CircleAvatar(radius: 60)),
      Expanded(
          child: Align(
              alignment: Alignment.centerLeft,
              child: Text('80%',
                  style: TextStyle(fontSize: 40, color: Colors.white))))
    ]));
  }
}

class MoneyRow extends StatelessWidget {
  const MoneyRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.black.withOpacity(0.4),
        child: IntrinsicHeight(
            child: Padding(
                padding: EdgeInsets.only(top: 10, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                        child: Column(
                      children: [
                        Text('\$53,000',
                            style:
                                TextStyle(fontSize: 32, color: Colors.white)),
                        Text('earned',
                            style: TextStyle(fontSize: 14, color: Colors.white))
                      ],
                    )),
                    VerticalDivider(color: Colors.white),
                    Expanded(
                        child: Column(
                      children: [
                        Text('\$13,000',
                            style:
                                TextStyle(fontSize: 32, color: Colors.white)),
                        Text('current total',
                            style: TextStyle(fontSize: 14, color: Colors.white))
                      ],
                    ))
                  ],
                ))));
  }
}
