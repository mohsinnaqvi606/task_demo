import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class CustomTextField1 extends StatelessWidget {
  final String? title;
  final String? hintText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onChanged;
  final bool obscureText;
  final bool asterisk;
  final AutovalidateMode? autoValidateMode;
  final bool? showCursor;
  final bool readOnly;
  final double? prefixIconSize;
  final IconData? prefixIcon;
  final Widget? suffixIcon;
  final GestureTapCallback? onTap;
  final List<TextInputFormatter>? inputFormatters;
  final EdgeInsetsGeometry? contentPadding;
  final int? maxLines;

  const CustomTextField1({super.key,
    this.maxLines = 1,
    this.title,
    this.autoValidateMode,
    this.hintText,
    this.controller,
    this.prefixIcon,
    this.prefixIconSize,
    this.keyboardType,
    this.validator,
    this.asterisk = false,
    this.obscureText = false,
    this.showCursor,
    this.suffixIcon,
    this.readOnly = false,
    this.onTap,
    this.onChanged,
    this.inputFormatters,
    this.contentPadding = const EdgeInsets.fromLTRB(10, 13.5, 10, 13.5),
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        (title == null)
            ? Container()
            : Padding(
          padding: const EdgeInsets.only(bottom: 5.0),
          child: RichText(
            text: TextSpan(
              text: title,
              style: const TextStyle(
                fontSize: 13,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
              children: [
                (asterisk)
                    ? const TextSpan(
                  text: ' *',
                  style:
                  TextStyle(color: Colors.red, fontSize: 15.0),
                )
                    : const TextSpan(text: '')
              ],
            ),
          ),
        ),
        TextFormField(
          maxLines: maxLines,
          inputFormatters: inputFormatters,
          onChanged: onChanged,
          showCursor: showCursor,
          readOnly: readOnly,
          autovalidateMode: autoValidateMode,
          obscureText: obscureText,
          validator: validator,
          keyboardType: keyboardType,
          controller: controller,
          onTap: onTap,
          decoration: InputDecoration(
            prefixIconConstraints: const BoxConstraints(
              minWidth: 45,
              minHeight: 30,
            ),
            prefixIcon: (prefixIcon == null)
                ? null
                : Icon(
              prefixIcon,
              color: const Color(0xff3E515B),
              size: prefixIconSize,
            ),
            isDense: true,
            contentPadding: contentPadding,
            hintText: hintText,
            hintStyle: const TextStyle(color: Colors.black45, fontSize: 12),
            suffixIcon: suffixIcon,
            errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 1.5),
            ),
            focusedErrorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 1.5),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: const BorderSide(color: Color(0xff9E9E9E), width: 0.5),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Get.theme.primaryColor),
            ),
          ),
          style: const TextStyle(
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}