//import 'dart:html';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:allskills/utils/firestore_api.dart';
import 'package:allskills/ui/widgets/filter_drop_down.dart';
import 'package:allskills/ui/views/inbox_page.dart';
import 'package:allskills/ui/widgets/video_grid_tile.dart';
import 'package:allskills/ui/widgets/weather_icon.dart';
import 'package:allskills/ui/widgets/stats_icon.dart';
import 'package:allskills/ui/widgets/inbox_icon.dart';
import 'package:allskills/ui/widgets/match_card.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:allskills/models/UserProfile.dart';
import 'package:allskills/services/auth.dart';
import 'package:allskills/utils/fire_auth.dart';

class ProfilePage extends StatefulWidget {
  final User user;

  const ProfilePage({required this.user});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool _isSendingVerification = false;
  bool _isSigningOut = false;
  late Future<UserProfile?> userProfile;

  //late User _currentUser;

  @override
  void initState() {
    FirebaseAuth auth = FirebaseAuth.instance;
    //  userProfile = FirestoreApi().getUser(userId: auth.currentUser!.uid);
    // if (auth.currentUser == null) {
    //   Navigator.pop(context);
    // } else {
    //getProfileData(auth.currentUser);
    // }
    userProfile = FirestoreApi().getUser(userId: auth.currentUser!.uid);
    super.initState();
  }

  Future<UserProfile?> getProfileData() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    if (auth.currentUser == null) {
      Navigator.pop(context);
    } else {
      userProfile = FirestoreApi().getUser(userId: auth.currentUser!.uid);
      return userProfile;
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return FutureBuilder<UserProfile?>(
        future: userProfile,
        builder: (context, snapshot) {
          return DefaultTabController(
              length: 2,
              child: Scaffold(
                backgroundColor: Colors.transparent,
                //bottomSheet: BottomBar(),
                extendBodyBehindAppBar: true,
                appBar: AppBar(
                    // flexibleSpace: Image(
                    //     image: AssetImage('assets/images/appbar_bg.png'),
                    //     fit: BoxFit.cover),
                    shape: ProfileBarBorder(size: size),
                    bottomOpacity: 1.0,
                    leading: ProfilePicture(imageUrl: ''),
                    leadingWidth: 100,
                    title: snapshot.data != null
                        ? ProfileDetails(userProfile: snapshot.data!)
                        : Text(''),
                    actions: [
                      Container(
                          width: 77,
                          child: Column(children: [
                            InkWell(
                                onTap: (() {
                                  Navigator.of(context).pop();
                                }),
                                child: Padding(
                                    padding: EdgeInsets.only(
                                        right: 10,
                                        bottom: 10,
                                        left: 10,
                                        top: 8),
                                    child: Icon(Icons.cancel,
                                        color: Colors.white))),
                            Padding(
                                padding: EdgeInsets.only(top: 10),
                                child:
                                    Row(children: [StatsIcon(), InboxIcon()]))
                          ]))
                    ],
                    toolbarHeight: 100,
                    elevation: 2,
                    backgroundColor: Theme.of(context).primaryColor),
                body: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/background.png'),
                            fit: BoxFit.cover)),
                    child: SafeArea(
                        child: Center(
                            child: Column(children: [
                      Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: TabBar(
                              labelColor: Theme.of(context).accentColor,
                              indicatorColor: Theme.of(context).accentColor,
                              unselectedLabelColor: Colors.white,
                              labelPadding: EdgeInsets.only(bottom: 10),
                              tabs: [
                                Text('My Videos'),
                                Text('Current Matches'),
                              ])),
                      Expanded(
                          child: RawScrollbar(
                              child: TabBarView(children: [
                        Column(children: [
                          Padding(
                              padding:
                                  EdgeInsets.only(left: 20, right: 20, top: 15),
                              child: TextField(
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius: const BorderRadius.all(
                                              const Radius.circular(30.0))),
                                      filled: true,
                                      isDense: true,
                                      contentPadding: EdgeInsets.all(10),
                                      fillColor: Colors.white70,
                                      hintText: 'Enter a search term'))),
                          Flexible(child: VideoGrid())
                        ]),
                        MatchCard()
                      ])))
                    ])))

