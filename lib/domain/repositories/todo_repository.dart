
import '../entities/response/todo_response.dart';

abstract class TodoRepository {
  Future<List<dynamic>> getTodos();
}