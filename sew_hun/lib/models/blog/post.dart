class Post {
  int? id;
  Author? author;
  List<Comments>? comments;
  String? title;
  String? text;
  String? image;
  String? createdAt;
  String? updatedAt;
  int? reads;
  int? shares;
  Category? category;
  List<Tags>? tags;

  Post(
      {this.id,
        this.author,
        this.comments,
        this.title,
        this.text,
        this.image,
        this.createdAt,
        this.updatedAt,
        this.reads,
        this.shares,
        this.category,
        this.tags});

  Post.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    author =
    json['author'] != null ? new Author.fromJson(json['author']) : null;
    if (json['comments'] != null) {
      comments = <Comments>[];
      json['comments'].forEach((v) {
        comments!.add(new Comments.fromJson(v));
      });
    }
    title = json['title'];
    text = json['text'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    reads = json['reads'];
    shares = json['shares'];
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
    if (json['tags'] != null) {
      tags = <Tags>[];
      json['tags'].forEach((v) {
        tags!.add(new Tags.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.author != null) {
      data['author'] = this.author!.toJson();
    }
    if (this.comments != null) {
      data['comments'] = this.comments!.map((v) => v.toJson()).toList();
    }
    data['title'] = this.title;
    data['text'] = this.text;
    data['image'] = this.image;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['reads'] = this.reads;
    data['shares'] = this.shares;
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    if (this.tags != null) {
      data['tags'] = this.tags!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Author {
  int? id;
  String? username;
  Profile? profile;

  Author({this.id, this.username, this.profile});

  Author.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    profile =
    json['profile'] != null ? new Profile.fromJson(json['profile']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['username'] = this.username;
    if (this.profile != null) {
      data['profile'] = this.profile!.toJson();
    }
    return data;
  }
}

class Profile {
  int? id;
  String? photo;

  Profile({this.id, this.photo});

  Profile.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    photo = json['photo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['photo'] = this.photo;
    return data;
  }
}

class Comments {
  int? id;
  String? comment;
  Author? user;

  Comments({this.id, this.comment, this.user});

  Comments.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    comment = json['comment'];
    user = json['user'] != null ? new Author.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['comment'] = this.comment;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class Category {
  int? id;
  String? category;
  String? description;
  String? image;

  Category({this.id, this.category, this.description, this.image});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    category = json['category'];
    description = json['description'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['category'] = this.category;
    data['description'] = this.description;
    data['image'] = this.image;
    return data;
  }
}

class Tags {
  int? id;
  String? tag;
  String? description;

  Tags({this.id, this.tag, this.description});

  Tags.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tag = json['tag'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['tag'] = this.tag;
    data['description'] = this.description;
    return data;
  }
}