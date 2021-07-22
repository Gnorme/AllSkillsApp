import 'package:allskills/ui/views/inventory_page.dart';
import 'package:flutter/material.dart';

class InventoryIcon extends StatelessWidget {
  const InventoryIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
        child: IconButton(
            padding: EdgeInsets.all(0),
            icon: Icon(Icons.business_center_outlined, color: Colors.white),
            iconSize: 30,
            onPressed: (() {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => InventoryPage()));
            })));
  }
}
