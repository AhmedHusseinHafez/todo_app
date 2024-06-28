import 'package:flutter/material.dart';
import 'package:todo_app/src/core/resources/color_manager.dart';
import 'package:todo_app/src/core/resources/font_manager.dart';
import 'package:todo_app/src/core/resources/style_manager.dart';
import 'package:todo_app/src/core/widgets/default_text_field.dart';

class TaskTextField extends StatelessWidget {
  const TaskTextField({
    super.key,
    this.controller,
    this.validator,
    this.hint,
  });
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final String? hint;
  @override
  Widget build(BuildContext context) {
    return DefaultTextFieldWidget(
      controller: controller,
      maxLines: 4,
      maxLength: 200,
      decoration: InputDecoration(
        errorStyle: const TextStyle(color: ColorManager.black),
        hintText: hint ?? '',
        hintStyle: StyleManager.getBoldStyle(fontSize: FontSize.s12),
        alignLabelWithHint: true,
      ),
      validator: validator,
      buildCounter: (context,
          {required currentLength, required isFocused, maxLength}) {
        return Container(
          transform: Matrix4.translationValues(3, -33, 0),
          child: Text("$currentLength/$maxLength"),
        );
      },
    );
  }
}
