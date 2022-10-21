import 'package:flutter/cupertino.dart';

@immutable
class Country {
  final String name;
  final String isoCode;
  final String dialCode;
  final String flag;

  const Country({required this.name, required this.isoCode, required this.dialCode, required this.flag});

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      name: json['name'] as String,
      isoCode: json['isoCode'] as String,
      dialCode: json['dialCode'] as String,
      flag: json['flag'] as String,
    );
  }
}
