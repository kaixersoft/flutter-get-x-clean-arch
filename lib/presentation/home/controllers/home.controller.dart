import 'package:clean_pattern/data/local/shared_preferrence/preferrence_manager.dart';
import 'package:clean_pattern/infrastructure/services/local_storage.service.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {

  final LocalStorageService _localStorageService = Get.find(tag: (LocalStorageService).toString());

  var isTokenSet = false.obs;
  var idToken = ''.obs;

  String getIdToken() {
    print('GETTTING ID TOKEN');
    _localStorageService.getIdToken().then((value) => idToken.value = value);
    return idToken.value;
  }

  void saveIdToken(String idToken) {
    print('SETTING ID TOKENT ${idToken}');
    _localStorageService.setIdToken(idToken);
    isTokenSet(true);
  }


  @override
  void onInit() {
    super.onInit();        
  }

  @override
  void onReady() {
    super.onReady();
    
  }

  @override
  void onClose() {
    super.onClose();
  }

}
