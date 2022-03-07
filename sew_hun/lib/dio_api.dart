import 'package:dio/dio.dart';

const baseUrl = 'http://192.168.43.46:8000/';
// const baseUrl = 'https://app.sewhun.com/';

var options = BaseOptions(
  baseUrl: baseUrl,
  connectTimeout: 7000,
  receiveTimeout: 5000,
);

Dio dio_api = Dio(options);
