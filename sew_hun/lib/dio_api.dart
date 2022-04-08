import 'package:dio/dio.dart';

const hostAddress = 'app.sewhun.com';
const mediaUrl = 'https://sewhun.com';
const baseUrl = 'https://app.sewhun.com/';

// const baseUrl = 'http://192.168.43.46:8000/';
// const hostAddress = '192.168.43.46';

var options = BaseOptions(
    baseUrl: baseUrl,
    connectTimeout: 20000,
    receiveTimeout: 30000,
    headers: {
      'host': hostAddress,
    });

Dio dio_api = Dio(options);
