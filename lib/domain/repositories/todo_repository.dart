
import 'package:clean_pattern/domain/entities/response/todos_response.dart';

abstract class TodoRepository {
  Future<List<TodosResponse>> getTodos();
}