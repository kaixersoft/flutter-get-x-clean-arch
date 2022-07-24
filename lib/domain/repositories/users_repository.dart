import '../entities/response/users_response.dart';

abstract class UsersRepository {
  Future<UsersResponse> getUsers();
}