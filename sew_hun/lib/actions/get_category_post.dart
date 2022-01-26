import 'package:dio/dio.dart';
import 'package:sew_hun/dio_api.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:sew_hun/models/category_post.dart';

class GetCategoryPost {
  static Future<dynamic> get_category_post(int id) async {
    final storage = FlutterSecureStorage();

    CategoryPost categoryPost;

    Response response = await dio_api.get(
      'blog/categories/posts/$id/',
      options: Options(
        headers: {
          'Authorization': "Token ${await storage.read(key: 'token')}",
        },
      ),
    );

    // print(response.data.toString());

    if (response.statusCode == 200) {
      categoryPost = CategoryPost.fromMap(response.data);
    } else {
      categoryPost = CategoryPost(
        data: [
          Datum(
            id: 1,
            title: 'error',
            text: 'error',
            image: 'error',
            reads: 0,
          )
        ],
      );
    }
    return categoryPost;
  }
}
  