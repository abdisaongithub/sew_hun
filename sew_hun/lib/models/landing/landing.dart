class Landing {
  List<Categories>? _categories;
  List<Favorites>? _favorites;

  Landing({List<Categories>? categories, List<Favorites>? favorites}) {
    if (categories != null) {
      this._categories = categories;
    }
    if (favorites != null) {
      this._favorites = favorites;
    }
  }

  List<Categories>? get categories => _categories;
  set categories(List<Categories>? categories) => _categories = categories;
  List<Favorites>? get favorites => _favorites;
  set favorites(List<Favorites>? favorites) => _favorites = favorites;

  Landing.fromJson(Map<String, dynamic> json) {
    if (json['categories'] != null) {
      _categories = <Categories>[];
      json['categories'].forEach((v) {
        _categories!.add(new Categories.fromJson(v));
      });
    }
    if (json['favorites'] != null) {
      _favorites = <Favorites>[];
      json['favorites'].forEach((v) {
        _favorites!.add(new Favorites.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._categories != null) {
      data['categories'] = this._categories!.map((v) => v.toJson()).toList();
    }
    if (this._favorites != null) {
      data['favorites'] = this._favorites!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Categories {
  int? _id;
  String? _category;
  String? _description;
  String? _image;

  Categories({int? id, String? category, String? description, String? image}) {
    if (id != null) {
      this._id = id;
    }
    if (category != null) {
      this._category = category;
    }
    if (description != null) {
      this._description = description;
    }
    if (image != null) {
      this._image = image;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  String? get category => _category;
  set category(String? category) => _category = category;
  String? get description => _description;
  set description(String? description) => _description = description;
  String? get image => _image;
  set image(String? image) => _image = image;

  Categories.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _category = json['category'];
    _description = json['description'];
    _image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['category'] = this._category;
    data['description'] = this._description;
    data['image'] = this._image;
    return data;
  }
}

class Favorites {
  int? _id;
  Post? _post;

  Favorites({int? id, Post? post}) {
    if (id != null) {
      this._id = id;
    }
    if (post != null) {
      this._post = post;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  Post? get post => _post;
  set post(Post? post) => _post = post;

  Favorites.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _post = json['post'] != null ? new Post.fromJson(json['post']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    if (this._post != null) {
      data['post'] = this._post!.toJson();
    }
    return data;
  }
}

class Post {
  int? _id;
  String? _title;
  String? _text;
  String? _image;
  int? _reads;
  int? _shares;
  Categories? _category;

  Post(
      {int? id,
        String? title,
        String? text,
        String? image,
        int? reads,
        int? shares,
        Categories? category}) {
    if (id != null) {
      this._id = id;
    }
    if (title != null) {
      this._title = title;
    }
    if (text != null) {
      this._text = text;
    }
    if (image != null) {
      this._image = image;
    }
    if (reads != null) {
      this._reads = reads;
    }
    if (shares != null) {
      this._shares = shares;
    }
    if (category != null) {
      this._category = category;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  String? get title => _title;
  set title(String? title) => _title = title;
  String? get text => _text;
  set text(String? text) => _text = text;
  String? get image => _image;
  set image(String? image) => _image = image;
  int? get reads => _reads;
  set reads(int? reads) => _reads = reads;
  int? get shares => _shares;
  set shares(int? shares) => _shares = shares;
  Categories? get category => _category;
  set category(Categories? category) => _category = category;

  Post.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _title = json['title'];
    _text = json['text'];
    _image = json['image'];
    _reads = json['reads'];
    _shares = json['shares'];
    _category = json['category'] != null
        ? new Categories.fromJson(json['category'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['title'] = this._title;
    data['text'] = this._text;
    data['image'] = this._image;
    data['reads'] = this._reads;
    data['shares'] = this._shares;
    if (this._category != null) {
      data['category'] = this._category!.toJson();
    }
    return data;
  }
}
