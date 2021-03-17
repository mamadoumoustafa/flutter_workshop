import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'returning data',
    home: HomeScreen(),
  ));
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

class SelectionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          _navigateAndDisplaySelection(context);
        },
        child: Text('Pick an option, any option'));
  }

  _navigateAndDisplaySelection(BuildContext context) async {
    final result = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => SelectionScreen()));

    Scaffold.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text("$result")));
  }
}

class SelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Selection screen'),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context, 'YES !');
                  },
                  child: Text('Yes !')),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context, 'NO !');
                  },
                  child: Text('No !')),
            )
          ],
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Returning data demo'),
      ),
      body: Center(
        child: SelectionButton(),
      ),
    );
  }
}
