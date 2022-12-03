import 'package:ProNote/domain/providers/note_provider.dart';
import 'package:ProNote/ui/components/bottom_menu/bottom_menu.dart';
import 'package:ProNote/ui/theme/app_colors.dart';
import 'package:ProNote/ui/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NoteListItem extends StatelessWidget {
  final String date;
  final String title;
  final String note;
  final int index;
  const NoteListItem({
    Key? key,
    required this.date,
    required this.index,
    required this.note,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<NoteProvider>(context);
    return GestureDetector(
      onTap: () {
        model.setControllers(index: index);
        showModalBottomSheet(
          backgroundColor: Colors.transparent,
          context: context,
          builder: (context) => BottomMenu(
            title: title,
            note: note,
            index: index,
          ),
        );
      },
      child: NoteListItemContent(title: title, date: date, note: note),
    );
  }
}

class NoteListItemContent extends StatelessWidget {
  const NoteListItemContent({
    Key? key,
    required this.title,
    required this.date,
    required this.note,
  }) : super(key: key);

  final String title;
  final String date;
  final String note;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      constraints: const BoxConstraints(
        minHeight: 117,
      ),
      decoration: BoxDecoration(
        color: AppColors.primaryBgColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const <BoxShadow>[
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, .3),
            blurRadius: 2,
            spreadRadius: 0,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: AppTextStyles.noteTitle),
          const SizedBox(height: 5),
          Text(date, style: AppTextStyles.noteDate),
          const SizedBox(height: 9),
          Text(note, style: AppTextStyles.note),
        ],
      ),
    );
  }
}
