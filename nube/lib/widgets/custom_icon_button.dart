import 'package:flutter/material.dart';
import '../imports.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({Key? key, required this.icon, required this.onTap}) : super(key: key);

  final IconData icon;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: height(context) * 0.06,
        height: height(context) * 0.06,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(
            color: Theme.of(context).primaryColor,
            width: 1.0,
          ),
        ),
        child: Icon(
          icon,
          color: Theme.of(context).accentColor,
        ),
      ),
    );
  }
}
