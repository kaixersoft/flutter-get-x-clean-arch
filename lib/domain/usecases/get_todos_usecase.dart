import 'package:clean_pattern/core/base/base_usecase.dart';
import 'package:clean_pattern/domain/entities/response/todos_response.dart';
import 'package:clean_pattern/domain/repositories/todo_repository.dart';
import 'package:logger/logger.dart';
class GetTodosUsecase extends BaseUseCase<GetTodosUseCaseResult, void> {
  final TodoRepository _todoRepository;
  final _logger = Logger();

  GetTodosUsecase({
    required TodoRepository todoRepository
  }) : _todoRepository = todoRepository;


  @override
  Future<GetTodosUseCaseResult> call(void params) async {
    try {
      var todoList = await _todoRepository.getTodos();
      return GetTodosUseCaseResult(todos: todoList);
    } on Exception catch(e) {
      return GetTodosUseCaseResult(todos: [TodosResponse.empty()], exception: e);
    }  
  }

}

class GetTodosUseCaseResult extends UseCaseResult {
  final List<TodosResponse> todos;
  final Exception? exception;

  GetTodosUseCaseResult({
    required this.todos,
    this.exception
  }) : super(exception: exception);
}