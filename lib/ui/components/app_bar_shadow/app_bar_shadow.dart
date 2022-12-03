import 'package:ProNote/ui/theme/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppBarShadow extends StatelessWidget {
  const AppBarShadow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.primaryBgColor,
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, .25),
            blurRadius: 2,
            spreadRadius: 2,
          ),
        ],
      ),
    );
  }
}
