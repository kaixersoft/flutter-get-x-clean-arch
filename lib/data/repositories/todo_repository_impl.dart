
import 'package:clean_pattern/data/remote/todos_remote_impl.dart';
import 'package:clean_pattern/domain/entities/response/todo_response.dart';
import 'package:clean_pattern/domain/entities/response/todos_respose.backup.dart';
import 'package:clean_pattern/domain/repositories/todo_repository.dart';
import 'package:logger/logger.dart';
import '../remote/todos_remote_impl.dart';

class TodoRepositoryImpl implements TodoRepository {
  
  TodoRemoteImpl _todoRemoteData;
  final _logger = Logger();

  TodoRepositoryImpl({
    required TodoRemoteImpl todoRemoteData
  }) : _todoRemoteData = todoRemoteData;

  List<dynamic> todoList = [];

  @override
  Future<List<dynamic>> getTodos() async {
    final response = await _todoRemoteData.getTodos();

    if (response.statusCode == 200) {      
      todoList = todoResponseFromJson(response.data);
      _logger.i('inside repo');
      _logger.i(todoList);
      return todoList;
    } else {
      return [TodoResponse.empty()];      
    }
  }
  
}