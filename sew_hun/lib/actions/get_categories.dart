import 'package:dio/dio.dart';
import 'package:sew_hun/dio_api.dart';
import 'package:sew_hun/models/categories.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class GetCategories {
  static Future<dynamic> get_categories() async {
    final storage = FlutterSecureStorage();

    Categories categories;

    Response response = await dio_api.get(
      'blog/categories/',
      options: Options(
        headers: {
          'Authorization': "Token ${await storage.read(key: 'token')}",
        },
      ),
    );

    print(response.data);
    if (response.statusCode == 200) {
      categories = Categories.fromMap(response.data);
    } else {
      categories = Categories(count: 1, results: [Result(id: 1, image: 'error', category: 'error', description: 'error')]);
    }
    return categories;
  }
}
