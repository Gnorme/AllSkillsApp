import 'package:flutter/material.dart';
import 'package:allskills/ui/views/ambassador_challenge.dart';

class AmbassadorPage extends StatefulWidget {
  AmbassadorPage({Key? key}) : super(key: key);

  @override
  _AmbassadorPageState createState() => _AmbassadorPageState();
}

class _AmbassadorPageState extends State<AmbassadorPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/background.png'),
                fit: BoxFit.cover)),
        child: Center(
            child: Column(children: [
          Padding(
              padding: EdgeInsets.only(top: 10, bottom: 10),
              child: Text('OUR AMBASSADORS',
                  style: TextStyle(
                      fontFamily: 'Asphaltic',
                      fontSize: 32,
                      color: Colors.white))),
          Expanded(
              child: RawScrollbar(
                  thumbColor: Colors.teal,
                  radius: Radius.circular(20),
                  thickness: 3,
                  //isAlwaysShown: true,
                  child: GridView.builder(
                    //physics: ScrollPhysics(),
                    shrinkWrap: true,
                    //padding: EdgeInsets.all(10),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: 5,
                        childAspectRatio: 0.55),
                    itemCount: 15,
                    itemBuilder: (BuildContext context, index) {
                      return index == 1
                          ? AmbassadorGridTile(isSelected: true)
                          : AmbassadorGridTile();
                    },
                  )))
        ])));
  }
}

class AmbassadorGridTile extends StatelessWidget {
  final bool isSelected;
  AmbassadorGridTile({Key? key, this.isSelected = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: (() {
          isSelected
              ? Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AmbassadorChallenge()))
              : null;
        }),
        child: Padding(
            padding: EdgeInsets.only(top: 5),
            child: Container(
              child: Column(children: [
                Flexible(
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.0),
                            boxShadow: [
                              BoxShadow(
                                  color:
                                      isSelected ? Colors.red : Colors.black54,
                                  //spreadRadius: 4,
                                  blurRadius: 10.0)
                            ]),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(12.0),
                            child:
                                Image.asset('assets/images/nick_suzuki.jpg')))),
                Card(
                    margin: EdgeInsets.all(8),
                    color: Colors.grey.shade900,
                    child: Padding(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: Text('NICK\nSUZUKI',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Asphaltic',
                                fontSize: 28))))
              ]),
            )));
  }
}
