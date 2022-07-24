
import 'package:clean_pattern/infrastructure/network/dio_client.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

enum ApiMethod { POST, GET, PUT, DELETE, PATCH }

abstract class BaseRemote {
  final _httpClient = DioClient.httpDio;
  final _logger = Logger();

  Future<Response> apiRequest({
      required String url,
      required ApiMethod method,
      Map<String, dynamic>? params,
      Map<String, dynamic>? requestHeaders}) async {
    
    Response response;
    Map<String, String> defaultHeader = {"Content-Type": "application/json"};

    try {
      if (method == ApiMethod.POST) {
        response = await _httpClient.post(url,
            data: params,
            options: Options(
                followRedirects: false,
                validateStatus: (status) {
                  return status! < 500;
                },
                headers: {...defaultHeader, ...?requestHeaders}));
      } else if (method == ApiMethod.DELETE) {
        response = await _httpClient.delete(url,
            options: Options(
                followRedirects: false,
                validateStatus: (status) {
                  return status! < 500;
                },
                headers: {...defaultHeader, ...?requestHeaders}));
      } else if (method == ApiMethod.PATCH) {
        response = await _httpClient.patch(url,
            options: Options(
                followRedirects: false,
                validateStatus: (status) {
                  return status! < 500;
                },
                headers: {...defaultHeader, ...?requestHeaders}));
      } else if (method == ApiMethod.PUT) {
        response = await _httpClient.put(url,
            data: params,
            options: Options(
                followRedirects: false,
                validateStatus: (status) {
                  return status! < 500;
                },
                headers: {...defaultHeader, ...?requestHeaders}));
      } else {
        response = await _httpClient.get(url,
            queryParameters: params,
            options: Options(
                followRedirects: false,
                validateStatus: (status) {
                  return status! < 500;
                },
            headers: {...defaultHeader, ...?requestHeaders}));
      }

      return response;
    } on DioError catch (e) {
      _logger.e('HTTP ERROR: ${e.message}');
      throw Exception('http error');
    } catch (e) {
      _logger.e(e);
      throw Exception('Something went wrong');
    }
  }  

  
    
}