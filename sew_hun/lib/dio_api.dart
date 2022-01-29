import 'package:dio/dio.dart';

const baseUrl = 'http://192.168.42.243:8000/';

var options = BaseOptions(
  baseUrl: baseUrl,
  connectTimeout: 5000,
  receiveTimeout: 3000,
);

Dio dio_api = Dio(options);
