import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/todo.controller.dart';

class TodoScreen extends GetView<TodoController> {
  const TodoScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo Screen'),
        centerTitle: true,
      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'TodoScreen is working',
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox.shrink(),
              ElevatedButton(
                onPressed: () async => await controller.GetTodos(),
                child: const Text('Click to load todos'),
              ),
              Obx(() => Expanded(
                    child: (controller.todoLength > 0)
                        ? ListView.builder(
                            itemCount: controller.todoList.length,
                            itemBuilder: (context, index) {
                              final todo = controller.todoList[index];
                              return Center(child: Text(todo.title.toString()));
                            },
                          )
                        : const SizedBox.shrink(),
                  )),
            ],
          ),
        )
    );
  }
}
