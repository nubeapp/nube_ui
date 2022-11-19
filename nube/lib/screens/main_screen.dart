import 'package:flutter/material.dart';
import 'package:nube/screens/login_screen/main_login_screen.dart';
import 'package:nube/utils.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: Text('Welcome to my app'),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(createRouteFromLeft(const MainLoginScreen()));
            },
            child: Container(
              width: 80,
              height: 50,
              color: Theme.of(context).cardColor,
              child: const Center(
                child: Text('Volver'),
              ),
            ),
          )
        ],
      ),
    );
  }
}
