
import 'package:clean_pattern/core/base/base_remote.dart';
import 'package:clean_pattern/data/remote/users_remote.dart';
import 'package:dio/dio.dart';

class UsersRemoteImpl  extends BaseRemote implements UsersRemote {
  
  @override
  Future<Response> getUsers() async {
    try {
      Response response = await apiRequest(url: '/users', method: ApiMethod.GET);
      return response;
    } catch(e) {
      rethrow;
    }  
  }
  
}