import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/src/core/resources/color_manager.dart';

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
      keyboardType: TextInputType.multiline,
      hint: hint ?? 'T',
      maxLines: 8,
      maxLength: 1000,
      decoration: InputDecoration(
        errorStyle: const TextStyle(color: ColorManager.black),
        hintText: hint,
        // hintStyle: StyleManager.greySemiBold12,
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

class DefaultTextFieldWidget extends StatefulWidget {
  const DefaultTextFieldWidget({
    super.key,
    required this.hint,
    this.prefixIcon,
    this.crossAxisAlignment,
    this.controller,
    this.textInputAction,
    this.onChanged,
    this.onSubmitted,
    this.keyboardType,
    this.border,
    this.maxLines,
    this.startPadding,
    this.validator,
    this.inputFormatters,
    this.textDirection,
    this.textAlign,
    this.valid,
    this.suffixIcon,
    this.isPassword,
    this.hintStyle,
    this.hintTextDirection,
    this.prefixIconHeight,
    this.prefixIconWidth,
    this.contentPadding,
    this.errorMaxLines,
    this.errorTextHeight,
    this.maxLength,
    this.buildCounter,
    this.decoration,
    this.initialValue,
  });

  final String hint;
  final dynamic prefixIcon;
  final CrossAxisAlignment? crossAxisAlignment;
  final TextEditingController? controller;
  final TextInputAction? textInputAction;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;
  final TextInputType? keyboardType;
  final InputBorder? border;
  final int? maxLines;
  final double? startPadding;
  final String? Function(String?)? validator;
  final List<FilteringTextInputFormatter>? inputFormatters;
  final TextDirection? textDirection;
  final TextAlign? textAlign;
  final bool? valid;
  final Widget? suffixIcon;
  final bool? isPassword;
  final TextStyle? hintStyle;
  final TextDirection? hintTextDirection;
  final double? prefixIconHeight;
  final double? prefixIconWidth;
  final EdgeInsetsGeometry? contentPadding;
  final int? errorMaxLines;
  final double? errorTextHeight;
  final int? maxLength;
  final Widget? Function(BuildContext,
      {required int currentLength,
      required bool isFocused,
      required int? maxLength})? buildCounter;
  final InputDecoration? decoration;
  final String? initialValue;

  @override
  State<DefaultTextFieldWidget> createState() => _DefaultTextFieldWidgetState();
}

class _DefaultTextFieldWidgetState extends State<DefaultTextFieldWidget> {
  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: widget.initialValue,
      obscureText: widget.isPassword == true ? _obscureText : false,
      onTapOutside: (event) => FocusScope.of(context).unfocus(),
      validator: widget.validator,
      controller: widget.controller,
      textInputAction: widget.textInputAction,
      keyboardType: widget.keyboardType,
      // style: getRegularStyle(
      //   color: ColorManager.black,
      //   fontSize: 14.spMin,
      // ),
      onChanged: widget.onChanged,
      onFieldSubmitted: widget.onSubmitted,
      textDirection:
          widget.keyboardType == TextInputType.phone ? TextDirection.ltr : null,
      textAlign: widget.textAlign ?? TextAlign.start,
      maxLines: widget.maxLines ?? 1,
      inputFormatters: widget.keyboardType == TextInputType.number ||
              widget.keyboardType == TextInputType.phone
          ? [FilteringTextInputFormatter.allow(RegExp('[0-9+]'))]
          : [],
      decoration: widget.decoration ??
          InputDecoration(
            errorStyle:
                TextStyle(height: widget.errorTextHeight, color: Colors.black),
            errorMaxLines: widget.maxLines,
            suffixIcon: widget.suffixIcon ?? _buildSuffixIcon(),
            contentPadding: widget.contentPadding,
            border: _border,
            errorBorder: _border,
            enabledBorder: _border,
            focusedBorder: _border,
            disabledBorder: _border,
            focusedErrorBorder: _border,
            hintText: widget.hint,
            hintTextDirection: widget.hintTextDirection,
            hintStyle: widget.hintStyle,
          ),
      maxLength: widget.maxLength,
      buildCounter: widget.buildCounter,
    );
  }

  InputBorder get _border =>
      widget.border ??
      OutlineInputBorder(
        borderRadius: BorderRadius.circular(50.r),
        borderSide: BorderSide(
          color: ColorManager.black,
        ),
      );

  _buildSuffixIcon() {
    if (widget.isPassword == true) {
      return _buildVisibilityIcon();
    } else if (widget.valid == true) {
      return _buildValidIcon();
    } else if (widget.valid == false) {
      return _buildInvalidIcon();
    } else {
      return null;
    }
  }

  Widget _buildValidIcon() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
            padding: EdgeInsets.all(2.w),
            decoration: BoxDecoration(
                shape: BoxShape.circle, color: ColorManager.green),
            child: Icon(
              Icons.check,
              color: ColorManager.white,
              size: 10.w,
            )),
      ],
    );
  }

  Widget _buildInvalidIcon() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
            padding: EdgeInsets.all(2.w),
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: Colors.red),
            child: Icon(
              Icons.close,
              color: ColorManager.white,
              size: 10.w,
            )),
      ],
    );
  }

  Widget _buildVisibilityIcon() {
    return GestureDetector(
      onTap: () {
        setState(() {
          _obscureText = !_obscureText;
        });
      },
      child: Padding(
        padding: EdgeInsetsDirectional.only(end: 20.w),
        child: Icon(
          _obscureText
              ? Icons.visibility_off_outlined
              : Icons.visibility_outlined,
          color: Colors.grey,
          size: 16.w,
        ),
      ),
    );
  }
}
