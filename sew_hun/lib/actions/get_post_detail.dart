import 'package:dio/dio.dart';
import 'package:sew_hun/dio_api.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:sew_hun/models/post_detail.dart';

class GetPostDetail {
  static Future<dynamic> get_post_detail(int id) async {
    final storage = FlutterSecureStorage();

    PostDetail postDetail;

    Response response = await dio_api.get(
      'blog/posts/$id/',
      options: Options(
        headers: {
          'Authorization': "Token ${await storage.read(key: 'token')}",
        },
      ),
    );

    print(response.data);

    if (response.statusCode == 200) {
      postDetail = PostDetail.fromMap(response.data);
    } else {
      postDetail = 'error' as PostDetail;
    }
    return postDetail;
  }
}
