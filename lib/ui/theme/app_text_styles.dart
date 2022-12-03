import 'package:ProNote/ui/theme/app_colors.dart';
import 'package:flutter/cupertino.dart';

abstract class AppTextStyles {
  static const TextStyle appBarTitle = TextStyle(
    fontSize: 22,
    height: 1.27,
    color: AppColors.primaryDarkColor,
  );
  static const TextStyle noteTitle = TextStyle(
    fontSize: 16,
    height: 1.18,
    color: AppColors.primaryDarkColor,
  );
  static const TextStyle noteDate = TextStyle(
    fontSize: 14,
    height: 1.42,
    color: Color(0xffCAC4D0),
  );
  static const TextStyle note = TextStyle(
    fontSize: 14,
    height: 1.14,
    color: AppColors.secondaryDarkColor,
  );
  static const TextStyle controlBtnText = TextStyle(
    fontSize: 14,
    height: 1.42,
    fontWeight: FontWeight.w500,
    color: AppColors.btnTextColor,
  );
}
