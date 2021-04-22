import 'Movie.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

Future getFilms() async {
  final token = 'cbe636e1ec8c9cb87609ab0a6c42b26f';
  final url = 'https://run.mocky.io/v3/f1354ed5-d5a8-489d-934d-2a1e8470dc94';

  final response = await http.post(Uri.parse(url));
  var resp = response.body;
  if (response.statusCode == 200) {
    final items = jsonDecode(resp)['movies'];
    //debugPrint("декодируем $items");
    var movies = items.map<Movie>((json) {
      return Movie.fromJson(json);
    }).toList();
    return movies;
  } else {
    print('Не загрузились данные.');
    return null;
  }
}