import 'package:allskills/ui/views/profile_page.dart';
import 'package:allskills/ui/views/standings_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:allskills/ui/views/home_page.dart';
import 'package:allskills/ui/views/session_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:camera/camera.dart';
import 'dart:math' as math;

List<CameraDescription> cameras = [];

class BottomBar extends StatefulWidget {
  BottomBar({Key? key}) : super(key: key);

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  late bool isPressed;

  @override
  void initState() {
    initCamera();
    super.initState();

    isPressed = false;
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
    isPressed = false;
  }

  void initCamera() async {
    cameras = await availableCameras();
  }

  void refreshBar() {
    if (mounted)
      setState(() {
        isPressed = false;
      });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
        decoration: ShapeDecoration(
          shape: BottomSheetBorder(size: size),
          shadows: [
            BoxShadow(
              color: Colors.black,
              spreadRadius: 5,
              blurRadius: 5,
              //offset: Offset(0, 5), // changes position of shadow
            ),
          ],
        ),
        height: 80,
        //color: Colors.black.withOpacity(0),
        child: Stack(children: [
          //BuyTicketButton(() {}),
          CustomPaint(
              size: Size(size.width, 80),
              painter: isPressed
                  ? BBCustomPainter(context, Colors.purple)
                  : BBCustomPainter(context, Theme.of(context).accentColor)),
          Center(
              child: Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 20),
                  child: InkWell(
                      onTap: (() => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  SessionPage(cameras: cameras)))),
                      child:
                          Image.asset('assets/images/logo_small_white.png')))),
          Container(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Align(
                  alignment: Alignment.bottomCenter,
                  heightFactor: 3,
                  child: GestureDetector(
                      onTap: (() => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProfilePage(
                                    user: FirebaseAuth.instance.currentUser!)),
                          ).then((_) => refreshBar())),
                      child: Text('  PROFILE',
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Asphaltic',
                              fontSize: 24)))),
              Container(width: size.width * 0.3),
              Align(
                  alignment: Alignment.bottomRight,
                  heightFactor: 3,
                  child: GestureDetector(
                      onTap: (() => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => StandingsPage()),
                          )),
                      child: Text('STANDINGS',
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Asphaltic',
                              fontSize: 24)))),
            ],
          )),
        ]));
  }
}

class BBCustomPainter extends CustomPainter {
  final BuildContext context;
  final Color color;
  BBCustomPainter(this.context, this.color);
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;
    Path path = Path()..moveTo(10, size.height);
    path.quadraticBezierTo(
        30, size.height * 0.5, size.width * 0.2, size.height * 0.5);
    path.lineTo(size.width * 0.8, size.height * 0.5);
    path.quadraticBezierTo(
        size.width - 30, size.height * 0.5, size.width - 10, size.height);
    path.close();
    canvas.drawPath(path, paint);
    paint.color = Theme.of(context).primaryColor; // or Color(0XFF363636);
    canvas.drawArc(
        Rect.fromCenter(
            center: Offset(size.width / 2, size.height),
            height: 160,
            width: size.height * 2),
        math.pi,
        math.pi,
        false,
        paint);
    // path.moveTo(size.width * 0.4, size.height);
    // path.arcToPoint(Offset(size.width * 0.60, size.height),
    //     radius: Radius.circular(10.0));
    // canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class BottomSheetBorder extends ShapeBorder {
  final Size size;
  final double height = 80;

  BottomSheetBorder({required this.size});

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.only(bottom: 0);

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) => Path();

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    return Path()
      ..moveTo(10, size.height)
      ..quadraticBezierTo(30, size.height - height * 0.5, size.width * 0.2,
          size.height - height * 0.5)
      ..lineTo(size.width * 0.8, size.height - height * 0.5)
      ..quadraticBezierTo(size.width - 30, size.height - height * 0.5,
          size.width - 10, size.height)
      ..close();
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {}

  @override
  ShapeBorder scale(double t) => this;
}
