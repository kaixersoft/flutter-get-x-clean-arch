import 'package:clean_pattern/domain/usecases/get_users_usecase.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../../../domain/entities/response/users_response.dart';

class UsersController extends GetxController {
  final GetUsersUseCase _getUsersUseCase;
  final _logger = Logger();

  UsersController({
    required GetUsersUseCase getUsersUseCase
  }) : _getUsersUseCase = getUsersUseCase;

  var usersCount = 0.obs;
  List<Data> usersList = [];
  UsersResponse usersReponse = UsersResponse.empty();

  Future<void> GetUsersList() async {
    try {
      final result = await _getUsersUseCase.call(null);
      
      usersCount.value = result.users.total ?? 0;
      
      result.users.data?.forEach((user) {
        usersList.add(user);
      });

    } catch(e) {
      _logger.e(e);
    }
  }


  @override
  void onReady() {
    // GetUsersList();
    super.onReady();
  }
}
