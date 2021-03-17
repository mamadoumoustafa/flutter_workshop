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

class ScreenArguments {
  final String title;
  final String body;

  ScreenArguments(this.title, this.body);
}

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First screen'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Launch screen'),
          onPressed: () {
            Navigator.pushNamed(context, '/second',
                arguments: ScreenArguments('Extract arguments screen',
                    'This message is extracted from the build method'));
          },
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ScreenArguments screenArguments =
        ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text(screenArguments.title),
      ),
      body: Center(
        child: Text(screenArguments.body),
      ),
    );

/*     return Scaffold(
      appBar: AppBar(
        title: Text('Second screen'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Go back !'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    ); */
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => FirstScreen(),
        '/second': (context) => SecondScreen()
      },
      title: 'Flutter Layout Demo',
    );
  }
}
