import 'dart:ui';

import 'package:expense_131/color_constant.dart';
import 'package:flutter/material.dart';

///spacers
Widget hSpacer({double mHeight = 11}){
  return SizedBox(
    height: mHeight,
  );
}

Widget wSpacer({double mWidth = 11}){
  return SizedBox(
    width: mWidth,
  );
}

///Text field Decoration
InputDecoration myDecoration({
  bool isPassword = false,
  IconData? mPrefixIcon,
  required String mLabel,
  required String mHint,
}){
  return InputDecoration(
    label: Text(mLabel),
    hintText: mHint,
    prefixIcon: mPrefixIcon!=null ? Icon(mPrefixIcon) : null,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(21),
      borderSide: BorderSide(
        color: ColorConstants.mattBlackColor,
        width: 1
      )
    )
  );
}



///styles
TextStyle mTextStyle12({
  FontWeight mWeight = FontWeight.normal,
  Color fontColor = Colors.black,
}){
  return TextStyle(
    fontSize: 12,
    fontFamily: 'Mulish',
    fontWeight: mWeight,
    color: fontColor,
  );
}

TextStyle mTextStyle16({
  FontWeight mWeight = FontWeight.normal,
  Color fontColor = Colors.black,
}){
  return TextStyle(
    fontSize: 16,
    fontFamily: 'Mulish',
    fontWeight: mWeight,
    color: fontColor,
  );
}

TextStyle mTextStyle25({
  FontWeight mWeight = FontWeight.normal,
  Color fontColor = Colors.black,
}){
  return TextStyle(
    fontSize: 25,
    fontFamily: 'Mulish',
    fontWeight: mWeight,
    color: fontColor,
  );
}

TextStyle mTextStyle34({
  FontWeight mWeight = FontWeight.normal,
  Color fontColor = Colors.black,
}){
  return TextStyle(
    fontSize: 34,
    fontFamily: 'Mulish',
    fontWeight: mWeight,
    color: fontColor,
  );
}

TextStyle mTextStyle43({
  FontWeight mWeight = FontWeight.normal,
  Color fontColor = Colors.black,
}){
  return TextStyle(
    fontSize: 43,
    fontFamily: 'Mulish',
    fontWeight: mWeight,
    color: fontColor,
  );
}