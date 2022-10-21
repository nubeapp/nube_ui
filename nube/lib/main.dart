import 'package:flutter/material.dart';
import '../imports.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    return NotificationListener<OverscrollIndicatorNotification>(
      onNotification: (OverscrollIndicatorNotification overscroll) {
        overscroll.disallowIndicator();
        return false;
      },
      child: MaterialApp(
        routes: {
          'main_screen': (context) => const MainRegisterScreen(),
          'data_screen': (context) => const DataRegisterScreen(),
          'password_screen': (context) => const PasswordRegisterScreen(),
          'verification_screen': (context) => const VerificationRegisterScreen(),
        },
        initialRoute: 'main_screen',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.light(),
        darkTheme: AppTheme.dark(),
        themeMode: ThemeMode.light,
      ),
    );
  }
}
