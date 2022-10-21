import 'package:flutter/material.dart';
import '../imports.dart';

@immutable
class SocialMediaButton extends StatelessWidget {
  const SocialMediaButton({Key? key, required this.asset, required this.socialMediaText, required this.onTap}) : super(key: key);

  final String asset;
  final String socialMediaText;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width(context) / 2 - width(context) * 0.1,
        height: height(context) * 0.13,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(color: Theme.of(context).primaryColor, width: 1.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage(
                asset,
              ),
              width: 36.0,
            ),
            SizedBox(
              width: width(context) * 0.02,
            ),
            Text(
              socialMediaText,
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontFamily: 'Tw Cen MT Regular',
                fontSize: 16.0,
                fontWeight: FontWeight.w500,
                letterSpacing: 1.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
