import 'package:ProNote/ui/theme/app_colors.dart';
import 'package:ProNote/ui/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class ControlBtn extends StatelessWidget {
  final String btnText;
  final Function action;
  const ControlBtn({
    Key? key,
    this.btnText = '',
    required this.action,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 52,
      child: FloatingActionButton(
        elevation: 2,
        highlightElevation: 2,
        backgroundColor: AppColors.primaryBgColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(40),
          ),
        ),
        onPressed: () => action(),
        child: Text(
          btnText,
          style: AppTextStyles.controlBtnText,
        ),
      ),
    );
  }
}
