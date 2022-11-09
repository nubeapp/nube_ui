import 'package:flutter/material.dart';
import 'package:nube/imports.dart';

class ContainerCountryCodeNumber extends StatefulWidget {
  const ContainerCountryCodeNumber({super.key});

  static String country = 'Spain';

  @override
  State<ContainerCountryCodeNumber> createState() => _ContainerCountryCodeNumberState(country);
}

class _ContainerCountryCodeNumberState extends State<ContainerCountryCodeNumber> {
  static int initialIndex = 207;
  String country;

  _ContainerCountryCodeNumberState(this.country);

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
                  child: CountryCodeNumberPicker(
                    initialIndex: initialIndex,
                    country: country,
                  ),
                ),
              );
            },
            transitionDuration: const Duration(milliseconds: 300),
            context: context,
            pageBuilder: (context, animation1, animation2) {
              return Container();
            },
          ).then((value) {
            ContainerCountryCodeNumber.country = value as String;
            setState(() {
              country = value;
              for (int i = 0; i < countries.length; i++) {
                if (country == countries[i].name) {
                  initialIndex = i;
                }
              }
            });
          });
        });
      },
      child: Container(
        width: width(context) * 0.25,
        height: Platform.isIOS ? height(context) * 0.06 : height(context) * 0.065,
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
