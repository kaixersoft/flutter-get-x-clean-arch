
import 'package:clean_pattern/data/remote/todos_remote_impl.dart';
import 'package:clean_pattern/domain/entities/response/todos_response.dart';
import 'package:clean_pattern/domain/repositories/todo_repository.dart';
import 'package:logger/logger.dart';
import '../remote/todos_remote_impl.dart';

class TodoRepositoryImpl implements TodoRepository {
  
  final TodoRemoteImpl _todoRemoteData;
  final _logger = Logger();

  TodoRepositoryImpl({
    required TodoRemoteImpl todoRemoteData
  }) : _todoRemoteData = todoRemoteData;

  List<TodosResponse> todoList = [];

  @override
  Future<List<TodosResponse>> getTodos() async {
    final response = await _todoRemoteData.getTodos();

    if (response.statusCode == 200) {
      await response.data.toList().forEach((todo) {
        todoList.add(TodosResponse.fromJson(todo));
      });
      
      return todoList;
    } else {
      return [TodosResponse.empty()];      
    }
  }
  
}