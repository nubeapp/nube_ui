import 'package:flutter/material.dart';
import 'package:nube/imports.dart';

class NumberButton extends StatelessWidget {
  const NumberButton({
    required this.onTap,
    required this.text,
    Key? key,
  }) : super(key: key);

  final Function()? onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width(context) * 0.14,
        height: width(context) * 0.14,
        color: Colors.transparent,
        alignment: Alignment.center,
        child: Text(
          text,
          style: TextStyle(
            color: Theme.of(context).cursorColor,
            fontFamily: 'Tw Cen MT Regular',
            fontSize: 28.0,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
