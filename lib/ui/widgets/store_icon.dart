import 'package:allskills/ui/views/store_page.dart';
import 'package:flutter/material.dart';

class StoreIcon extends StatelessWidget {
  const StoreIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
        child: IconButton(
            padding: EdgeInsets.all(0),
            icon: Icon(Icons.local_grocery_store, color: Colors.white),
            iconSize: 30,
            onPressed: (() {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => StorePage()));
            })));
  }
}
