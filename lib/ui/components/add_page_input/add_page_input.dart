import 'package:ProNote/ui/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AddPageinput extends StatelessWidget {
  final String title;
  final TextEditingController controller;
  const AddPageinput({
    Key? key,
    required this.title,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      cursorColor: AppColors.secondaryDarkColor,
      decoration: InputDecoration(
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(4),
          ),
          borderSide: BorderSide(
            color: Color(0xff79747E),
          ),
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(4),
          ),
          borderSide: BorderSide(
            color: Color(0xff79747E),
          ),
        ),
        label: Text(
          title,
          style: const TextStyle(
            backgroundColor: AppColors.primaryBgColor,
            fontSize: 12,
            height: 1.33,
            color: AppColors.secondaryDarkColor,
          ),
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        hintText: title,
      ),
    );
  }
}
