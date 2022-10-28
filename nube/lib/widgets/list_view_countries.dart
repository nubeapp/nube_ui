import 'package:flutter/material.dart';
import 'package:nube/imports.dart';

class ListViewCountries extends StatefulWidget {
  const ListViewCountries({
    required this.countries,
    required this.initialIndex,
    super.key,
  });

  final List<Country> countries;
  final int initialIndex;

  @override
  State<ListViewCountries> createState() => _ListViewCountriesState(initialIndex);
}

class _ListViewCountriesState extends State<ListViewCountries> {
  _ListViewCountriesState(this.initialIndex);

  late int initialIndex;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: widget.countries.length,
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
                  color: initialIndex == index ? Colors.grey : Colors.white,
                  margin: EdgeInsets.only(bottom: height(context) * 0.005, top: height(context) * 0.005),
                  child: Row(
                    children: [
                      SizedBox(
                        width: width(context) * 0.02,
                      ),
                      Container(
                        width: width(context) * 0.1,
                        alignment: Alignment.center,
                        child: Text(
                          widget.countries[index].flag,
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
                              widget.countries[index].dialCode.substring(1),
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
                            widget.countries[index].name,
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
    );
  }
}
