import 'package:flutter/material.dart';
import 'new_listView.dart';
import 'get_movies.dart';
import 'prev.dart';



void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Кино',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: new ListDisplay(),
        routes: <String, WidgetBuilder>{
          '/prev': (BuildContext context) => Prev(),
        });
  }
}

class ListDisplay extends StatefulWidget {
  @override
  _ListDisplayState createState() => new _ListDisplayState();
}

class _ListDisplayState extends State<ListDisplay> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          title: Text('API КиноПоиск'),
        ),
        body: Container(
          child: FutureBuilder(
              future: getFilms(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                print("cнапшот.дата ${snapshot.data}");
                if (snapshot.connectionState == ConnectionState.done) {
                  return createListView(context, snapshot);
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              }),
        ));
  }
}


