import 'package:ProNote/domain/providers/note_provider.dart';
import 'package:ProNote/ui/app_navigator/app_routes.dart';
import 'package:ProNote/ui/components/app_bar_shadow/app_bar_shadow.dart';
import 'package:ProNote/ui/components/home_page_note_list/home_page_note_list.dart';
import 'package:ProNote/ui/theme/app_colors.dart';
import 'package:ProNote/ui/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<NoteProvider>(context);
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: const AppBarShadow(),
        title: const Text(
          'Заметки',
          style: AppTextStyles.appBarTitle,
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(AppRoutes.searchPage);
            },
            splashColor: Colors.transparent,
            splashRadius: 24,
            iconSize: 24,
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: const HomePageNoteList(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primaryBgColor,
        onPressed: () {
          model.clearControllers();
          Navigator.of(context).pushNamed(AppRoutes.addNotePage);
        },
        child: SvgPicture.asset('assets/icons/icon.svg'),
      ),
    );
  }
}
