import 'dart:convert';
/// count : 3
/// next : "http://192.168.43.46:8000/blog/categories/?page=3"
/// previous : "http://192.168.43.46:8000/blog/categories/"
/// results : [{"id":2,"category":"Psychology","description":"psychology","image":"http://192.168.43.46:8000/media/photos/categories/zwVunsFaLGin6zmPzWbfU8Q0junnVrvgeQQWpt8g.jpg"}]

Categories categoryFromJson(String str) => Categories.fromJson(json.decode(str));
String categoryToJson(Categories data) => json.encode(data.toJson());
class Categories {
  Categories({
      int? count, 
      String? next, 
      String? previous, 
      List<Results>? results,}){
    _count = count;
    _next = next;
    _previous = previous;
    _results = results;
}

  Categories.fromJson(dynamic json) {
    _count = json['count'];
    _next = json['next'];
    _previous = json['previous'];
    if (json['results'] != null) {
      _results = [];
      json['results'].forEach((v) {
        _results?.add(Results.fromJson(v));
      });
    }
  }
  int? _count;
  String? _next;
  String? _previous;
  List<Results>? _results;

  int? get count => _count;
  String? get next => _next;
  String? get previous => _previous;
  List<Results>? get results => _results;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['count'] = _count;
    map['next'] = _next;
    map['previous'] = _previous;
    if (_results != null) {
      map['results'] = _results?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 2
/// category : "Psychology"
/// description : "psychology"
/// image : "http://192.168.43.46:8000/media/photos/categories/zwVunsFaLGin6zmPzWbfU8Q0junnVrvgeQQWpt8g.jpg"

Results resultsFromJson(String str) => Results.fromJson(json.decode(str));
String resultsToJson(Results data) => json.encode(data.toJson());
class Results {
  Results({
      int? id, 
      String? category, 
      String? description, 
      String? image,}){
    _id = id;
    _category = category;
    _description = description;
    _image = image;
}

  Results.fromJson(dynamic json) {
    _id = json['id'];
    _category = json['category'];
    _description = json['description'];
    _image = json['image'];
  }
  int? _id;
  String? _category;
  String? _description;
  String? _image;

  int? get id => _id;
  String? get category => _category;
  String? get description => _description;
  String? get image => _image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['category'] = _category;
    map['description'] = _description;
    map['image'] = _image;
    return map;
  }

}