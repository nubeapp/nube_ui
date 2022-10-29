import 'package:flutter/material.dart';
import 'package:nube/imports.dart';

class ContainerCountryCodeNumber extends StatefulWidget {
  const ContainerCountryCodeNumber({super.key});

  @override
  State<ContainerCountryCodeNumber> createState() => _ContainerCountryCodeNumberState();
}

class _ContainerCountryCodeNumberState extends State<ContainerCountryCodeNumber> {
  static int initialIndex = 207;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          showGeneralDialog(
            barrierColor: Colors.black.withOpacity(0.75),
            transitionBuilder: (context, a1, a2, widget) {
              final curvedValue = Curves.easeInOutBack.transform(a1.value) - 1.0;
              return Transform(
                transform: Matrix4.translationValues(0.0, curvedValue * 200, 0.0),
                child: Opacity(
                  opacity: a1.value,
                  child: CountryCodeNumberPicker(initialIndex: initialIndex),
                ),
              );
            },
            transitionDuration: const Duration(milliseconds: 300),
            context: context,
            pageBuilder: (context, animation1, animation2) {
              return Container();
            },
          ).then((value) {
            setState(() {
              initialIndex = value as int;
            });
          });
        });
      },
      child: Container(
        width: width(context) * 0.25,
        height: height(context) * 0.065,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Theme.of(context).cardColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              countries[initialIndex].flag,
              style: const TextStyle(fontSize: 22.0),
            ),
            SizedBox(
              width: width(context) * 0.02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  '+',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontFamily: 'Tw Cen MT Condensed',
                    fontSize: 14.0,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1,
                  ),
                ),
                Text(
                  countries[initialIndex].dialCode.substring(1),
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontFamily: 'Tw Cen MT Condensed',
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
