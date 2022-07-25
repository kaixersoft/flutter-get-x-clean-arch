import 'package:clean_pattern/infrastructure/network/pretty_dio_logger.dart';
import 'package:dio/dio.dart';

class DioClient {
  static const String baseUrl = 'https://jsonplaceholder.typicode.com';

  static Dio? _instance;

  static final BaseOptions _options = BaseOptions(
    baseUrl: baseUrl,
    connectTimeout: 60 * 1000,
    receiveTimeout: 60 * 1000,
    responseType: ResponseType.json,
  );

  static const int _maxLineWidth = 90;
  static final _prettyDioLogger = PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
      compact: true,
      maxWidth: _maxLineWidth);  

  static Dio get httpDio {
    if (_instance == null) {
      _instance = Dio(_options);

      _instance!.interceptors.add(_prettyDioLogger);

      return _instance!;
    } else {
      _instance!.interceptors.clear();
      _instance!.interceptors.add(_prettyDioLogger);

      return _instance!;
    }
  }
}