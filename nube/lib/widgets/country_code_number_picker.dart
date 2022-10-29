import 'package:flutter/material.dart';
import '../imports.dart';

class CountryCodeNumberPicker extends StatefulWidget {
  const CountryCodeNumberPicker({Key? key, required this.initialIndex}) : super(key: key);

  final int initialIndex;

  @override
  State<CountryCodeNumberPicker> createState() => _CountryCodeNumberPickerState(initialIndex);
}

class _CountryCodeNumberPickerState extends State<CountryCodeNumberPicker> {
  late int initialIndex;

  _CountryCodeNumberPickerState(this.initialIndex);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.transparent,
      body: Center(
        child: Container(
          width: width(context) * 0.85,
          height: height(context) * 0.75,
          color: Theme.of(context).shadowColor,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: width(context) * 0.035),
            child: Column(
              children: [
                ClosePopupButton(value: initialIndex),
                Text(
                  'Escoge el prefijo de tu país',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontFamily: 'Tw Cen MT Regular',
                    fontSize: 14.0,
                    fontWeight: FontWeight.normal,
                    letterSpacing: 1.0,
                  ),
                ),
                SizedBox(
                  height: height(context) * 0.03,
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: countries.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                initialIndex = index;
                              });
                            },
                            child: Container(
                              width: width(context),
                              height: height(context) * 0.05,
                              margin: EdgeInsets.only(bottom: height(context) * 0.005, top: height(context) * 0.005),
                              decoration: initialIndex == index
                                  ? BoxDecoration(
                                      color: Theme.of(context).cardColor,
                                      borderRadius: BorderRadius.circular(10.0),
                                      border: Border.all(color: Theme.of(context).highlightColor, width: 2.0))
                                  : null,
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: width(context) * 0.02,
                                  ),
                                  Container(
                                    width: width(context) * 0.1,
                                    alignment: Alignment.center,
                                    child: Text(
                                      countries[index].flag,
                                      style: const TextStyle(
                                        fontSize: 26.0,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: width(context) * 0.06,
                                  ),
                                  SizedBox(
                                    width: width(context) * 0.18,
                                    child: Row(
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
                                          countries[index].dialCode.substring(1),
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
                                  ),
                                  Container(
                                      width: width(context) * 0.4,
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        countries[index].name,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          color: Theme.of(context).primaryColor,
                                          fontFamily: 'Tw Cen MT Condensed',
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.w600,
                                          letterSpacing: 1,
                                        ),
                                      )),
                                ],
                              ),
                            ),
                          ),
                          const Divider()
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
