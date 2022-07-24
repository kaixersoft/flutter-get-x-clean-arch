import 'package:clean_pattern/data/remote/users_remote_impl.dart';
import 'package:clean_pattern/data/repositories/users_repository_impl.dart';
import 'package:clean_pattern/domain/repositories/users_repository.dart';
import 'package:clean_pattern/domain/usecases/get_users_usecase.dart';
import 'package:get/get.dart';

import '../../../../presentation/users/controllers/users.controller.dart';

class UsersControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UsersController>(
      () => UsersController(
              getUsersUseCase: Get.put(GetUsersUseCase(
                                  usersRepository: Get.put(UsersRepositoryImpl(
                                                              remoteData: UsersRemoteImpl()))))),      
    );
  }
}
