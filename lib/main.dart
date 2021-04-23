import 'package:flutter/material.dart';
import 'package:flutter_api_films/Movie.dart';
import 'new_listView.dart';
import 'get_movies.dart';
import 'prev.dart';
import 'Movie.dart';

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
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: () {
                showSearch(context: context, delegate: MovieSearch());
              },
            ),
            IconButton(
              icon: Icon(
                Icons.star,
                color: Colors.white,
              ),
              onPressed: () {},
            )
          ],
        ),
        body: Container(
          child: FutureBuilder(
              future: getFilms(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                final listMovies = ({snapshot.data});
                if (snapshot.connectionState == ConnectionState.done) {
                  return createListView(context, snapshot);
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              }),
        ));
  }
}

class MovieSearch extends SearchDelegate<Movie> {
  var listMovie = [];

  @override
  List<Widget> buildActions(BuildContext context) {
    return [IconButton(icon: Icon(Icons.clear), onPressed: () {
      query='';
    },)];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(icon: Icon(Icons.arrow_back), onPressed: () {
      close(context, null);
    },);
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final myList = query.isEmpty? listMovie:
    listMovie.where((e) => e.title.startsWith(query)).toList();
    print('$listMovie');
    return myList.isEmpty? Text('Нет совпадений...'): ListView.builder(
        itemCount: myList.length,
        itemBuilder: (context, index){
          return ListTile(title: Text(myList[index].title),);
    });
  }
}