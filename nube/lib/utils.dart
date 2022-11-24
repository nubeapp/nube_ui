import 'dart:convert';
import 'package:flutter/material.dart';
import 'dart:core';
import 'imports.dart';
import 'package:http/http.dart' as http;
import 'dart:math' as math;

Route createRouteFromRight(Widget route) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => route,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = const Offset(1.0, 0.0);
      var end = Offset.zero;
      var curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

Route createRouteFromLeft(Widget route) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => route,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = const Offset(-1.0, 0.0);
      var end = Offset.zero;
      var curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

bool isValidEmail(String? email) {
  return (email!.isNotEmpty && RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}').hasMatch(email));
}

/// Password Checks

Strength checkPasswordStrength(String password) {
  if (password.length < 7) {
    //  Si tiene 'minúsculas' o 'mayúsculas' o 'números' o 'especiales' -> EMPTY
    /*  
     * Si tiene 'minúsculas y mayúsculas' o 'minúsculas y números' o 'mayúsculas y números'
     *  o 'minúsculas y especiales' o 'mayúsculas y especiales' o 'números y especiales' -> EASY
     */
    /* 
     *  Si tiene 'minúsculas, mayúsculas y números' o 'minúsculas, mayúsculas y especiales'
     *  o 'minúsculas, numeros y especiales' o 'mayúsculas, numeros y especiales' -> MEDIUM
     */
    //  Si tiene minúsculas, mayúsculas, números y especiales -> HARD
    if ((_hasMinus(password) && _hasMayus(password) && _hasNumbers(password) && _hasSpecialCharacters(password))) {
      return Strength.hard;
    } else if ((_hasMinus(password) && _hasMayus(password) && _hasNumbers(password)) ||
        (_hasMinus(password) && _hasMayus(password) && _hasSpecialCharacters(password)) ||
        (_hasMinus(password) && _hasNumbers(password) && _hasSpecialCharacters(password)) ||
        (_hasMayus(password) && _hasNumbers(password) && _hasSpecialCharacters(password))) {
      return Strength.medium;
    } else if ((_hasMinus(password) && _hasMayus(password)) ||
        (_hasMinus(password) && _hasNumbers(password)) ||
        (_hasMayus(password) && _hasNumbers(password)) ||
        (_hasMinus(password) && _hasSpecialCharacters(password)) ||
        (_hasMayus(password) && _hasSpecialCharacters(password)) ||
        (_hasNumbers(password) && _hasSpecialCharacters(password))) {
      return Strength.easy;
    } else {
      return Strength.empty;
    }
  } else if (password.length >= 7 && password.length < 12) {
    //  Si tiene 'minúsculas' o 'mayúsculas' o 'números' o 'especiales' -> EASY
    /* 
     *  Si tiene 'minúsculas y mayúsculas' o 'minúsculas y números' o 'mayúsculas y números' 
     *  o 'especiales y minúsculas' o 'especiales y mayúsculas' o 'especiales y números' -> MEDIUM
     */
    //  else -> HARD
    if (_areAllCharactersEquals(password)) {
      return Strength.easy;
    }
    if ((_hasMinus(password) && _hasMayus(password) && _hasNumbers(password) && _hasSpecialCharacters(password)) ||
        (_hasMinus(password) && _hasMayus(password) && _hasNumbers(password)) ||
        (_hasMinus(password) && _hasMayus(password) && _hasSpecialCharacters(password)) ||
        (_hasMinus(password) && _hasNumbers(password) && _hasSpecialCharacters(password)) ||
        (_hasMayus(password) && _hasNumbers(password) && _hasSpecialCharacters(password))) {
      return Strength.hard;
    } else if ((_hasMinus(password) && _hasMayus(password)) ||
        (_hasMinus(password) && _hasNumbers(password)) ||
        (_hasMayus(password) && _hasNumbers(password)) ||
        (_hasMinus(password) && _hasSpecialCharacters(password)) ||
        (_hasMayus(password) && _hasSpecialCharacters(password)) ||
        (_hasNumbers(password) && _hasSpecialCharacters(password))) {
      return Strength.medium;
    } else {
      return Strength.easy;
    }
  } else if (password.length >= 12) {
    //  Si tiene 'minúsculas' o 'mayúsculas' o 'números' o 'especiales'-> MEDIUM
    //  else -> HARD
    if (_areAllCharactersEquals(password)) {
      return Strength.easy;
    }
    if ((_hasMinus(password) && !_hasMayus(password) && !_hasNumbers(password) && !_hasSpecialCharacters(password)) ||
        (!_hasMinus(password) && _hasMayus(password) && !_hasNumbers(password) && !_hasSpecialCharacters(password)) ||
        (!_hasMinus(password) && !_hasMayus(password) && _hasNumbers(password) && !_hasSpecialCharacters(password)) ||
        (!_hasMinus(password) && !_hasMayus(password) && !_hasNumbers(password) && _hasSpecialCharacters(password))) {
      return Strength.medium;
    } else {
      return Strength.hard;
    }
  } else {
    return Strength.empty;
  }
}

bool equalsString(String password, String rPassword) {
  if (password.length != rPassword.length) {
    return false;
  } else if (password.runtimeType != rPassword.runtimeType) {
    return false;
  } else {
    for (int i = 0; i < password.length; i++) {
      if (password[i] != rPassword[i]) {
        return false;
      }
    }
    return true;
  }
}

bool _hasMayus(String password) {
  return password.contains(RegExp(r'[A-Z]'));
}

