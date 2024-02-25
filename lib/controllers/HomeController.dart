import 'package:get/get.dart';
import 'package:local_database/models/note.dart';
import 'package:local_database/db/db_helper.dart';

class HomeController extends GetxController {
  var notes = <Note>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchNotes(); // Fetch notes from database when HomeController initializes
  }

  Future<void> fetchNotes() async {
    var notesFromDB = await DbHelper.getNotes();
    notes.value = notesFromDB.map((noteMap) => Note.fromMap(noteMap)).toList();
  }

  void addNote(String title, String content) async {
    var newNote = Note(
      title: title,
      content: content,
    );
    await DbHelper.insertNote(newNote.toMap()); // Insert into database
    fetchNotes(); // Fetch updated notes
  }

  void editNote(int id, String newTitle, String newContent) async {
    var updatedNote = Note(
      id: id,
      title: newTitle,
      content: newContent,
    );
    await DbHelper.updateNote(updatedNote.toMap()); // Update in database
    fetchNotes(); // Fetch updated notes
  }

  void deleteNote(int id) async {
    await DbHelper.deleteNote(id); // Delete from database
    fetchNotes(); // Fetch updated notes
  }
}
