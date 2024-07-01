import 'package:flutter/material.dart';
import 'package:todo_app/src/core/resources/font_manager.dart';

class StyleManager {
  const StyleManager._internal();
  static const StyleManager _instance = StyleManager._internal(); // singleton
  factory StyleManager() => _instance;

  static TextStyle _getTextStyle(
      double fontSize, FontWeight fontWeight, Color color, double? height) {
    return TextStyle(
      fontSize: fontSize,
      fontFamily: FontConstants.defaultFontFamily,
      color: color,
      fontWeight: fontWeight,
      height: height,
    );
  }

  /// regular style
  static TextStyle getRegularStyle(
      {double? fontSize, Color? color, double? height}) {
    return _getTextStyle(fontSize ?? FontSize.s12, FontWeightManager.regular,
        color ?? Colors.black, height);
  }

  /// medium style
  static TextStyle getMediumStyle(
      {double? fontSize, Color? color, double? height}) {
    return _getTextStyle(fontSize ?? FontSize.s12, FontWeightManager.medium,
        color ?? Colors.black, height);
  }

  /// bold style
  static TextStyle getBoldStyle(
      {double? fontSize, Color? color, double? height}) {
    return _getTextStyle(fontSize ?? FontSize.s12, FontWeightManager.bold,
        color ?? Colors.black, height);
  }

  /// semibold style
  static TextStyle getSemiBoldStyle(
      {double? fontSize, Color? color, double? height}) {
    return _getTextStyle(fontSize ?? FontSize.s12, FontWeightManager.semiBold,
        color ?? Colors.black, height);
  }
}
