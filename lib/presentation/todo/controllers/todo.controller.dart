import 'package:clean_pattern/domain/entities/response/todos_respose.backup.dart';
import 'package:clean_pattern/domain/usecases/get_todos_usecase.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../../../domain/entities/response/todo_response.dart';

class TodoController extends GetxController {
  final GetTodosUsecase _getTodosUsecase;
  final _logger = Logger();

  TodoController({
    required GetTodosUsecase getTodosUsecase
  }) : _getTodosUsecase = getTodosUsecase;

  List<TodoResponse> todoList = [];

  Future<void> GetTodos() async {
    try {
      final result = await _getTodosUsecase.call(null);

      _logger.i('RESULT ANYARE');
      _logger.i(result);
      // _logger.i(result.todos.length);
      
    } catch(e) {
      _logger.e(e);
    }
  }
 


}
