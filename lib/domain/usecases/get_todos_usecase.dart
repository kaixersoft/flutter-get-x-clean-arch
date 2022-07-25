import 'package:clean_pattern/core/base/base_usecase.dart';
import 'package:clean_pattern/domain/entities/response/todos_respose.backup.dart';
import 'package:clean_pattern/domain/repositories/todo_repository.dart';

import '../entities/response/todo_response.dart';

class GetTodosUsecase extends BaseUseCase<GetTodosUseCaseResult, void> {
  final TodoRepository _todoRepository;

  GetTodosUsecase({
    required TodoRepository todoRepository
  }) : _todoRepository = todoRepository;


  @override
  Future<GetTodosUseCaseResult> call(void params) async {
    try {
      return GetTodosUseCaseResult(todos: await _todoRepository.getTodos());
    } on Exception catch(e) {
      return GetTodosUseCaseResult(todos: [TodoResponse.empty()], exception: e);
    }  
  }

}

class GetTodosUseCaseResult extends UseCaseResult {
  final List<dynamic> todos;
  final Exception? exception;

  GetTodosUseCaseResult({
    required this.todos,
    this.exception
  }) : super(exception: exception);
}