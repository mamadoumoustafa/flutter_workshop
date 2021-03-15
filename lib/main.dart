import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

Widget _buildImage() => Hero(
      tag: 'imageHero',
      child: Image.network(
        'https://picsum.photos/250?image=9',
      ),
    );

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main screen'),
      ),
      body: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) {
            return DetailScreen();
          }));
        },
        child: _buildImage(),
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Center(
          child: _buildImage(),
        ),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
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
            //  appBar: AppBar(title: Text('Flutter layout demo')),
            body: MainScreen()));
  }
}
