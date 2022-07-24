
import 'package:clean_pattern/core/base/base_usecase.dart';
import 'package:clean_pattern/domain/entities/response/users_response.dart';
import 'package:clean_pattern/domain/repositories/users_repository.dart';

class GetUsersUseCase extends BaseUseCase<GetUsersUseCaseResult, void>{
  final UsersRepository _usersRepository;

  GetUsersUseCase({
    required UsersRepository usersRepository
  }) : _usersRepository = usersRepository;

  
  @override
  Future<GetUsersUseCaseResult> call(void params) async {
    try {
      return GetUsersUseCaseResult(users: await _usersRepository.getUsers());
    } on Exception catch(e) {
      return GetUsersUseCaseResult(users: UsersResponse.empty(), exception: e);
    }
  }

}

class GetUsersUseCaseResult extends UseCaseResult{
  final UsersResponse users;
  final Exception? exception;
  
  GetUsersUseCaseResult({
    required this.users,
    this.exception,
  }) : super(exception: exception);

}