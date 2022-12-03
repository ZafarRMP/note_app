import 'package:ProNote/domain/hive/hive_boxes.dart';
import 'package:ProNote/domain/hive/note_data.dart';
import 'package:ProNote/ui/components/note_list_item/note_list_item.dart';
import 'package:ProNote/ui/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomePageNoteList extends StatelessWidget {
  const HomePageNoteList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: HiveBoxes.notes.listenable(),
      builder: (context, Box<NoteData> box, _) {
        final noteList = box.values.toList();
        return noteList.length > 0
            ? ListView.separated(
                padding: const EdgeInsets.all(16),
                itemBuilder: (context, index) => NoteListItem(
                  index: index,
                  date: noteList[index].date,
                  note: noteList[index].description,
                  title: noteList[index].title,
                ),
                separatorBuilder: (context, i) => const SizedBox(
                  height: 16,
                ),
                itemCount: noteList.length,
              )
            : Center(
                child: Text(
                  'Нет заметок',
                  style: AppTextStyles.appBarTitle,
                ),
              );
      },
    );
  }
}