                    //Center(child: VideoGrid())),
                    // child: Column(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: [
                    //     Text(
                    //       'NAME: ${_currentUser.displayName}',
                    //       style: Theme.of(context).textTheme.bodyText1,
                    //     ),
                    //     SizedBox(height: 16.0),
                    //     Text(
                    //       'EMAIL: ${_currentUser.email}',
                    //       style: Theme.of(context).textTheme.bodyText1,
                    //     ),
                    //     SizedBox(height: 16.0),
                    //     _currentUser.emailVerified
                    //         ? Text(
                    //             'Email verified',
                    //             style: Theme.of(context)
                    //                 .textTheme
                    //                 .bodyText1!
                    //                 .copyWith(color: Colors.green),
                    //           )
                    //         : Text(
                    //             'Email not verified',
                    //             style: Theme.of(context)
                    //                 .textTheme
                    //                 .bodyText1!
                    //                 .copyWith(color: Colors.red),
                    //           ),
                    //     SizedBox(height: 16.0),
                    //     _isSendingVerification
                    //         ? CircularProgressIndicator()
                    //         : Row(
                    //             mainAxisSize: MainAxisSize.min,
                    //             children: [
                    //               ElevatedButton(
                    //                 onPressed: () async {
                    //                   setState(() {
                    //                     _isSendingVerification = true;
                    //                   });
                    //                   await _currentUser.sendEmailVerification();
                    //                   setState(() {
                    //                     _isSendingVerification = false;
                    //                   });
                    //                 },
                    //                 child: Text('Verify email'),
                    //               ),
                    //               SizedBox(width: 8.0),
                    //               IconButton(
                    //                 icon: Icon(Icons.refresh),
                    //                 onPressed: () async {
                    //                   User? user =
                    //                       await FireAuth.refreshUser(_currentUser);

                    //                   if (user != null) {
                    //                     setState(() {
                    //                       _currentUser = user;
                    //                     });
                    //                   }
                    //                 },
                    //               ),
                    //             ],
                    //           ),
                    //     SizedBox(height: 16.0),
                    //     _isSigningOut
                    //         ? CircularProgressIndicator()
                    //         : ElevatedButton(
                    //             onPressed: () async {
                    //               setState(() {
                    //                 _isSigningOut = true;
                    //               });
                    //               await FirebaseAuth.instance.signOut();
                    //               setState(() {
                    //                 _isSigningOut = false;
                    //               });
                    //               Navigator.of(context).pushReplacement(
                    //                 MaterialPageRoute(
                    //                   builder: (context) => LoginPage(),
                    //                 ),
                    //               );
                    //             },
                    //             child: Text('Sign out'),
                    //             style: ElevatedButton.styleFrom(
                    //               primary: Colors.red,
                    //               shape: RoundedRectangleBorder(
                    //                 borderRadius: BorderRadius.circular(30),
                    //               ),
                    //             ),
                    //           ),
                    //   ],
                    ),
              ));
        });
  }
}

class LevelAnimation extends StatefulWidget {
  final String imageUrl;
  LevelAnimation({Key? key, required this.imageUrl}) : super(key: key);

  @override
  _LevelAnimationState createState() => _LevelAnimationState();
}

class _LevelAnimationState extends State<LevelAnimation> {
  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
        radius: 70,
        percent: 7 / 10,
        animation: true,
        //animateFromLastPercent: ,
        //restartAnimation: true,
        animationDuration: 1000,
        circularStrokeCap: CircularStrokeCap.butt,
        backgroundColor: Colors.black,
        progressColor: Theme.of(context).accentColor,
        center: CircleAvatar(
            backgroundImage: AssetImage(
                'assets/images/frank.jpg'), //NetworkImage(widget.imageUrl), //
            radius: 30));
  }
}

class ProfilePicture extends StatelessWidget {
  final String imageUrl;
  const ProfilePicture({Key? key, required this.imageUrl}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      child: Column(children: [
        Center(child: LevelAnimation(imageUrl: imageUrl)),
        // center: CircleAvatar(
        //     backgroundImage:
        //         AssetImage('assets/images/profile_picture.png'),
        //     radius: 30))),
        // ),
        Padding(
            padding: EdgeInsets.only(top: 5),
            child: Row(children: [
              SocialMediaIcon(
                  image: Image.asset('assets/images/small_IG_icon.png')),
              SocialMediaIcon(
                  image: Image.asset('assets/images/small_YT_icon.png')),
              SocialMediaIcon(
                  image: Image.asset('assets/images/small_FB_icon.png')),
              SocialMediaIcon(
                  image: Image.asset('assets/images/small_TT_icon.png')),
            ]))
      ]),
    );
  }
}

class VideoGrid extends StatefulWidget {
  //const ({ Key? key }) : super(key: key);
  //@override
  _VideoGridState createState() => _VideoGridState();
}

class _VideoGridState extends State<VideoGrid> {
  bool isGridView = true;