bool _hasMinus(String password) {
  return password.contains(RegExp(r'[a-z]'));
}

bool _hasNumbers(String password) {
  return password.contains(RegExp(r'[0-9]'));
}

bool _hasSpecialCharacters(String password) {
  return password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>_-]'));
}

bool _areAllCharactersEquals(String password) {
  String firstLetter = password[0];
  for (int i = 1; i < password.length; i++) {
    if (firstLetter != password[i]) {
      return false;
    }
  }
  return true;
}

enum Strength { empty, easy, medium, hard }

/// InputField reset value and icon visibility

void resetTextIfNoFocus(TextEditingController controller, FocusNode focusNode) {
  focusNode.hasPrimaryFocus ? controller.text = '' : null;
}

IconData? hideShowIcon(TextEditingController controller, FocusNode focusNode) {
  return controller.text.isNotEmpty && focusNode.hasPrimaryFocus ? Icons.cancel_outlined : null;
}

List<bool> dataScreenValidator(String username, String name, String phone) {
  if (username.isEmpty && name.isEmpty && phone.isEmpty) {
    return [true, true, true];
  } else if (username.isEmpty && name.isNotEmpty && phone.isNotEmpty) {
    return [true, false, false];
  } else if (username.isNotEmpty && name.isEmpty && phone.isNotEmpty) {
    return [false, true, false];
  } else if (username.isEmpty && name.isNotEmpty && phone.isEmpty) {
    return [true, false, true];
  } else if (username.isNotEmpty && name.isEmpty && phone.isEmpty) {
    return [false, true, true];
  } else if (username.isNotEmpty && name.isNotEmpty && phone.isEmpty) {
    return [false, false, true];
  } else {
    return [false, false, false];
  }
}

List<bool> passwordScreenValidator(String password, String rPassword) {
  if (password.isEmpty) {
    return [true, false];
  } else if (!equalsString(password, rPassword)) {
    return [false, true];
  } else {
    return [false, false];
  }
}

/// Send email

void sendEmail(String email, String name, String code) async {
  log('Sending email...');
  final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
  const serviceId = 'service_4juazb9';
  const templateId = 'template_ovslkk6';
  const publicKey = 'm6_PyyRTyKWUZmEUA';
  const privateKey = 'ZIyAmgPSEegPkyc5Wg_5x';
  try {
    final response = await http.post(url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'service_id': serviceId,
          'template_id': templateId,
          'user_id': publicKey,
          'accessToken': privateKey,
          'template_params': {
            'user_email': email,
            'name': name,
            'verification_code': code,
          }
        }));
  } catch (error) {
    log("$error");
  }
}

String generateOTP(int length) {
  String otp = '';
  math.Random random = math.Random();
  for (int i = 0; i < length; i++) {
    int char = random.nextInt(9);
    otp += char.toString();
  }
  return otp;
}

/// Working with TmpCode data

void connectAPI() async {
  final response = await http.get(Uri.parse('http://192.168.1.101:8000'));
  log(response.body);
}

void storeTmpCode(String email, String code) async {
  try {
    final response = await http.post(
      Uri.parse('http://192.168.1.101:8000/tmpcodes/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email,
        'code': code,
      }),
    );
    if (response.statusCode != 201) {
      throw Exception('The code was not stored...');
    }
  } on Exception catch (e) {
    log(e.toString());
  }

  //
}

void updateTmpCode(String email, String code) async {
  final response = await http.put(
    Uri.parse('http://192.168.1.101:8000/tmpcodes/$email'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'email': email,
      'code': code,
    }),
  );

  if (response.statusCode != 200) {
    throw Exception('The code was not stored...');
  }
}

Future<String> getTmpCode(String email) async {
  final response = await http.get(Uri.parse('http://192.168.1.101:8000/tmpcodes/$email'));

  if (response.statusCode == 200) {
    return jsonDecode(response.body)["code"];
  } else {
    throw Exception('The code for this user was not found...');
  }
}

void deleteTmpCode(String email) async {
  final response = await http.delete(
    Uri.parse('http://192.168.1.101:8000/tmpcodes/$email'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );

  if (response.statusCode != 204) {
    throw Exception('The user with email $email was not found...');
  }
}

/// Working with User data

void storeUser(User user) async {
  final response = await http.post(
    Uri.parse('http://192.168.1.101:8000/users/'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String?>{
      'email': user.getEmail(),
      'username': user.getUsername(),
      'name': user.getName(),
      'firstSurname': user.getFirstSurname(),
      'secondSurname': user.getSecondSurname(),
      'country': user.getCountry(),
      'phone': user.getPhone(),
      'password': user.getPassword()
    }),
  );

  if (response.statusCode != 201) {
    throw Exception('The user was not stored...');
  }
}

Future<int> getUserByEmail(String email) async {
  final response = await http.get(Uri.parse('http://192.168.1.101:8000/users/$email'));

  return response.statusCode;
}

Future<int> getUserByUsername(String username) async {
  final response = await http.get(Uri.parse('http://192.168.1.101:8000/users/username/$username'));

  return response.statusCode;
}

Future<bool> loginEmail(String email, String password) async {
  try {
    final response = await http.post(
      Uri.parse('http://192.168.1.101:8000/loginemail'),
      body: {
        'username': email,
        'password': password,
      },
    );
    log(response.body);
    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('The user was not found');
    }
  } on Exception catch (e) {
    log(e.toString());
  }
  return false;
}
