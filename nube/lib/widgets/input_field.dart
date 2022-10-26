import 'package:flutter/material.dart';
import '../imports.dart';

class InputField extends StatelessWidget {
  const InputField({
    Key? key,
    required this.hintText,
    required this.keyboardType,
    required this.obscureText,
    required this.textInputAction,
    required this.controller,
    required this.onChanged,
    required this.hasError,
    this.focusNode,
    this.onPressed,
    this.suffixIcon,
  }) : super(key: key);

  final String hintText;
  final Function()? onPressed;
  final TextInputType keyboardType;
  final IconData? suffixIcon;
  final bool obscureText;
  final TextInputAction textInputAction;
  final TextEditingController controller;
  final Function(String) onChanged;
  final FocusNode? focusNode;
  final bool hasError;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: focusNode,
      onChanged: onChanged,
      controller: controller,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      textAlignVertical: TextAlignVertical.center,
      enableSuggestions: false,
      autocorrect: false,
      enableInteractiveSelection: false,
      obscureText: obscureText,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(top: 20.0, bottom: 20.0, left: 15.0),
        hintText: hintText,
        hintStyle: const TextStyle(
          // color: AppColors.primaryTextLightColor,
          fontFamily: 'Tw Cen MT Regular',
          fontSize: 12.0,
          fontWeight: FontWeight.normal,
          letterSpacing: 1.0,
        ),
        filled: true,
        // fillColor: hasError ? AppColors.inputFieldErrorLightColor : AppColors.inputFieldBackgroundLight,
        fillColor: hasError ? AppColors.inputFieldError : Theme.of(context).cardColor,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(10.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: hasError ? Theme.of(context).errorColor : Theme.of(context).highlightColor,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        suffixIcon: IconButton(
          splashColor: Colors.transparent,
          icon: Icon(
            suffixIcon,
            size: 24.0,
          ),
          color: Theme.of(context).indicatorColor,
          onPressed: onPressed,
          splashRadius: 0.01,
        ),
      ),
      cursorColor: Theme.of(context).indicatorColor,
      cursorHeight: 16.0,
      style: TextStyle(
        color: Theme.of(context).indicatorColor,
        fontFamily: 'Tw Cen MT Regular',
        fontSize: 16.0,
        letterSpacing: 1.0,
      ),
    );
  }
}
