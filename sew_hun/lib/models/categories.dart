// To parse this JSON data, do
//
//     final categories = categoriesFromMap(jsonString);

import 'dart:convert';

class Categories {
  Categories({
    required this.count,
    this.next,
    this.previous,
    required this.results,
  });

  int count;
  dynamic next;
  dynamic previous;
  List<Result> results;

  Categories copyWith({
    required int count,
    dynamic next,
    dynamic previous,
    required List<Result> results,
  }) =>
      Categories(
        count: count,
        next: next ?? this.next,
        previous: previous ?? this.previous,
        results: results,
      );

  factory Categories.fromJson(String str) => Categories.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Categories.fromMap(Map<String, dynamic> json) => Categories(
    count: json["count"],
    next: json["next"],
    previous: json["previous"],
    results: List<Result>.from(json["results"].map((x) => Result.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "count": count,
    "next": next,
    "previous": previous,
    "results": List<dynamic>.from(results.map((x) => x.toMap())),
  };
}

class Result {
  Result({
    required this.id,
    required this.category,
    required this.description,
    required this.image,
  });

  int id;
  String category;
  String description;
  String image;

  Result copyWith({
    required int id,
    required String category,
    required String description,
    required String image,
  }) =>
      Result(
        id: id,
        category: category,
        description: description,
        image: image,
      );

  factory Result.fromJson(String str) => Result.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Result.fromMap(Map<String, dynamic> json) => Result(
    id: json["id"],
    category: json["category"],
    description: json["description"],
    image: json["image"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "category": category,
    "description": description,
    "image": image,
  };
}
