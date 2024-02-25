import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:local_database/controllers/HomeController.dart';
import 'package:local_database/models/note.dart';

class HomePage extends StatelessWidget {
  final HomeController controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notes'),
      ),
      body: Obx(() => ListView.builder(
        itemCount: controller.notes.length,
        itemBuilder: (context, index) {
          var note = controller.notes[index];
          return ListTile(
            title: Text(note.title),
            subtitle: Text(note.content),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () => _showEditNoteDialog(context, note),
                ),
                IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () => controller.deleteNote(note.id!),
                ),
              ],
            ),
          );
        },
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddNoteDialog(context),
        tooltip: 'Add Note',
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showAddNoteDialog(BuildContext context) {
    TextEditingController titleController = TextEditingController();
    TextEditingController contentController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Add New Note'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: titleController,
                decoration: InputDecoration(labelText: 'Title'),
              ),
              TextField(
                controller: contentController,
                decoration: InputDecoration(labelText: 'Content'),
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                String title = titleController.text;
                String content = contentController.text;
                controller.addNote(title, content);
                Get.back();
              },
              child: Text('Add'),
            ),
          ],
        );
      },
    );
  }

  void _showEditNoteDialog(BuildContext context, Note note) {
    TextEditingController titleController =
    TextEditingController(text: note.title);
    TextEditingController contentController =
    TextEditingController(text: note.content);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Edit Note'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: titleController,
                decoration: InputDecoration(labelText: 'Title'),
              ),
              TextField(
                controller: contentController,
                decoration: InputDecoration(labelText: 'Content'),
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                String newTitle = titleController.text;
                String newContent = contentController.text;
                controller.editNote(note.id!, newTitle, newContent);
                Get.back();
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }
}
