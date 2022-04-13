class Landing {
  List<Categories>? categories;
  List<Tags>? tags;
  List<Favorites>? favorites;
  List<Read>? read;
  User? user;
  String? release;
  bool? forceUpdate;
  String? forceUrl;

  Landing(
      {this.categories,
      this.tags,
      this.favorites,
      this.read,
      this.user,
      this.release,
      this.forceUpdate,
      this.forceUrl});

  Landing.fromJson(Map<String, dynamic> json) {
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(new Categories.fromJson(v));
      });
    }
    if (json['tags'] != null) {
      tags = <Tags>[];
      json['tags'].forEach((v) {
        tags!.add(new Tags.fromJson(v));
      });
    }
    if (json['favorites'] != null) {
      favorites = <Favorites>[];
      json['favorites'].forEach((v) {
        favorites!.add(new Favorites.fromJson(v));
      });
    }
    if (json['read'] != null) {
      read = <Read>[];
      json['read'].forEach((v) {
        read!.add(new Read.fromJson(v));
      });
    }
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    release = json['release'];
    forceUpdate = json['force_update'];
    forceUrl = json['force_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.categories != null) {
      data['categories'] = this.categories!.map((v) => v.toJson()).toList();
    }
    if (this.tags != null) {
      data['tags'] = this.tags!.map((v) => v.toJson()).toList();
    }
    if (this.favorites != null) {
      data['favorites'] = this.favorites!.map((v) => v.toJson()).toList();
    }
    if (this.read != null) {
      data['read'] = this.read!.map((v) => v.toJson()).toList();
    }
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['release'] = this.release;
    data['force_update'] = this.forceUpdate;
    data['force_url'] = this.forceUrl;
    return data;
  }
}

class Categories {
  int? id;
  String? category;
  String? description;
  String? image;

  Categories({this.id, this.category, this.description, this.image});

  Categories.fromJson(Map<String, dynamic> json) {
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

class Favorites {
  int? id;
  Post? post;

  Favorites({this.id, this.post});

  Favorites.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    post = json['post'] != null ? new Post.fromJson(json['post']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.post != null) {
      data['post'] = this.post!.toJson();
    }
    return data;
  }
}

class Post {
  int? id;
  String? title;
  String? text;
  String? sample;
  String? image;
  int? reads;
  int? shares;
  Categories? category;

  Post(
      {this.id,
      this.title,
      this.text,
      this.sample,
      this.image,
      this.reads,
      this.shares,
      this.category});

  Post.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    text = json['text'];
    sample = json['sample'];
    image = json['image'];
    reads = json['reads'];
    shares = json['shares'];
    category = json['category'] != null
        ? new Categories.fromJson(json['category'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['text'] = this.text;
    data['sample'] = this.sample;
    data['image'] = this.image;
    data['reads'] = this.reads;
    data['shares'] = this.shares;
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    return data;
  }
}

class Read {
  int? id;
  String? title;
  String? sample;
  String? image;
  Categories? category;

  Read({this.id, this.title, this.sample, this.image, this.category});

  Read.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    sample = json['sample'];
    image = json['image'];
    category = json['category'] != null
        ? new Categories.fromJson(json['category'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['sample'] = this.sample;
    data['image'] = this.image;
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    return data;
  }
}

class User {
  int? id;
  String? username;
  String? email;
  String? firstName;
  String? lastName;

  User({this.id, this.username, this.email, this.firstName, this.lastName});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    email = json['email'];
    firstName = json['first_name'];
    lastName = json['last_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['username'] = this.username;
    data['email'] = this.email;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    return data;
  }
}
