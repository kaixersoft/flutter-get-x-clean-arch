
import 'package:clean_pattern/core/base/base_remote.dart';
import 'package:clean_pattern/data/remote/todos_remote.dart';
import 'package:dio/dio.dart';


class TodoRemoteImpl extends BaseRemote implements TodoRemote {

  @override
  Future<Response> getTodos() async {
    try {
      Response response = await apiRequest(url: '/todos', method: ApiMethod.GET);
      return response;
    } catch(e) {
      rethrow;
    }      
  }
  
}