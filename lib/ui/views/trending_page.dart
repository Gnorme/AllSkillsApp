import 'package:allskills/ui/widgets/filter_drop_down.dart';
import 'package:flutter/material.dart';
import 'package:allskills/ui/widgets/match_card.dart';

class TrendingPage extends StatefulWidget {
  TrendingPage({Key? key}) : super(key: key);

  @override
  _TrendingPageState createState() => _TrendingPageState();
}

class _TrendingPageState extends State<TrendingPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/background.png'),
                fit: BoxFit.cover)),
        child: Column(children: [
          Align(
              alignment: Alignment.centerRight,
              child: Padding(
                  padding: EdgeInsets.only(bottom: 5),
                  child: FilterDropDown())),
          Flexible(
              child: ListView.builder(
            shrinkWrap: true,
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                  padding: EdgeInsets.only(bottom: 10), child: MatchCard());
            },
          ))
        ]));
  }
}
