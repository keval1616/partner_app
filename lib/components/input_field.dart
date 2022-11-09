
import 'package:flutter/material.dart';
import 'package:partner_app/schema/appcolor.dart';
import 'package:partner_app/schema/test_style.dart';

typedef OnValidation = dynamic Function(String? text);

class InputField extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final bool obscureText;
  final String hint;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final OnValidation? validator;
  final Function(String?)? onChange;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final int? maxLine;
  const InputField({
    Key? key,
    required this.controller,
    required this.focusNode,
    this.obscureText = false,
    this.hint = "",
    this.onChange,
    this.suffixIcon,
    this.prefixIcon,
    this.textInputAction,
    this.keyboardType,
    this.validator,
    this.maxLine,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:54 ,
      child: TextFormField(
        cursorColor: Colors.black,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        controller: controller,
        focusNode: focusNode,
        obscureText: obscureText,
        maxLines: maxLine,
        decoration: InputDecoration(
          isDense: true,
          hintText: hint,
          hintStyle: const TextStyle(
              fontFamily: TxtFontFamily.inter, color: AppColor.grey),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100),
            borderSide: BorderSide(
              width: 1,
              color: AppColor.grey.withOpacity(0.2),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100),
            borderSide: BorderSide(
              width: 1,
              color: AppColor.grey.withOpacity(0.2),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100),
            borderSide: const BorderSide(
              width: 1,
              color: AppColor.black,
            ),
          ),
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
        ),
        textInputAction: textInputAction ?? TextInputAction.done,
        keyboardType: keyboardType ?? TextInputType.name,
        onChanged: (val) {
          if (onChange != null) {
            onChange!(val);
          }
        },
        validator: (val) {
          if (validator != null) {
            return validator!(val);
          } else {
            return null;
          }
        },
      ),
    );
  }
}
