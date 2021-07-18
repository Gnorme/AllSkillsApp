import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:allskills/ui/widgets/stats_icon.dart';
import 'package:allskills/ui/widgets/weather_icon.dart';
import 'package:allskills/ui/widgets/inbox_icon.dart';
import 'package:allskills/ui/widgets/bottom_bar.dart';
import 'package:allskills/ui/views/ambassadors_page.dart';
import 'package:allskills/ui/views/trending_page.dart';
import 'package:allskills/ui/views/my_field_page.dart';

class HomePage extends StatefulWidget {
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;
  final int selectedPage;

  HomePage(
      {required this.auth, required this.firestore, this.selectedPage = 1});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        initialIndex: widget.selectedPage,
        child: Scaffold(
            bottomSheet: BottomBar(),
            appBar: AppBar(
                backgroundColor: Colors.grey.shade900,
                toolbarHeight: 80,
                actions: [WeatherWidget(), StatsIcon(), InboxIcon()],
                leadingWidth: 180,
                flexibleSpace: Padding(
                    padding: EdgeInsets.only(top: 25, left: 5),
                    child: Row(children: [
                      Padding(
                          padding: EdgeInsets.only(
                              left: 5, top: 5, bottom: 5, right: 10),
                          child: CircleAvatar(
                              backgroundImage:
                                  AssetImage('assets/images/frank.jpg'))),
                      Text('\$13,000',
                          style: TextStyle(color: Colors.white), maxLines: 1)
                    ])),
                bottom: TabBar(
                    labelColor: Theme.of(context).accentColor,
                    indicatorColor: Theme.of(context).accentColor,
                    unselectedLabelColor: Colors.white,
                    labelPadding: EdgeInsets.only(bottom: 10),
                    tabs: [
                      Text('My Field'),
                      Text('Trending'),
                      Text('Ambassadors'),
                    ])),
            body: TabBarView(children: [
              Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/background.png'),
                          fit: BoxFit.cover)),
                  child: MyFieldPageView()),
              TrendingPage(),
              AmbassadorPage(),
            ])));
  }
}
