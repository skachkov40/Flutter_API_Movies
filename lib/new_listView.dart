import 'package:flutter/material.dart';
import 'prev.dart';


Widget createListView(BuildContext context, AsyncSnapshot snapshot) {
  return new ListView.builder(
    itemCount: snapshot.data.length,
    itemBuilder: (BuildContext context, int index) {
      return new GestureDetector(
        onTap: (){
          Navigator.pushNamed(context, '/prev',
              arguments: {
                'title': (snapshot.data[index].title),
                'poster': (snapshot.data[index].poster),
                'description': (snapshot.data[index].description),
          },
          );
        },
        child:
        Container(
          padding: const EdgeInsets.all(20.0),
          height: 250.0,
          child: Row(
            children: <Widget> [
              Image.network('https:${snapshot.data[index].poster}'),
          Expanded(
              child: Column(
                textDirection: TextDirection.ltr,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget> [
                  Text(' ${snapshot.data[index].title}',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      //overflow: TextOverflow.ellipsis
                ),
                  Text('   ${snapshot.data[index].year} г.',
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),)

                ],
              )

          )
            ],

          ),
        ),
      );
    },
  );
}