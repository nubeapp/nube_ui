import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:nube/widgets/close_popup_button.dart';
import '../imports.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CountryCodeNumberPicker extends StatefulWidget {
  const CountryCodeNumberPicker({Key? key}) : super(key: key);

  @override
  State<CountryCodeNumberPicker> createState() => _CountryCodeNumberPickerState();
}

class _CountryCodeNumberPickerState extends State<CountryCodeNumberPicker> {
  List<Country> countries = List.empty(growable: true);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if (countries.isEmpty) {
          countries = await loadJson();
        }
        showGeneralDialog(
          context: context,
          pageBuilder: (context, animation1, animation2) {
            return Container();
          },
          transitionBuilder: (context, a1, a2, widget) {
            final curvedValue = Curves.easeInOutBack.transform(a1.value) - 1.0;
            return Transform(
              transform: Matrix4.translationValues(0.0, curvedValue * 200, 0.0),
              child: Opacity(
                opacity: a1.value,
                child: Scaffold(
                  resizeToAvoidBottomInset: true,
                  backgroundColor: Colors.transparent,
                  body: Center(
                    child: Container(
                      width: width(context) * 0.8,
                      height: height(context) * 0.7,
                      color: Theme.of(context).backgroundColor,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: width(context) * 0.035),
                        child: Column(
                          children: [
                            const ClosePopupButton(),
                            InputField(
                              hintText: 'Introduzca el pais...',
                              keyboardType: TextInputType.text,
                              obscureText: false,
                              textInputAction: TextInputAction.done,
                              controller: TextEditingController(),
                              onChanged: (value) {},
                              hasError: false,
                            ),
                            Text(
                              'Escoge el prefijo de tu país',
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontFamily: 'Tw Cen MT Regular',
                                fontSize: 12.0,
                                fontWeight: FontWeight.normal,
                                letterSpacing: 1.0,
                                height: 2.0,
                              ),
                            ),
                            SizedBox(
                              height: height(context) * 0.01,
                            ),
                            Expanded(
                              child: ListView.builder(
                                itemCount: countries.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Column(
                                    children: [
                                      Container(
                                        width: width(context),
                                        height: height(context) * 0.05,
                                        // color: Colors.orange,
                                        margin: EdgeInsets.only(bottom: height(context) * 0.005, top: height(context) * 0.005),
                                        child: Row(
                                          children: [
                                            // Container(
                                            //   width: width(context) * 0.1,
                                            //   alignment: Alignment.center,
                                            //   child: SvgPicture.network(
                                            //     countries[index].flag,
                                            //     height: 20.0,
                                            //     width: 30.0,
                                            //   ),
                                            // ),
                                            SizedBox(
                                              width: width(context) * 0.02,
                                            ),
                                            SizedBox(
                                              width: width(context) * 0.18,
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
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
                                                      fontSize: 18.0,
                                                      fontWeight: FontWeight.w600,
                                                      letterSpacing: 1,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              width: width(context) * 0.02,
                                            ),
                                            Container(
                                                width: width(context) * 0.4,
                                                alignment: Alignment.center,
                                                child: Text(
                                                  countries[index].name,
                                                  overflow: TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                    color: Theme.of(context).primaryColor,
                                                    fontFamily: 'Tw Cen MT Condensed',
                                                    fontSize: 18.0,
                                                    fontWeight: FontWeight.w600,
                                                    letterSpacing: 1,
                                                  ),
                                                )),
                                          ],
                                        ),
                                      ),
                                      // const Divider(
                                      //   height: 1.0,
                                      //   color: AppColors.primaryTextLightColor,
                                      //   thickness: 1.0,
                                      // )
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
                ),
              ),
            );
          },
        );
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
          children: const [
            Text(
              'Place',
            ),
            Text(
              ' Holder',
            )
          ],
        ),
      ),
    );
  }
}

Future<List<Country>> loadJson() async {
  String data = await rootBundle.loadString('assets/json/countries.json');
  var countriesObjsJson = jsonDecode(data)['countries'] as List;
  List<Country> countryObj = countriesObjsJson.map((countryJson) => Country.fromJson(countryJson)).toList();
  return countryObj;
}
