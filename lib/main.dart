import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

void main() => runApp(MyApp());

class Kitten {
  Kitten({
    this.name,
    this.description,
    this.age
  });

  final String name;
  final String description;
  int age;
}

final List<Kitten> _kittens = <Kitten>[
  Kitten(name: 'Mittens', age: 13, description: 'Mittens is pretty old.'),
  Kitten(name: 'Fluffy', age: 7, description: 'Fluffy is half of Mittens age.'),
];


class MyApp extends HookWidget {
  // This widget is the root of your application.
  Widget _listItemBuilder(BuildContext context, int index) {
    return new Container(
      padding: const EdgeInsets.all(20),
      child: new Slider(
        label: _kittens[index].name,
        min: 0,
        max: 20,
        activeColor: Colors.blue,
        value: _kittens[index].age.toDouble(),
        onChanged: (double newValue) {
          
        }
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    final counter = useState(10);

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text('Hooks'),
        ),
        body: ListView.builder(
          itemCount: _kittens.length,
          itemExtent: 60,
          itemBuilder: _listItemBuilder
        ),
        bottomNavigationBar: BottomAppBar(
          child: new Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              '${counter.value.toString()} times clicked', 
              style: Theme.of(context).textTheme.headline
            )
          ),
          color: Colors.blue,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            counter.value++;
          },
          tooltip: 'Increment',
          child: Icon(Icons.announcement),
        ), // This trailing comma makes auto-formatting nicer for build methods.
      )
    );
  }
}
