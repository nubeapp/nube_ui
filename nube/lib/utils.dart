import 'package:flutter/material.dart';
import 'package:nube/imports.dart';
import 'dart:core';

Route createRoute(Widget route) {
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

bool isValidEmail(String? email) {
  return (email!.isNotEmpty && RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}').hasMatch(email));
}

bool isEmpty(String text) {
  return text == '';
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
      return Strength.HARD;
    } else if ((_hasMinus(password) && _hasMayus(password) && _hasNumbers(password)) ||
        (_hasMinus(password) && _hasMayus(password) && _hasSpecialCharacters(password)) ||
        (_hasMinus(password) && _hasNumbers(password) && _hasSpecialCharacters(password)) ||
        (_hasMayus(password) && _hasNumbers(password) && _hasSpecialCharacters(password))) {
      return Strength.MEDIUM;
    } else if ((_hasMinus(password) && _hasMayus(password)) ||
        (_hasMinus(password) && _hasNumbers(password)) ||
        (_hasMayus(password) && _hasNumbers(password)) ||
        (_hasMinus(password) && _hasSpecialCharacters(password)) ||
        (_hasMayus(password) && _hasSpecialCharacters(password)) ||
        (_hasNumbers(password) && _hasSpecialCharacters(password))) {
      return Strength.EASY;
    } else {
      return Strength.EMPTY;
    }
  } else if (password.length >= 7 && password.length < 12) {
    //  Si tiene 'minúsculas' o 'mayúsculas' o 'números' o 'especiales' -> EASY
    /* 
     *  Si tiene 'minúsculas y mayúsculas' o 'minúsculas y números' o 'mayúsculas y números' 
     *  o 'especiales y minúsculas' o 'especiales y mayúsculas' o 'especiales y números' -> MEDIUM
     */
    //  else -> HARD
    if (_areAllCharactersEquals(password)) {
      return Strength.EASY;
    }
    if ((_hasMinus(password) && _hasMayus(password) && _hasNumbers(password) && _hasSpecialCharacters(password)) ||
        (_hasMinus(password) && _hasMayus(password) && _hasNumbers(password)) ||
        (_hasMinus(password) && _hasMayus(password) && _hasSpecialCharacters(password)) ||
        (_hasMinus(password) && _hasNumbers(password) && _hasSpecialCharacters(password)) ||
        (_hasMayus(password) && _hasNumbers(password) && _hasSpecialCharacters(password))) {
      return Strength.HARD;
    } else if ((_hasMinus(password) && _hasMayus(password)) ||
        (_hasMinus(password) && _hasNumbers(password)) ||
        (_hasMayus(password) && _hasNumbers(password)) ||
        (_hasMinus(password) && _hasSpecialCharacters(password)) ||
        (_hasMayus(password) && _hasSpecialCharacters(password)) ||
        (_hasNumbers(password) && _hasSpecialCharacters(password))) {
      return Strength.MEDIUM;
    } else {
      return Strength.EASY;
    }
  } else if (password.length >= 12) {
    //  Si tiene 'minúsculas' o 'mayúsculas' o 'números' o 'especiales'-> MEDIUM
    //  else -> HARD
    if (_areAllCharactersEquals(password)) {
      return Strength.EASY;
    }
    if ((_hasMinus(password) && !_hasMayus(password) && !_hasNumbers(password) && !_hasSpecialCharacters(password)) ||
        (!_hasMinus(password) && _hasMayus(password) && !_hasNumbers(password) && !_hasSpecialCharacters(password)) ||
        (!_hasMinus(password) && !_hasMayus(password) && _hasNumbers(password) && !_hasSpecialCharacters(password)) ||
        (!_hasMinus(password) && !_hasMayus(password) && !_hasNumbers(password) && _hasSpecialCharacters(password))) {
      return Strength.MEDIUM;
    } else {
      return Strength.HARD;
    }
  } else {
    return Strength.EMPTY;
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

enum Strength { EMPTY, EASY, MEDIUM, HARD }

/// InputField reset value and icon visibility

void resetTextIfNoFocus(TextEditingController controller, FocusNode focusNode) {
  focusNode.hasPrimaryFocus ? controller.text = '' : null;
}

IconData? hideShowIcon(TextEditingController controller, FocusNode focusNode) {
  return !isEmpty(controller.text) && focusNode.hasPrimaryFocus ? Icons.cancel_outlined : null;
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
