import 'package:clean_pattern/domain/entities/response/users_response.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/users.controller.dart';

class UsersScreen extends GetView<UsersController> {
  const UsersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UsersScreen'),
        centerTitle: true,
      ),
      body: Center(child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('UsersScreen is working',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox.shrink(),
            ElevatedButton(
              onPressed: () async => await controller.GetUsersList(),
              child: const Text('Click to load users'),
            ),
            Obx(() => Expanded(child: (controller.usersCount > 0)
                    ? ListView.builder(
                          itemCount: controller.usersList.length,
                          itemBuilder: (context, index) {
                            final user = controller.usersList[index];
                            return Center(child: Text(user.email.toString()));
                          },
                      )
                    : const SizedBox.shrink(),
            )),
          ],
      ),
    ));
  }
}
