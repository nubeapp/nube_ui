import 'package:flutter/material.dart';
import '../imports.dart';

class ErrorMessage extends StatelessWidget {
  const ErrorMessage({Key? key, required this.message}) : super(key: key);

  final String message;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: width(context) * 0.02),
      child: Visibility(
        child: Text(
          message,
          style: TextStyle(
            color: Theme.of(context).errorColor,
            fontFamily: 'Tw Cen MT Regular',
            fontSize: 12.0,
            fontWeight: FontWeight.w500,
            letterSpacing: 1.0,
          ),
        ),
      ),
    );
  }
}
