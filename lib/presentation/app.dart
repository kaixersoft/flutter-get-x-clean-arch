import 'package:clean_pattern/infrastructure/navigation/routes.dart';
import 'package:clean_pattern/presentation/main_bindings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../infrastructure/navigation/navigation.dart';


class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.HOME,
        defaultTransition: Transition.fade,
        getPages: Nav.routes,
        initialBinding: MainBinding(),
    );  
  }
}