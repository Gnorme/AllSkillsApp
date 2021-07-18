import 'package:flutter/material.dart';
import 'package:allskills/ui/views/stats_page.dart';

class StatsIcon extends StatelessWidget {
  const StatsIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
        child: IconButton(
            padding: EdgeInsets.all(8),
            icon: Icon(Icons.bar_chart),
            iconSize: 30,
            onPressed: (() {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => StatsPage()));
            })));
  }
}
