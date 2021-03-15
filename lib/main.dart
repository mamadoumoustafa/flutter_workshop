import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class FavoriteWidget extends StatefulWidget {
  @override
  _FavoriteWidgetState createState() => _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  bool _isFavourited = true;
  int _favouriteCount = 41;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
            padding: EdgeInsets.all(0),
            icon: (_isFavourited ? Icon(Icons.star) : Icon(Icons.star_border)),
            color: Colors.red[500],
            onPressed: _toggleFavourite),
        SizedBox(
          // width: 5,
          child: Container(child: Text('$_favouriteCount')),
        )
      ],
    );
  }

  void _toggleFavourite() {
    setState(() {
      if (_isFavourited) {
        _favouriteCount += 1;
        _isFavourited = false;
      } else {
        _favouriteCount -= 1;
        _isFavourited = true;
      }
    });
  }
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
    padding: EdgeInsets.fromLTRB(1, 20, 1, 20),
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

  final Widget imageSection = Image.asset(
    'images/lake.jpg',
    fit: BoxFit.cover,
  );

  final Widget titleSection = Container(
    padding: const EdgeInsets.all(32),
    child: Row(
      children: [
        Expanded(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
              Text('Saint-Ann lake Campground'),
              Text('Louisiane,New orlean')
            ])),
        FavoriteWidget()
/*         Icon(
          Icons.star,
          color: Colors.red[600],
        ),
        Text('41'), */
      ],
    ),
  );

  final Widget buttonSection = Container(
    padding: EdgeInsets.all(22),
    child: Row(children: [
      Expanded(
          child: Column(
        children: [
          Icon(
            Icons.call,
            color: Colors.blue,
          ),
          Text('CALL')
        ],
      )),
      Expanded(
          child: Column(
        children: [
          Icon(
            Icons.location_city,
            color: Colors.blue,
          ),
          Text('ROUTE')
        ],
      )),
      Expanded(
          child: Column(
        children: [
          Icon(
            Icons.share,
            color: Colors.blue,
          ),
          Text('SHARE')
        ],
      ))
    ]),
  );

  final Widget bodySection = Container(
    padding: EdgeInsets.all(30),
    child: Text(
      'Saint-Ann lake Campground lies at the foot of the Blüemlisalp in the Bernese '
      'Alps. Situated 1,578 meters above sea level, it is one of the '
      'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
      'half-hour walk through pastures and pine forest, leads you to the '
      'lake, which warms to 20 degrees Celsius in the summer. Activities '
      'enjoyed here include rowing, and riding the summer toboggan run.',
      softWrap: true,
    ),
  );

  Widget _buildCard() => SizedBox(
        height: 210,
        child: Card(
          child: Column(
            children: [
              ListTile(
                title: Text('Bourbon street',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text('New orlean, Louisiane'),
                leading: Icon(Icons.streetview_outlined, color: Colors.brown),
              ),
              Divider(),
              ListTile(
                title: Text('780-048-698-369'),
                leading: Icon(
                  Icons.phone,
                  color: Colors.brown,
                ),
              ),
              ListTile(
                title: Text('marcelus@gmail.com'),
                leading: Icon(
                  Icons.mail,
                  color: Colors.brown,
                ),
              )
            ],
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Layout Demo',
        home: Scaffold(
            appBar: AppBar(title: Text('Flutter layout demo')),
            body: ListView(
              children: [
                imageSection,
                titleSection,
                buttonSection,
                bodySection
              ],
            )));
  }
}
