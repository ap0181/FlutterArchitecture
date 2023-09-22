import 'package:flutter/material.dart';

class TextStyles {
  //Common Text Style
  TextStyle getCommonTextStyle() =>
      TextStyle(fontSize: 16, color: Colors.white);

  //Common black Text Style
  TextStyle getCommonBlackTextStyle() =>
      TextStyle(fontSize: 16, color: Colors.black);

  TextStyle get inputTextStyle => getCommonTextStyle()
      .copyWith(fontFamily: "AvenirNext", fontWeight: FontWeight.bold);

  TextStyle get bottomUnselectedStyle => TextStyle(
      fontWeight: FontWeight.bold,
      color: Colors.grey,
      fontFamily: "Aspira_Medium");

  TextStyle get bottomSelectedStyle =>
      getCommonBlackTextStyle().copyWith(fontWeight: FontWeight.bold);
}