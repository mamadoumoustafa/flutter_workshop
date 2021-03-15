import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  final textNormal = TextStyle(
      fontSize: 14, color: Colors.black, fontWeight: FontWeight.normal);

  static var textTitle = Text('Strawberry Pavlova',
      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold));

  static var textBody = Text(
    'PAvlov is a plat ett  tjdk kkksksk kkkskkskkks  sjjzjjjs sjjzjjs jjjz',
    style: TextStyle(
        fontSize: 14,
        color: Colors.black,
        fontFamily: 'Georgia',
        fontWeight: FontWeight.normal),
    textAlign: TextAlign.center,
  );

  var mainImage = Image.asset(
    'images/pavlova.jpg',
    fit: BoxFit.cover,
  );

  static var rating = Container(
    padding: EdgeInsets.all(1),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [stars, textReview],
    ),
  );

  static var stars = Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Icon(Icons.star_outline, color: Colors.blue),
      Icon(Icons.star_outline, color: Colors.blue),
      Icon(Icons.star_outline, color: Colors.blue),
      Icon(Icons.star_outline, color: Colors.blue),
      Icon(Icons.star_outline, color: Colors.blue),
    ],
  );

  static var textReview = Text('170 reviews',
      style: TextStyle(
          fontSize: 12, color: Colors.black, fontWeight: FontWeight.normal));

  static var iconList = DefaultTextStyle.merge(
      child: Container(
    padding: EdgeInsets.all(20),
    child: steps,
  ));

  static var steps = Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Column(
        children: [
          Icon(Icons.kitchen, color: Colors.green),
          Text('PREP:'),
          Text('25mn')
        ],
      ),
      Column(
        children: [Icon(Icons.timer), Text('COOK:'), Text('30mn')],
      ),
      Column(
        children: [Icon(Icons.restaurant), Text('FEEDS:'), Text('40mn')],
      )
    ],
  );

  final Widget titleSection = Container(
      padding: EdgeInsets.fromLTRB(2, 3, 1, 2),
      child: Column(
        children: [textTitle, textBody, rating, steps],
      ));

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Layout Demo',
        home: Scaffold(
          appBar: AppBar(title: Text('Flutter layout demo')),
          body: Center(
            child: Container(
              margin: EdgeInsets.fromLTRB(0, 4, 0, 3),
              // height: 600,
              child: Card(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: titleSection),
                    //  Container(width: 200, child: titleSection),
                    Expanded(child: mainImage)

                    //  Container(width: 200, child: mainImage)
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
