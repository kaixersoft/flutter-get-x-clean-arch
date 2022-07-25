import 'package:dio/dio.dart';

abstract class TodoRemote {
  Future<Response> getTodos();
}