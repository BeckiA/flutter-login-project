import 'package:get/get.dart';
import '../models/note.dart';
import '../utils/constants.dart';
import 'database_helper.dart';

class NoteController extends GetxController {
  RxList<Note> items = <Note>[].obs;

  @override
  void onInit() {
    super.onInit();
    getNotes();
  }

  Future<void> getNotes() async {
    final noteList = await DatabaseHelper.getNotesFromDB();
    items.value = noteList
        .map((item) => Note(
              id: item['id'],
              title: item['title'],
              content: item['content'],
              imagePath: item['imagePath'],
            ))
        .toList();
  }

  Note getNote(int id) {
    return items.firstWhere((note) => note.id == id);
  }

  Future<void> deleteNote(int id) async {
    items.removeWhere((element) => element.id == id);
    await DatabaseHelper.delete(id);
  }

  Future<void> addOrUpdateNote(
    int id,
    String title,
    String content,
    String imagePath,
    EditMode editMode,
  ) async {
    final note = Note(
      id: id,
      title: title,
      content: content,
      imagePath: imagePath,
    );

    if (editMode == EditMode.ADD) {
      items.insert(0, note);
    } else {
      final index = items.indexWhere((note) => note.id == id);
      if (index != -1) {
        items[index] = note;
      }
    }

    await DatabaseHelper.insert({
      'id': note.id,
      'title': note.title,
      'content': note.content,
      'imagePath': note.imagePath,
    });
  }
}
