
import 'package:clean_pattern/data/remote/users_remote_impl.dart';
import 'package:clean_pattern/domain/repositories/users_repository.dart';

import '../../domain/entities/response/users_response.dart';

class UsersRepositoryImpl implements UsersRepository {
  final UsersRemoteImpl _remoteData;

  UsersRepositoryImpl({
    required UsersRemoteImpl remoteData
  }): _remoteData = remoteData;

  @override
  Future<UsersResponse> getUsers() async {
    final response = await _remoteData.getUsers();

    if (response.statusCode == 200) {      
      return UsersResponse.fromJson(response.data);
    } else {
      return UsersResponse.empty();
    }    
  }
  
}