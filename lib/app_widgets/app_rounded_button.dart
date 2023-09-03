import 'package:expense_131/constants/color_constant.dart';
import 'package:expense_131/utils/my_styles.dart';
import 'package:flutter/material.dart';

class AppRoundedButton extends StatelessWidget {
  VoidCallback onTap;
  Color bgColor;
  String title;
  Color textColor;
  Widget? mWidget;

  AppRoundedButton({
    required this.onTap,
    this.bgColor = ColorConstants.mattBlackColor,
    required this.title,
    this.textColor = Colors.white,
    this.mWidget,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
          onPressed: onTap,
          style: ElevatedButton.styleFrom(
              backgroundColor: bgColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(21))),
          child: mWidget ?? Text(
            title,
            style: mTextStyle16(fontColor: textColor),
          )),
    );
  }
}
