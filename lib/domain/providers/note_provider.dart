import 'package:ProNote/domain/hive/hive_boxes.dart';
import 'package:ProNote/domain/hive/note_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NoteProvider extends ChangeNotifier {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController noteController = TextEditingController();

  void addNote() async {
    await HiveBoxes.notes.add(
      NoteData(
        // trim() - метод для удаления пробелов в начале и в конце строки
        title: titleController.text == ''
            ? 'Нет данных'
            : titleController.text.trim(),
        description: noteController.text == ''
            ? 'Нет данных'
            : noteController.text.trim(),
      ),
    );

    notifyListeners();
  }

  void clearControllers() {
    titleController.clear();
    noteController.clear();
  }

  void deleteNote(int index, BuildContext context) async {
    await HiveBoxes.notes.deleteAt(index);

    Navigator.of(context).pop();
    notifyListeners();
  }

  void setControllers({int? index}) {
    if (index == null) {
      clearControllers();
    } else {
      titleController.text = HiveBoxes.notes.getAt(index)?.title ?? '';
      noteController.text = HiveBoxes.notes.getAt(index)?.description ?? '';
    }
  }

  void changeNoteData(int index, BuildContext context) {
    HiveBoxes.notes.putAt(
      index,
      NoteData(
        title: titleController.text,
        description: noteController.text,
      ),
    );
    Navigator.of(context).pop();
    notifyListeners();
  }
}
