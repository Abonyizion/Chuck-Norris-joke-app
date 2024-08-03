// To parse this JSON data, do
//
//     final randomJokes = randomJokesFromJson(jsonString);

import 'dart:convert';

RandomJokes randomJokesFromJson(String str) {
  final jsonData = json.decode(str);
  return RandomJokes.fromJson(jsonData);
}

String randomJokesToJson(RandomJokes data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}

class RandomJokes {
  List<dynamic> categories;
  String createdAt;
  String iconUrl;
  String id;
  String updatedAt;
  String url;
  String value;

  RandomJokes({
    required this.categories,
    required this.createdAt,
    required this.iconUrl,
    required this.id,
    required this.updatedAt,
    required this.url,
    required this.value,
  });

  factory RandomJokes.fromJson(Map<String, dynamic> json) => RandomJokes(
    categories: List<dynamic>.from(json["categories"].map((x) => x)),
    createdAt: json["created_at"],
    iconUrl: json["icon_url"],
    id: json["id"],
    updatedAt: json["updated_at"],
    url: json["url"],
    value: json["value"],
  );

  Map<String, dynamic> toJson() => {
    "categories": List<dynamic>.from(categories.map((x) => x)),
    "created_at": createdAt,
    "icon_url": iconUrl,
    "id": id,
    "updated_at": updatedAt,
    "url": url,
    "value": value,
  };
}
