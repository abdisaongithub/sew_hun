import 'package:dio/dio.dart';

// const baseAddress = '192.168.137.174';
const hostAddress = 'app.sewhun.com';
const mediaUrl = 'https://sewhun.com';

// const baseUrl = 'http://192.168.43.46:8000/';
// const baseUrl = 'http://192.168.137.174:8000/';

const baseUrl = 'https://app.sewhun.com/';

var options = BaseOptions(
  baseUrl: baseUrl,
  connectTimeout: 20000,
  receiveTimeout: 30000,
);

Dio dio_api = Dio(options);
