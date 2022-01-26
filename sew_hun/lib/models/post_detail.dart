// To parse this JSON data, do
//
//     final postDetail = postDetailFromMap(jsonString);

import 'dart:convert';

class PostDetail {
  PostDetail({
    required this.id,
    required this.author,
    required this.comments,
    required this.title,
    required this.text,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
    required this.reads,
    required this.shares,
    required this.category,
    required this.tags,
  });

  int id;
  Author author;
  List<Comment> comments;
  String title;
  String text;
  String image;
  DateTime createdAt;
  DateTime updatedAt;
  int reads;
  int shares;
  Category category;
  List<Tag> tags;

  factory PostDetail.fromJson(String str) => PostDetail.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PostDetail.fromMap(Map<String, dynamic> json) => PostDetail(
    id: json["id"],
    author: Author.fromMap(json["author"]),
    comments: List<Comment>.from(json["comments"].map((x) => Comment.fromMap(x))),
    title: json["title"],
    text: json["text"],
    image: json["image"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    reads: json["reads"],
    shares: json["shares"],
    category: Category.fromMap(json["category"]),
    tags: List<Tag>.from(json["tags"].map((x) => Tag.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "author": author.toMap(),
    "comments": List<dynamic>.from(comments.map((x) => x.toMap())),
    "title": title,
    "text": text,
    "image": image,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "reads": reads,
    "shares": shares,
    "category": category.toMap(),
    "tags": List<dynamic>.from(tags.map((x) => x.toMap())),
  };
}

class Author {
  Author({
    required this.id,
    required this.username,
    required this.profile,
  });

  int id;
  String username;
  Profile profile;

  factory Author.fromJson(String str) => Author.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Author.fromMap(Map<String, dynamic> json) => Author(
    id: json["id"],
    username: json["username"],
    profile: Profile.fromMap(json["profile"]),
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "username": username,
    "profile": profile.toMap(),
  };
}

class Profile {
  Profile({
    required this.id,
    required this.photo,
  });

  int id;
  String photo;

  factory Profile.fromJson(String str) => Profile.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Profile.fromMap(Map<String, dynamic> json) => Profile(
    id: json["id"],
    photo: json["photo"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "photo": photo,
  };
}

class Category {
  Category({
    required this.id,
    required this.category,
    required this.description,
    required this.image,
  });

  int id;
  String category;
  String description;
  String image;

  factory Category.fromJson(String str) => Category.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Category.fromMap(Map<String, dynamic> json) => Category(
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

class Comment {
  Comment({
    required this.id,
    required this.comment,
    required this.user,
  });

  int id;
  String comment;
  Author user;

  factory Comment.fromJson(String str) => Comment.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Comment.fromMap(Map<String, dynamic> json) => Comment(
    id: json["id"],
    comment: json["comment"],
    user: Author.fromMap(json["user"]),
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "comment": comment,
    "user": user.toMap(),
  };
}

class Tag {
  Tag({
    required this.id,
    required this.tag,
    required this.description,
  });

  int id;
  String tag;
  String description;

  factory Tag.fromJson(String str) => Tag.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Tag.fromMap(Map<String, dynamic> json) => Tag(
    id: json["id"],
    tag: json["tag"],
    description: json["description"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "tag": tag,
    "description": description,
  };
}
