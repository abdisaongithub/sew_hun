class CategoryPosts {
  List<Posts>? posts;

  CategoryPosts({this.posts});

  CategoryPosts.fromJson(Map<String, dynamic> json) {
    if (json['posts'] != null) {
      posts = <Posts>[];
      json['posts'].forEach((v) {
        posts!.add(new Posts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.posts != null) {
      data['posts'] = this.posts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Posts {
  int? id;
  String? title;
  String? sample;
  String? image;
  int? reads;

  Posts({this.id, this.title, this.sample, this.image, this.reads});

  Posts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    sample = json['sample'];
    image = json['image'];
    reads = json['reads'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['sample'] = this.sample;
    data['image'] = this.image;
    data['reads'] = this.reads;
    return data;
  }
}
