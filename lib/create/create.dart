import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:local_database/controllers/CreateController.dart';

class CreatePage extends GetView<CreateController> {
  const CreatePage({super.key});

  Widget build(BuildContext context){
    return Scaffold(
      body: Column(
        children: [
          TextField(
            controller: controller.titleController,
            decoration: InputDecoration(
              labelText: "Title",
              border: OutlineInputBorder()
            ),
          ),
          TextField(
            controller: controller.contentControler,
          ),
          Spacer(),
          ElevatedButton(onPressed: controller.onSubmit, child: Text("SUBMIT"))
        ],
      ),
    );
  }
}