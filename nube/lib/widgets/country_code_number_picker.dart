import 'package:flutter/material.dart';
import '../imports.dart';

class CountryCodeNumberPicker extends StatefulWidget {
  const CountryCodeNumberPicker({Key? key, required this.initialIndex, required this.countryName}) : super(key: key);

  final int initialIndex;
  final String countryName;

  @override
  State<CountryCodeNumberPicker> createState() => _CountryCodeNumberPickerState(initialIndex, countryName);
}

class _CountryCodeNumberPickerState extends State<CountryCodeNumberPicker> {
  /*
  *  Variables
  */
  late int initialIndex;
  late String countryName;
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocus = FocusNode();
  List<Country> results = List.empty(growable: true);

  _CountryCodeNumberPickerState(this.initialIndex, this.countryName);

  @override
  void initState() {
    super.initState();
    results.addAll(countries);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                ClosePopupButton(value: countryName),
                InputField(
                  focusNode: _searchFocus,
                  hintText: 'Buscar por país...',
                  keyboardType: TextInputType.text,
                  obscureText: false,
                  textInputAction: TextInputAction.done,
                  controller: _searchController,
                  onChanged: (value) {
                    getCountriesResults(value);
                  },
                  hasError: false,
                  suffixIcon: hideShowIcon(_searchController, _searchFocus),
                  onPressed: () {
                    setState(() {
                      _searchController.text = '';
                      results = List.empty(growable: true);
                      results.addAll(countries);
                    });
                  },
                ),
                SizedBox(
                  height: height(context) * 0.03,
                ),
                Expanded(
                  child: results.isEmpty
                      ? Column(
                          children: [
                            SizedBox(
                              height: height(context) * 0.05,
                            ),
                            Text(
                              'No se han encontrado resultados',
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontFamily: 'Tw Cen MT Regular',
                                fontSize: 16.0,
                                fontWeight: FontWeight.normal,
                                letterSpacing: 1.0,
                              ),
                            ),
                          ],
                        )
                      : ListView.builder(
                          itemCount: results.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      countryName = results[index].name;
                                      initialIndex = index;
                                    });
                                  },
                                  child: Container(
                                    width: width(context),
                                    height: height(context) * 0.05,
                                    margin: EdgeInsets.only(bottom: height(context) * 0.005, top: height(context) * 0.005),
                                    decoration: countryName == results[index].name
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
                                            results[index].flag,
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
                                                style: textStyleCodeNumber(context, 14.0),
                                              ),
                                              Text(
                                                results[index].dialCode.substring(1),
                                                style: textStyleCodeNumber(context, 20.0),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                            width: width(context) * 0.4,
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              results[index].name,
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
                                const Divider(
                                  thickness: 2.0,
                                )
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

  TextStyle textStyleCodeNumber(BuildContext context, double fontSize) {
    return TextStyle(
      color: Theme.of(context).primaryColor,
      fontFamily: 'Tw Cen MT Condensed',
      fontSize: fontSize,
      fontWeight: FontWeight.w600,
      letterSpacing: 1,
    );
  }

  void getCountriesResults(String value) {
    return setState(() {
      results = List.empty(growable: true);
      for (Country country in countries) {
        if (country.name.toLowerCase().contains(value.toLowerCase())) {
          results.add(country);
        }
      }
    });
  }
}
