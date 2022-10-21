import 'package:flutter/material.dart';
import 'package:nube/imports.dart';

class ClosePopupButton extends StatelessWidget {
  const ClosePopupButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width(context),
      height: height(context) * 0.05,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          IconButton(
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
            icon: const Icon(Icons.close),
            color: Theme.of(context).primaryColor,
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
  }
}
