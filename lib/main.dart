import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class FirstRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First route'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Open route'),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SecondRoute()));
          },
        ),
      ),
    );
  }
}

class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second route'),
      ),
      body: Center(
          child: ElevatedButton(
        child: Text('Go back'),
        onPressed: () {
          Navigator.pop(context);
        },
      )),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Layout Demo',
        home: Scaffold(
            //  appBar: AppBar(title: Text('Flutter layout demo')),
            body: FirstRoute()));
  }
}
