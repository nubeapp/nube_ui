import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:nube/screens/login_screen/main_login_screen.dart';
import '../imports.dart';

List<Country> countries = List.empty(growable: true);
User user = User(
  email: '',
  username: '',
  name: '',
  country: '',
  phone: '',
  password: '',
);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  countries = await loadJson();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid) {
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    }
    return NotificationListener<OverscrollIndicatorNotification>(
      onNotification: (OverscrollIndicatorNotification overscroll) {
        overscroll.disallowIndicator();
        return false;
      },
      child: MaterialApp(
        // showPerformanceOverlay: true,
        routes: {
          'login_screen': (context) => const MainLoginScreen(),
          'main_screen': (context) => const MainRegisterScreen(),
          'data_screen': (context) => const DataRegisterScreen(),
          'password_screen': (context) => const PasswordRegisterScreen(),
          'verification_screen': (context) => const VerificationRegisterScreen(),
        },
        initialRoute: 'login_screen',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.light(),
        darkTheme: AppTheme.dark(),
        themeMode: ThemeMode.dark,
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
