import 'package:ProNote/domain/providers/note_provider.dart';
import 'package:ProNote/ui/theme/app_colors.dart';
import 'package:ProNote/ui/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DeleteDialog extends StatelessWidget {
  const DeleteDialog({
    Key? key,
    required this.title,
    required this.note,
    required this.index,
  }) : super(key: key);

  final String title;
  final String note;
  final int index;

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<NoteProvider>(context);
    return AlertDialog(
      titlePadding: const EdgeInsets.only(
        top: 24,
        left: 24,
        right: 24,
      ),
      contentPadding: const EdgeInsets.all(24),
      backgroundColor: AppColors.primaryBgColor,
      title: const Text('Удалить'),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Удалить заметку $title',
            style: AppTextStyles.note,
          ),
          const SizedBox(height: 16),
          Text(
            note,
            maxLines: 2,
            style: AppTextStyles.note,
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              DialogBtn(
                btnText: 'Отмена',
                action: () {
                  Navigator.of(context).pop();
                },
              ),
              DialogBtn(
                btnText: 'Удалить',
                action: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: AppColors.primaryBgColor,
                      content: Text(
                        'Заметка удалена',
                        style: AppTextStyles.noteTitle,
                      ),
                    ),
                  );
                  model.deleteNote(index, context);
                  Navigator.of(context).pop();
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}

class DialogBtn extends StatelessWidget {
  final String btnText;
  final Function action;
  const DialogBtn({
    Key? key,
    required this.btnText,
    required this.action,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => action(),
      child: Text(
        btnText,
        style: TextStyle(
          fontSize: 14,
          height: 1.42,
          color: AppColors.btnTextColor,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
