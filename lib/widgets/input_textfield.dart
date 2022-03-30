import 'package:advance_protech_login/utilities/hex_color.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class InputTextField extends StatelessWidget {
  InputTextField({
    this.hintText,
    required this.controller,
    this.width,
    this.height = 45, //default size
    this.maxLine = 1, //default maxline
    this.keyboardType, //default keyboard type
    this.isEnabled = true,
    this.readOnly = false,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.padding,
    this.contentPadding,
    this.suffixIconPadding,
    this.prefixIconPadding,
    this.alignLabelWithHint,
    this.floatingLabelBehavior,
    this.borderRadius,
    this.focusNode,
    this.onChanged,
    this.onEditingComplete,
    this.onTap,
    Key? key,
  }) : super(key: key);

  String? hintText;
  final double height;
  double? width;
  final int maxLine;
  final TextEditingController controller;
  TextInputType? keyboardType;
  final bool isEnabled;
  final bool readOnly;
  bool? alignLabelWithHint;
  Widget? prefixIcon;
  Widget? suffixIcon;
  EdgeInsets? padding;
  EdgeInsets? contentPadding;
  EdgeInsets? suffixIconPadding;
  EdgeInsets? prefixIconPadding;
  FloatingLabelBehavior? floatingLabelBehavior;
  FocusNode? focusNode;
  double? borderRadius;
  void Function(String)? onChanged;
  void Function()? onEditingComplete;
  void Function()? onTap;
  final bool obscureText;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ??= const EdgeInsets.only(top: 0, bottom: 0, left: 0, right: 0),
      height: height,
      width: width == null ? double.infinity : width!,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).primaryColor.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
        color: HexColor('#F9FAFB'),
        borderRadius: BorderRadius.circular(borderRadius == null ? 12.0 : borderRadius!),
      ),
      child: TextField(
        onTap: onTap,
        onChanged: onChanged,
        onEditingComplete: onEditingComplete,
        focusNode: focusNode == null ? null : focusNode!,
        obscureText: obscureText,
        enabled: isEnabled,
        readOnly: readOnly,
        maxLines: maxLine,
        style: TextStyle(
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
          fontSize: 15,
          color: isEnabled ? HexColor('#000000') : Colors.black26,
        ),
        textAlign: TextAlign.left,
        controller: controller,
        keyboardType: keyboardType == null ? TextInputType.text : keyboardType!,
        textAlignVertical: TextAlignVertical.top,
        decoration: InputDecoration(
          // isDense: true,
          prefixIcon: prefixIcon != null
              ? Padding(
                  padding: prefixIconPadding ??= const EdgeInsets.all(3),
                  child: prefixIcon,
                )
              : null,
          suffixIcon: suffixIcon != null
              ? Padding(
                  padding: suffixIconPadding ??= const EdgeInsets.all(5),
                  child: suffixIcon,
                )
              : null,
          floatingLabelBehavior: floatingLabelBehavior ??= FloatingLabelBehavior.auto,
          labelText: hintText == null ? '' : hintText!,
          alignLabelWithHint: alignLabelWithHint ??= false,
          labelStyle: TextStyle(
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
            fontSize: 14,
            color: isEnabled ? HexColor('#BEBBBB') : Colors.black26,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              width: 0,
              style: BorderStyle.none,
            ),
          ),
          contentPadding: contentPadding ??= const EdgeInsets.only(top: 15, left: 5),
          // contentPadding: const EdgeInsets.all(16),
        ),
      ),
    );
  }
}
