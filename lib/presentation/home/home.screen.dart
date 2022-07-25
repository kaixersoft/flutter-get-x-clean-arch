import 'package:clean_pattern/infrastructure/navigation/routes.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/home.controller.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeScreen'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('HomeScreen is working',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20,),
            ElevatedButton(
              onPressed: () =>  controller.saveIdToken('tokenhere'),
              child: const Text('Click to set ID Token')
            ),
            const SizedBox(height: 20),
            Obx(() => Container(
                child: controller.isTokenSet.value ? 
                Text('TOKEN IS SET TO : ${controller.getIdToken()}') : const Text("Token NOT YET set")                   
            )),
            ElevatedButton(
                  onPressed: () => Get.toNamed(Routes.USERS),
                  child: const Text('Click to go to users page')),
              const SizedBox(height: 20),            
              ElevatedButton(
                  onPressed: () {
                    Get.toNamed(Routes.TODO);
                  },
                  child: const Text('Goto Todos')),

            ]),
        ),
      );
  }
}
