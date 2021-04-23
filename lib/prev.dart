import 'package:flutter/material.dart';

class Prev extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context).settings.arguments as Map;
    if (arguments != null) print(arguments['description']);
    final poster = ('https:' + arguments['poster']);
    return Scaffold(
      appBar: AppBar(
        title: Text('Превью'),
        backgroundColor: Colors.deepPurple,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.star_border,
              color: Colors.white,
            ),
            onPressed: () {},
          )
        ],
      ),
      body: SingleChildScrollView(
        child: GestureDetector(
          onLongPress: () {},
          child: Container(
              padding: const EdgeInsets.all(20.0),
              child: Expanded(
                  child: Column(
                textDirection: TextDirection.ltr,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Image.network(poster),
                  Text(
                    arguments['title'],
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    //overflow: TextOverflow.ellipsis
                  ),
                  Text(
                    arguments['description'],
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  )
                ],
              ))),
        ),
      ),
    );
  }
}
