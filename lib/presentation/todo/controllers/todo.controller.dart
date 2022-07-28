import 'package:clean_pattern/domain/usecases/get_todos_usecase.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class TodoController extends GetxController {
  final GetTodosUsecase _getTodosUsecase;
  final _logger = Logger();

  TodoController({
    required GetTodosUsecase getTodosUsecase
  }) : _getTodosUsecase = getTodosUsecase;

  var todoList = [].obs;

  var todoLength = 0.obs;

  Future<void> GetTodos() async {
    try {
      final result = await _getTodosUsecase.call(null);
      
      todoLength.value = result.todos.length;

      todoList.value = result.todos.toList();
    } catch(e) {
      _logger.e(e);
    }
  }
 


}
