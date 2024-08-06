import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:joke_app/model/model.dart';

class JokeProvider extends ChangeNotifier{
  RandomJokes? _jokes;
  RandomJokes? get joke => _jokes;
    Future<void> getJokes(BuildContext context) async {
    
      final response = await http.get(Uri.parse("https://api.chucknorris.io/jokes/random"));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        _jokes = RandomJokes.fromJson(data);
        notifyListeners();
      } else {
        throw Exception('error loading');
      }
  }
}