  @override
  void initState() {
    super.initState();
    isGridView = true;
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Wrap(spacing: 0, children: [
        SortDropDown(),
        FilterDropDown(),
        IconButton(
          padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
          alignment: Alignment.centerRight,
          icon: Icon(Icons.table_rows_rounded, color: Colors.white),
          onPressed: () {
            setState(() {
              isGridView = false;
            });
          },
        ),
        IconButton(
          padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
          alignment: Alignment.centerRight,
          icon: Icon(Icons.grid_view_rounded, color: Colors.white),
          onPressed: () {
            setState(() {
              isGridView = true;
            });
          },
        ),
      ]),
      Expanded(
          child: RawScrollbar(
              thumbColor: Colors.teal,
              radius: Radius.circular(20),
              thickness: 3,
              isAlwaysShown: true,
              child: Padding(
                  padding: EdgeInsets.only(left: 10, right: 10, top: 15),
                  child: isGridView
                      ? GridView.builder(
                          physics: ScrollPhysics(),
                          shrinkWrap: true,
                          //padding: EdgeInsets.all(10),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 20,
                                  childAspectRatio: 0.9),
                          itemCount: 10,
                          itemBuilder: (BuildContext context, index) {
                            return VideoGridTile();
                          },
                        )
                      : ListView.builder(
                          itemCount: 10,
                          //shrinkWrap: true,
                          itemBuilder: (BuildContext context, index) {
                            return VideoListTile();
                          },
                        ))))
    ]);
  }

  void updateVideoView(bool _isGridView) {
    setState(() {
      isGridView = _isGridView;
    });
  }
}

class VideoListTile extends StatelessWidget {
  const VideoListTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
            leading: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset('assets/images/video_thumbnail.jpg')),
            title: Text('test')));
  }
}

class SocialMediaIcon extends StatelessWidget {
  final Image image;
  SocialMediaIcon({required this.image});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(padding: EdgeInsets.only(left: 3, right: 3), child: image),
    );
  }
}

class ProfileDetails extends StatelessWidget {
  UserProfile userProfile;
  ProfileDetails({Key? key, required this.userProfile}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(userProfile.fullName!,
            style: TextStyle(
                fontFamily: 'Asphaltic',
                color: Color(0XFF2fe7cf),
                fontSize: 24)),
        Row(children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(userProfile.numFollowers.toString() + 'k Followers',
                style: TextStyle(fontSize: 12)),
            Text(userProfile.numFollowings.toString() + ' Followings',
                style: TextStyle(fontSize: 12)),
            Text('\$0', style: TextStyle(fontSize: 12))
          ]),
          // Padding(
          //     padding: EdgeInsets.only(left: 5),
          //     child: SizedBox(
          //         height: 20,
          //         width: 60,
          //         child: ElevatedButton(
          //           onPressed: () {},
          //           style: ButtonStyle(
          //               padding: MaterialStateProperty.all<EdgeInsets>(
          //                   EdgeInsets.all(0)),
          //               shape:
          //                   MaterialStateProperty.all<RoundedRectangleBorder>(
          //                       RoundedRectangleBorder(
          //                           borderRadius: BorderRadius.circular(18.0))),
          //               backgroundColor: MaterialStateProperty.all<Color>(
          //                   Color(0XFF2fe7cf))),
          //           child: Text(
          //             'FOLLOW',
          //             style: TextStyle(
          //                 fontFamily: 'Asphaltic',
          //                 fontSize: 16,
          //                 color: Colors.black),
          //           ),
          //         )))
        ]),
        Text('LVL ' + userProfile.level.toString())
      ]),
    );
  }
}

class SortDropDown extends StatefulWidget {
  SortDropDown({Key? key}) : super(key: key);

  @override
  _SortDropDownState createState() => _SortDropDownState();
}

class ListItem {
  int value;
  String name;
  ListItem(this.value, this.name);
}

class _SortDropDownState extends State<SortDropDown> {
  int _value = 1;
  List<ListItem> _dropdownItems = [
    ListItem(1, "Popularity"),
    ListItem(2, "Views"),
    ListItem(3, "Date"),
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 10, right: 10),
        child: Container(
          padding: EdgeInsets.only(left: 10, right: 5, top: 3, bottom: 3),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            color: Colors.black,
          ),
          child: DropdownButton(
            dropdownColor: Colors.black,
            underline: SizedBox.shrink(),
            isDense: true,
            value: _value,
            items: _dropdownItems.map((ListItem item) {
              return DropdownMenuItem<int>(
                child: Text(item.name,
                    style: TextStyle(color: Colors.white, fontSize: 12)),
                value: item.value,
              );
            }).toList(),
            onChanged: (int? value) {
              setState(() {
                _value = value!;
              });
            },
          ),
        ));
  }
}

class ProfileBarBorder extends ShapeBorder {
  final Size size;
  final double height = 130;

  ProfileBarBorder({required this.size});

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.only(bottom: 0);

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) => Path();

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    return Path()
      ..moveTo(0, height)
      //..quadraticBezierTo(30, height - 40, size.width * 0.25, height - 40)
      ..lineTo(size.width * 0.5, height)
      ..quadraticBezierTo(
          size.width * 0.6, height, size.width * 0.75, height * 0.7)
      ..quadraticBezierTo(
          size.width * 0.9, height * 0.4, size.width, height * 0.45)

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
