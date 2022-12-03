import 'package:ProNote/ui/app_navigator/app_routes.dart';
import 'package:ProNote/ui/components/delete_dialog/delete_dialog.dart';
import 'package:ProNote/ui/theme/app_colors.dart';
import 'package:ProNote/ui/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class BottomMenu extends StatelessWidget {
  const BottomMenu({
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
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      margin: const EdgeInsets.all(16),
      height: 179,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: BottomMenuContent(
        title: title,
        note: note,
        index: index,
      ),
    );
  }
}

class BottomMenuContent extends StatelessWidget {
  const BottomMenuContent({
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
    return Column(
      children: [
        Container(
          height: 4,
          width: 34,
          decoration: const BoxDecoration(
            color: Color(0xffDEDEDE),
            borderRadius: BorderRadius.all(
              Radius.circular(19),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Text(title, maxLines: 1, style: AppTextStyles.noteTitle),
        const SizedBox(height: 10),
        Text(
          note,
          maxLines: 1,
          style: AppTextStyles.note.copyWith(overflow: TextOverflow.ellipsis),
        ),
        const Spacer(),
        BottomMenuBtn(
          btnAction: () {
            Navigator.of(context).pushNamed(
              AppRoutes.changePage,
              arguments: index,
            );
          },
          icon: Icons.edit,
          text: 'Редактировать',
        ),
        BottomMenuBtn(
          btnAction: () {
            showDialog(
              context: context,
              builder: (context) => DeleteDialog(
                title: title,
                note: note,
                index: index,
              ),
            );
          },
          icon: Icons.backspace,
          text: 'Удалить',
        ),
      ],
    );
  }
}

class BottomMenuBtn extends StatelessWidget {
  final String text;
  final Function btnAction;
  final IconData icon;
  const BottomMenuBtn({
    Key? key,
    this.icon = Icons.edit,
    this.text = '',
    required this.btnAction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: double.infinity,
      child: TextButton.icon(
        onPressed: () => btnAction(),
        icon: Icon(
          icon,
          size: 24,
          color: AppColors.secondaryDarkColor,
        ),
        style: ButtonStyle(
          shape: MaterialStateProperty.all(
            const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
          ),
        ),
        label: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              text,
              style: AppTextStyles.noteTitle.copyWith(
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
