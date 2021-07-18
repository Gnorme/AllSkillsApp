import 'package:flutter/material.dart';
import 'package:allskills/ui/widgets/bottom_bar.dart';

class InboxPage extends StatelessWidget {
  const InboxPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      bottomSheet: BottomBar(),
    );
  }
}
