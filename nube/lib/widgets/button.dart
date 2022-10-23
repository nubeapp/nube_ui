import 'package:flutter/material.dart';
import '../imports.dart';

@immutable
class Button extends StatelessWidget {
  const Button({Key? key, required this.text, required this.onPressed}) : super(key: key);

  final String text;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width(context),
      height: height(context) * 0.065,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: Theme.of(context).highlightColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(
            color: AppColors.backgroundLight,
            fontFamily: 'Tw Cen MT Regular',
            fontSize: 14.0,
            fontWeight: FontWeight.normal,
            letterSpacing: 1.0,
          ),
        ),
      ),
    );
  }
}
