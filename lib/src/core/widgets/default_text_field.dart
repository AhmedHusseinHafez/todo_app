import 'package:flutter/material.dart';

class DefaultTextFieldWidget extends StatelessWidget {
  const DefaultTextFieldWidget({
    super.key,
    this.controller,
    this.textInputAction,
    this.onChanged,
    this.onSubmitted,
    this.maxLines,
    this.validator,
    this.errorMaxLines,
    this.errorTextHeight,
    this.maxLength,
    this.buildCounter,
    this.decoration,
  });

  final TextEditingController? controller;
  final TextInputAction? textInputAction;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;

  final int? maxLines;

  final String? Function(String?)? validator;

  final int? errorMaxLines;
  final double? errorTextHeight;
  final int? maxLength;
  final Widget? Function(BuildContext,
      {required int currentLength,
      required bool isFocused,
      required int? maxLength})? buildCounter;
  final InputDecoration? decoration;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTapOutside: (event) => FocusScope.of(context).unfocus(),
      validator: validator,
      controller: controller,
      textInputAction: textInputAction,
      onChanged: onChanged,
      onFieldSubmitted: onSubmitted,
      maxLines: maxLines ?? 1,
      decoration: decoration ??
          InputDecoration(
            errorStyle: TextStyle(height: errorTextHeight, color: Colors.black),
            errorMaxLines: maxLines,
          ),
      maxLength: maxLength,
      buildCounter: buildCounter,
    );
  }
}
