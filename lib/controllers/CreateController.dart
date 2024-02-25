import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:local_database/models/note.dart';

class CreateController extends GetxController {
  var titleController = TextEditingController();
  var contentControler = TextEditingController();
  Note? oldNote;

  void onInit() {
    super.onInit();

    oldNote = Get.arguments as Note?;

    if (oldNote != null) {
      titleController.text = oldNote!.title;
      contentControler.text = oldNote!.content;
    }
  }

  void onSubmit() {
    if (titleController.text.trim().isNotEmpty &&
        contentControler.text.trim().isNotEmpty) {
      Get.back(
          result: Note(
              title: titleController.text,
              content: contentControler.text,
              id: oldNote?.id));
    }
  }
}
