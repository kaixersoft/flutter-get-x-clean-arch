import 'package:dio/dio.dart';

abstract class UsersRemote {

  Future<Response> getUsers();
  
}