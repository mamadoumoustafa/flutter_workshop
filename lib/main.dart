import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Todo list',
    home: MyApp(),
  ));
}

class Todo {
  final String title;
  final String description;

  Todo(this.title, this.description);
}

final todos = List<Todo>.generate(20,
    (i) => Todo('todo $i', 'description of what needs too be done in todo $i'));

class DetailsScreen extends StatelessWidget {
  // final Todo todo;

  // const DetailsScreen({Key key, this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Todo todo = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text('Todo details page'),
      ),
      body: Center(
        child: Text(todo.description),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo list'),
      ),
      body: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(todos[index].title),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DetailsScreen(),
                      settings: RouteSettings(
                        arguments: todos[index],
                      )));
            },
          );
        },
      ),
    );
  }
}
