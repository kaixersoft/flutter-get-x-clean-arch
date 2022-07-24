import 'package:clean_pattern/infrastructure/services/local_storage.service.dart';
import 'package:get/get.dart';

class MainBinding implements Bindings {
@override
void dependencies() {
    Get.put(LocalStorageService(), tag: (LocalStorageService).toString());    
  }
}