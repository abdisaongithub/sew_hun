// To parse this JSON data, do
//
//     final categoryPost = categoryPostFromMap(jsonString);

import 'dart:convert';

class CategoryPost {
  CategoryPost({
    required this.data,
  });

  List<Datum> data;

  CategoryPost copyWith({
    required List<Datum> data,
  }) =>
      CategoryPost(
        data: data,
      );

  factory CategoryPost.fromJson(String str) => CategoryPost.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CategoryPost.fromMap(Map<String, dynamic> json) => CategoryPost(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "data": List<dynamic>.from(data.map((x) => x.toMap())),
  };
}

class Datum {
  Datum({
    required this.id,
    required this.title,
    required this.text,
    required this.image,
    required this.reads,
  });

  int id;
  String title;
  String text;
  String image;
  int reads;

  Datum copyWith({
    required int id,
    required String title,
    required String text,
    required String image,
    required int reads,
  }) =>
      Datum(
        id: id,
        title: title,
        text: text,
        image: image,
        reads: reads,
      );

  factory Datum.fromJson(String str) => Datum.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
    id: json["id"],
    title: json["title"],
    text: json["text"],
    image: json["image"],
    reads: json["reads"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "title": title,
    "text": text,
    "image": image,
    "reads": reads,
  };
}
