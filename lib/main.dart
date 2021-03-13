import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  final Widget titleSection = Container(
    padding: const EdgeInsets.all(32),
    child: Row(
      children: [
        Expanded(
            child: Column(
          children: [
            Icon(
              Icons.call,
              color: Colors.blue,
            ),
            Container(
                margin: const EdgeInsets.all(2),
                child: Text('Call', style: TextStyle(color: Colors.blue)))
          ],
        )),
        Expanded(
          child: Column(
            children: [
              Icon(
                Icons.directions,
                color: Colors.blue,
              ),
              Container(
                  margin: const EdgeInsets.all(2),
                  child: Text('Route', style: TextStyle(color: Colors.blue)))
            ],
          ),
        ),
        Expanded(
            child: Column(
          children: [
            Icon(
              Icons.share,
              color: Colors.blue,
            ),
            Container(
                margin: const EdgeInsets.all(2),
                child: Text('Share', style: TextStyle(color: Colors.blue)))
          ],
        ))
      ],
    ),
/*     child: Row(
      children: [
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(bottom: 9),
              child: Text('Oeschinen Lake Campground',
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            Text('Kandersteg, Switzerland',
                style: TextStyle(color: Colors.grey))
          ],
        )),
        Icon(
          Icons.star,
          color: Colors.red,
        ),
        Text('41'),
      ],
    ), */
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Layout Demo',
        home: Scaffold(
          appBar: AppBar(title: Text('Flutter layout demo')),
          body: Column(
            children: [
              titleSection,
            ],
          ),
        ));
  }
}
