import 'package:allskills/ui/views/search_page.dart';
import 'package:flutter/material.dart';

class SearchIcon extends StatelessWidget {
  const SearchIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
        child: IconButton(
            padding: EdgeInsets.all(0),
            icon: Icon(Icons.search, color: Colors.white),
            iconSize: 30,
            onPressed: (() {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SearchPage()));
            })));
  }
}
