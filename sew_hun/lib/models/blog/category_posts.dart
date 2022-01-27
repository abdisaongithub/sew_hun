import 'dart:convert';
/// posts : [{"id":1,"title":"Healthy Title","text":"ad'oinlk df;","image":"/media/photos/posts/Screenshot_1629763897.png","reads":0}]

CategoryPosts categoryPostsFromJson(String str) => CategoryPosts.fromJson(json.decode(str));
String categoryPostsToJson(CategoryPosts data) => json.encode(data.toJson());
class CategoryPosts {
  CategoryPosts({
      List<Posts>? posts,}){
    _posts = posts;
}

  CategoryPosts.fromJson(dynamic json) {
    if (json['posts'] != null) {
      _posts = [];
      json['posts'].forEach((v) {
        _posts?.add(Posts.fromJson(v));
      });
    }
  }
  List<Posts>? _posts;

  List<Posts>? get posts => _posts;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_posts != null) {
      map['posts'] = _posts?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 1
/// title : "Healthy Title"
/// text : "ad'oinlk df;"
/// image : "/media/photos/posts/Screenshot_1629763897.png"
/// reads : 0

Posts postsFromJson(String str) => Posts.fromJson(json.decode(str));
String postsToJson(Posts data) => json.encode(data.toJson());
class Posts {
  Posts({
      int? id, 
      String? title, 
      String? text, 
      String? image, 
      int? reads,}){
    _id = id;
    _title = title;
    _text = text;
    _image = image;
    _reads = reads;
}

  Posts.fromJson(dynamic json) {
    _id = json['id'];
    _title = json['title'];
    _text = json['text'];
    _image = json['image'];
    _reads = json['reads'];
  }
  int? _id;
  String? _title;
  String? _text;
  String? _image;
  int? _reads;

  int? get id => _id;
  String? get title => _title;
  String? get text => _text;
  String? get image => _image;
  int? get reads => _reads;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['title'] = _title;
    map['text'] = _text;
    map['image'] = _image;
    map['reads'] = _reads;
    return map;
  }

}