import 'package:ProNote/domain/providers/note_provider.dart';
import 'package:ProNote/ui/components/add_page_input/add_page_input.dart';
import 'package:ProNote/ui/components/app_bar_shadow/app_bar_shadow.dart';
import 'package:ProNote/ui/components/control_btn/control_btn.dart';
import 'package:ProNote/ui/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class AddNotePage extends StatelessWidget {
  const AddNotePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<NoteProvider>(context);
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: const AppBarShadow(),
        title: const Text(
          'Добавить заметку',
          style: AppTextStyles.appBarTitle,
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        children: [
          AddPageinput(
            title: 'Заголовок',
            controller: model.titleController,
          ),
          const SizedBox(height: 16),
          AddPageinput(
            title: 'Заметка',
            controller: model.noteController,
          ),
          const SizedBox(height: 16),
          ControlBtn(
            action: () {
              model.addNote();
              Navigator.of(context).pop();
            },
            btnText: 'Добавить',
          ),
        ],
      ),
    );
  }
}
