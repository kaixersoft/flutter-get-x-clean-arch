import 'package:clean_pattern/data/local/shared_preferrence/preferrence_manager.dart';
import 'package:clean_pattern/data/local/shared_preferrence/preferrence_manager_impl.dart';
import 'package:get/get.dart';


class LocalStorageService extends GetxService {

  final PreferenceManager _preferenceManager =  Get.put(
    PreferenceManagerImpl(),
    tag: (PreferenceManager).toString(),
    permanent: true
  );

  void clear() => _preferenceManager.clear();

  Future<void> setIdToken(String idToken) async => await _preferenceManager.setString(PreferenceManager.idToken, idToken);
  
  Future<String> getIdToken() async => await _preferenceManager.getString(PreferenceManager.idToken);

}