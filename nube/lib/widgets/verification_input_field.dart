import 'package:flutter/material.dart';

import '../imports.dart';

class VerificationInputField extends StatelessWidget {
  const VerificationInputField({
    required this.autofocus,
    required this.focusNode,
    required this.onChanged,
    required this.onTap,
    required this.controller,
    required this.hasError,
    Key? key,
  }) : super(key: key);

  final bool autofocus;
  final FocusNode? focusNode;
  final Function(String) onChanged;
  final Function()? onTap;
  final TextEditingController controller;
  final bool hasError;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: true,
      autofocus: autofocus,
      controller: controller,
      onTap: onTap,
      onChanged: onChanged,
      focusNode: focusNode,
      enableInteractiveSelection: false,
      textAlign: TextAlign.center,
      textAlignVertical: TextAlignVertical.top,
      maxLength: 1,
      style: TextStyle(
        // color: AppColors.inputTextColorLight,
        color: Theme.of(context).indicatorColor,
        fontFamily: 'Tw Cen MT Regular',
        fontSize: 30.0,
        fontWeight: FontWeight.normal,
      ),
      showCursor: false,
      decoration: InputDecoration(
        counterText: "",
        filled: true,
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
      ),
    );
  }
}
