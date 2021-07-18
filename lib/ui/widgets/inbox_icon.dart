import 'package:flutter/material.dart';
import 'package:allskills/ui/views/inbox_page.dart';

class InboxIcon extends StatelessWidget {
  const InboxIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
        child: IconButton(
            padding: EdgeInsets.all(0),
            icon: Icon(Icons.mail_outline_rounded),
            iconSize: 30,
            onPressed: (() {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => InboxPage()));
            })));
  }
}
