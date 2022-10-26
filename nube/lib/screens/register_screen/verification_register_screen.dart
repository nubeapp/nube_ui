import 'package:flutter/material.dart';
import 'package:nube/imports.dart';

class VerificationRegisterScreen extends StatefulWidget {
  const VerificationRegisterScreen({Key? key}) : super(key: key);

  @override
  State<VerificationRegisterScreen> createState() => _VerificationRegisterScreenState();
}

class _VerificationRegisterScreenState extends State<VerificationRegisterScreen> {
  /// Variables ///
  final FocusNode _firstNumberFocus = FocusNode();
  final FocusNode _secondNumberFocus = FocusNode();
  final FocusNode _thirdNumberFocus = FocusNode();
  final FocusNode _fourthNumberFocus = FocusNode();
  final FocusNode _fifthNumberFocus = FocusNode();

  final TextEditingController _firstNumberController = TextEditingController();
  final TextEditingController _secondNumberController = TextEditingController();
  final TextEditingController _thirdNumberController = TextEditingController();
  final TextEditingController _fourthNumberController = TextEditingController();
  final TextEditingController _fifthNumberController = TextEditingController();

  int currentFocus = 1;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(left: width(context) * 0.075, right: width(context) * 0.075),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: width(context),
                  height: height(context) * 0.1,
                ),
                Text(
                  'Introduzca el código de verificación que se ha enviado al correo electrónico',
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
                  width: width(context),
                  height: height(context) * 0.05,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      width: width(context) * 0.13,
                      height: width(context) * 0.13,
                      child: VerificationInputField(
                        autofocus: true,
                        controller: _firstNumberController,
                        focusNode: _firstNumberFocus,
                        onChanged: (value) {
                          setState(() {
                            if (value.isNotEmpty) {
                              currentFocus = 1;
                              FocusScope.of(context).requestFocus(_secondNumberFocus);
                            } else {
                              currentFocus = 0;
                            }
                          });
                        },
                        onTap: () {
                          setState(() {
                            switch (currentFocus) {
                              case 1:
                                FocusScope.of(context).requestFocus(_firstNumberFocus);
                                break;
                              case 2:
                                FocusScope.of(context).requestFocus(_secondNumberFocus);
                                break;
                              case 3:
                                FocusScope.of(context).requestFocus(_thirdNumberFocus);
                                break;
                              case 4:
                                FocusScope.of(context).requestFocus(_fourthNumberFocus);
                                break;
                              case 5:
                                FocusScope.of(context).requestFocus(_fifthNumberFocus);
                                break;
                              default:
                            }
                          });
                        },
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: width(context) * 0.13,
                      height: width(context) * 0.13,
                      child: VerificationInputField(
                        autofocus: false,
                        controller: _secondNumberController,
                        focusNode: _secondNumberFocus,
                        onChanged: (value) {
                          setState(() {
                            if (value.isNotEmpty) {
                              currentFocus = 2;
                              FocusScope.of(context).requestFocus(_thirdNumberFocus);
                            } else {
                              currentFocus = 0;
                              FocusScope.of(context).requestFocus(_firstNumberFocus);
                            }
                          });
                        },
                        onTap: () {
                          setState(() {
                            switch (currentFocus) {
                              case 1:
                                FocusScope.of(context).requestFocus(_firstNumberFocus);
                                break;
                              case 2:
                                FocusScope.of(context).requestFocus(_secondNumberFocus);
                                break;
                              case 3:
                                FocusScope.of(context).requestFocus(_thirdNumberFocus);
                                break;
                              case 4:
                                FocusScope.of(context).requestFocus(_fourthNumberFocus);
                                break;
                              case 5:
                                FocusScope.of(context).requestFocus(_fifthNumberFocus);
                                break;
                              default:
                            }
                          });
                        },
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: width(context) * 0.13,
                      height: width(context) * 0.13,
                      child: VerificationInputField(
                        autofocus: false,
                        controller: _thirdNumberController,
                        focusNode: _thirdNumberFocus,
                        onChanged: (value) {
                          setState(() {
                            if (value.isNotEmpty) {
                              currentFocus = 3;
                              FocusScope.of(context).requestFocus(_fourthNumberFocus);
                            } else {
                              currentFocus = 1;
                              FocusScope.of(context).requestFocus(_secondNumberFocus);
                            }
                          });
                        },
                        onTap: () {
                          setState(() {
                            switch (currentFocus) {
                              case 1:
                                FocusScope.of(context).requestFocus(_firstNumberFocus);
                                break;
                              case 2:
                                FocusScope.of(context).requestFocus(_secondNumberFocus);
                                break;
                              case 3:
                                FocusScope.of(context).requestFocus(_thirdNumberFocus);
                                break;
                              case 4:
                                FocusScope.of(context).requestFocus(_fourthNumberFocus);
                                break;
                              case 5:
                                FocusScope.of(context).requestFocus(_fifthNumberFocus);
                                break;
                              default:
                            }
                          });
                        },
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: width(context) * 0.13,
                      height: width(context) * 0.13,
                      child: VerificationInputField(
                        autofocus: false,
                        controller: _fourthNumberController,
                        focusNode: _fourthNumberFocus,
                        onChanged: (value) {
                          setState(() {
                            if (value.isNotEmpty) {
                              currentFocus = 4;
                              FocusScope.of(context).requestFocus(_fifthNumberFocus);
                            } else {
                              currentFocus = 2;
                              FocusScope.of(context).requestFocus(_thirdNumberFocus);
                            }
                          });
                        },
                        onTap: () {
                          setState(() {
                            switch (currentFocus) {
                              case 1:
                                FocusScope.of(context).requestFocus(_firstNumberFocus);
                                break;
                              case 2:
                                FocusScope.of(context).requestFocus(_secondNumberFocus);
                                break;
                              case 3:
                                FocusScope.of(context).requestFocus(_thirdNumberFocus);
                                break;
                              case 4:
                                FocusScope.of(context).requestFocus(_fourthNumberFocus);
                                break;
                              case 5:
                                FocusScope.of(context).requestFocus(_fifthNumberFocus);
                                break;
                              default:
                            }
                          });
                        },
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: width(context) * 0.13,
                      height: width(context) * 0.13,
                      child: VerificationInputField(
                        autofocus: false,
                        controller: _fifthNumberController,
                        focusNode: _fifthNumberFocus,
                        onChanged: (value) {
                          setState(() {
                            if (value.isNotEmpty) {
                              currentFocus = 4;
                              FocusScope.of(context).unfocus();
                            } else {
                              currentFocus = 3;
                              FocusScope.of(context).requestFocus(_fourthNumberFocus);
                            }
                          });
                        },
                        onTap: () {
                          setState(() {
                            switch (currentFocus) {
                              case 1:
                                FocusScope.of(context).requestFocus(_firstNumberFocus);
                                break;
                              case 2:
                                FocusScope.of(context).requestFocus(_secondNumberFocus);
                                break;
                              case 3:
                                FocusScope.of(context).requestFocus(_thirdNumberFocus);
                                break;
                              case 4:
                                FocusScope.of(context).requestFocus(_fourthNumberFocus);
                                break;
                              case 5:
                                FocusScope.of(context).requestFocus(_fifthNumberFocus);
                                break;
                              default:
                            }
                          });
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: width(context),
                  height: height(context) * 0.06,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '¿No ha recibido ningún código?',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontFamily: 'Tw Cen MT Regular',
                        fontSize: 12.0,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 1.0,
                      ),
                    ),
                    SizedBox(
                      width: width(context) * 0.015,
                    ),
                    GestureDetector(
                      onTap: () => log("Reenviar"),
                      child: Text(
                        'Reenviar',
                        style: TextStyle(
                          color: Theme.of(context).highlightColor,
                          fontFamily: 'Tw Cen MT Regular',
                          fontSize: 12.0,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1.0,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  width: width(context),
                  height: height(context) * 0.07,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    NumberButton(
                      onTap: () {
                        setState(() {
                          switch (currentFocus) {
                            case 1:
                              if (_firstNumberFocus.hasFocus) {
                                _firstNumberController.text = '7';
                                currentFocus++;
                                FocusScope.of(context).requestFocus(_secondNumberFocus);
                              }
                              break;
                            case 2:
                              if (_secondNumberFocus.hasFocus) {
                                _secondNumberController.text = '7';
                                currentFocus++;
                                FocusScope.of(context).requestFocus(_thirdNumberFocus);
                              }
                              break;
                            case 3:
                              if (_thirdNumberFocus.hasFocus) {
                                _thirdNumberController.text = '7';
                                currentFocus++;
                                FocusScope.of(context).requestFocus(_fourthNumberFocus);
                              }
                              break;
                            case 4:
                              if (_fourthNumberFocus.hasFocus) {
                                _fourthNumberController.text = '7';
                                currentFocus++;
                                FocusScope.of(context).requestFocus(_fifthNumberFocus);
                              }
                              break;
                            case 5:
                              if (_fifthNumberFocus.hasFocus) {
                                _fifthNumberController.text = '7';
                                FocusScope.of(context).unfocus();
                              }
                              break;
                          }
                        });
                      },
                      text: '7',
                    ),
                    NumberButton(
                      onTap: () {
                        setState(() {
                          switch (currentFocus) {
                            case 1:
                              if (_firstNumberFocus.hasFocus) {
                                _firstNumberController.text = '8';
                                currentFocus++;
                                FocusScope.of(context).requestFocus(_secondNumberFocus);
                              }
                              break;
                            case 2:
                              if (_secondNumberFocus.hasFocus) {
                                _secondNumberController.text = '8';
                                currentFocus++;
                                FocusScope.of(context).requestFocus(_thirdNumberFocus);
                              }
                              break;
                            case 3:
                              if (_thirdNumberFocus.hasFocus) {
                                _thirdNumberController.text = '8';
                                currentFocus++;
                                FocusScope.of(context).requestFocus(_fourthNumberFocus);
                              }
                              break;
                            case 4:
                              if (_fourthNumberFocus.hasFocus) {
                                _fourthNumberController.text = '8';
                                currentFocus++;
                                FocusScope.of(context).requestFocus(_fifthNumberFocus);
                              }
                              break;
                            case 5:
                              if (_fifthNumberFocus.hasFocus) {
                                _fifthNumberController.text = '8';
                                FocusScope.of(context).unfocus();
                              }
                              break;
                          }
                        });
                      },
                      text: '8',
                    ),
                    NumberButton(
                      onTap: () {
                        setState(() {
                          switch (currentFocus) {
                            case 1:
                              if (_firstNumberFocus.hasFocus) {
                                _firstNumberController.text = '9';
                                currentFocus++;
                                FocusScope.of(context).requestFocus(_secondNumberFocus);
                              }
                              break;
                            case 2:
                              if (_secondNumberFocus.hasFocus) {
                                _secondNumberController.text = '9';
                                currentFocus++;
                                FocusScope.of(context).requestFocus(_thirdNumberFocus);
                              }
                              break;
                            case 3:
                              if (_thirdNumberFocus.hasFocus) {
                                _thirdNumberController.text = '9';
                                currentFocus++;
                                FocusScope.of(context).requestFocus(_fourthNumberFocus);
                              }
                              break;
                            case 4:
                              if (_fourthNumberFocus.hasFocus) {
                                _fourthNumberController.text = '9';
                                currentFocus++;
                                FocusScope.of(context).requestFocus(_fifthNumberFocus);
                              }
                              break;
                            case 5:
                              if (_fifthNumberFocus.hasFocus) {
                                _fifthNumberController.text = '9';
                                FocusScope.of(context).unfocus();
                              }
                              break;
                          }
                        });
                      },
                      text: '9',
                    ),
                  ],
                ),
                SizedBox(
                  width: width(context),
                  height: height(context) * 0.05,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    NumberButton(
                      onTap: () {
                        setState(() {
                          switch (currentFocus) {
                            case 1:
                              if (_firstNumberFocus.hasFocus) {
                                _firstNumberController.text = '4';
                                currentFocus++;
                                FocusScope.of(context).requestFocus(_secondNumberFocus);
                              }
                              break;
                            case 2:
                              if (_secondNumberFocus.hasFocus) {
                                _secondNumberController.text = '4';
                                currentFocus++;
                                FocusScope.of(context).requestFocus(_thirdNumberFocus);
                              }
                              break;
                            case 3:
                              if (_thirdNumberFocus.hasFocus) {
                                _thirdNumberController.text = '4';
                                currentFocus++;
                                FocusScope.of(context).requestFocus(_fourthNumberFocus);
                              }
                              break;
                            case 4:
                              if (_fourthNumberFocus.hasFocus) {
                                _fourthNumberController.text = '4';
                                currentFocus++;
                                FocusScope.of(context).requestFocus(_fifthNumberFocus);
                              }
                              break;
                            case 5:
                              if (_fifthNumberFocus.hasFocus) {
                                _fifthNumberController.text = '4';
                                FocusScope.of(context).unfocus();
                              }
                              break;
                          }
                        });
                      },
                      text: '4',
                    ),
                    NumberButton(
                      onTap: () {
                        setState(() {
                          switch (currentFocus) {
                            case 1:
                              if (_firstNumberFocus.hasFocus) {
                                _firstNumberController.text = '5';
                                currentFocus++;
                                FocusScope.of(context).requestFocus(_secondNumberFocus);
                              }
                              break;
                            case 2:
                              if (_secondNumberFocus.hasFocus) {
                                _secondNumberController.text = '5';
                                currentFocus++;
                                FocusScope.of(context).requestFocus(_thirdNumberFocus);
                              }
                              break;
                            case 3:
                              if (_thirdNumberFocus.hasFocus) {
                                _thirdNumberController.text = '5';
                                currentFocus++;
                                FocusScope.of(context).requestFocus(_fourthNumberFocus);
                              }
                              break;
                            case 4:
                              if (_fourthNumberFocus.hasFocus) {
                                _fourthNumberController.text = '5';
                                currentFocus++;
                                FocusScope.of(context).requestFocus(_fifthNumberFocus);
                              }
                              break;
                            case 5:
                              if (_fifthNumberFocus.hasFocus) {
                                _fifthNumberController.text = '5';
                                FocusScope.of(context).unfocus();
                              }
                              break;
                          }
                        });
                      },
                      text: '5',
                    ),
                    NumberButton(
                      onTap: () {
                        setState(() {
                          switch (currentFocus) {
                            case 1:
                              if (_firstNumberFocus.hasFocus) {
                                _firstNumberController.text = '6';
                                currentFocus++;
                                FocusScope.of(context).requestFocus(_secondNumberFocus);
                              }
                              break;
                            case 2:
                              if (_secondNumberFocus.hasFocus) {
                                _secondNumberController.text = '6';
                                currentFocus++;
                                FocusScope.of(context).requestFocus(_thirdNumberFocus);
                              }
                              break;
                            case 3:
                              if (_thirdNumberFocus.hasFocus) {
                                _thirdNumberController.text = '6';
                                currentFocus++;
                                FocusScope.of(context).requestFocus(_fourthNumberFocus);
                              }
                              break;
                            case 4:
                              if (_fourthNumberFocus.hasFocus) {
                                _fourthNumberController.text = '6';
                                currentFocus++;
                                FocusScope.of(context).requestFocus(_fifthNumberFocus);
                              }
                              break;
                            case 5:
                              if (_fifthNumberFocus.hasFocus) {
                                _fifthNumberController.text = '6';
                                FocusScope.of(context).unfocus();
                              }
                              break;
                          }
                        });
                      },
                      text: '6',
                    ),
                  ],
                ),
                SizedBox(
                  width: width(context),
                  height: height(context) * 0.05,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    NumberButton(
                      onTap: () {
                        setState(() {
                          switch (currentFocus) {
                            case 1:
                              if (_firstNumberFocus.hasFocus) {
                                _firstNumberController.text = '1';
                                currentFocus++;
                                FocusScope.of(context).requestFocus(_secondNumberFocus);
                              }
                              break;
                            case 2:
                              if (_secondNumberFocus.hasFocus) {
                                _secondNumberController.text = '1';
                                currentFocus++;
                                FocusScope.of(context).requestFocus(_thirdNumberFocus);
                              }
                              break;
                            case 3:
                              if (_thirdNumberFocus.hasFocus) {
                                _thirdNumberController.text = '1';
                                currentFocus++;
                                FocusScope.of(context).requestFocus(_fourthNumberFocus);
                              }
                              break;
                            case 4:
                              if (_fourthNumberFocus.hasFocus) {
                                _fourthNumberController.text = '1';
                                currentFocus++;
                                FocusScope.of(context).requestFocus(_fifthNumberFocus);
                              }
                              break;
                            case 5:
                              if (_fifthNumberFocus.hasFocus) {
                                _fifthNumberController.text = '1';
                                FocusScope.of(context).unfocus();
                              }
                              break;
                          }
                        });
                      },
                      text: '1',
                    ),
                    NumberButton(
                      onTap: () {
                        setState(() {
                          switch (currentFocus) {
                            case 1:
                              if (_firstNumberFocus.hasFocus) {
                                _firstNumberController.text = '2';
                                currentFocus++;
                                FocusScope.of(context).requestFocus(_secondNumberFocus);
                              }
                              break;
                            case 2:
                              if (_secondNumberFocus.hasFocus) {
                                _secondNumberController.text = '2';
                                currentFocus++;
                                FocusScope.of(context).requestFocus(_thirdNumberFocus);
                              }
                              break;
                            case 3:
                              if (_thirdNumberFocus.hasFocus) {
                                _thirdNumberController.text = '2';
                                currentFocus++;
                                FocusScope.of(context).requestFocus(_fourthNumberFocus);
                              }
                              break;
                            case 4:
                              if (_fourthNumberFocus.hasFocus) {
                                _fourthNumberController.text = '2';
                                currentFocus++;
                                FocusScope.of(context).requestFocus(_fifthNumberFocus);
                              }
                              break;
                            case 5:
                              if (_fifthNumberFocus.hasFocus) {
                                _fifthNumberController.text = '2';
                                FocusScope.of(context).unfocus();
                              }
                              break;
                          }
                        });
                      },
                      text: '2',
                    ),
                    NumberButton(
                      onTap: () {
                        setState(() {
                          switch (currentFocus) {
                            case 1:
                              if (_firstNumberFocus.hasFocus) {
                                _firstNumberController.text = '3';
                                currentFocus++;
                                FocusScope.of(context).requestFocus(_secondNumberFocus);
                              }
                              break;
                            case 2:
                              if (_secondNumberFocus.hasFocus) {
                                _secondNumberController.text = '3';
                                currentFocus++;
                                FocusScope.of(context).requestFocus(_thirdNumberFocus);
                              }
                              break;
                            case 3:
                              if (_thirdNumberFocus.hasFocus) {
                                _thirdNumberController.text = '3';
                                currentFocus++;
                                FocusScope.of(context).requestFocus(_fourthNumberFocus);
                              }
                              break;
                            case 4:
                              if (_fourthNumberFocus.hasFocus) {
                                _fourthNumberController.text = '3';
                                currentFocus++;
                                FocusScope.of(context).requestFocus(_fifthNumberFocus);
                              }
                              break;
                            case 5:
                              if (_fifthNumberFocus.hasFocus) {
                                _fifthNumberController.text = '3';
                                FocusScope.of(context).unfocus();
                              }
                              break;
                          }
                        });
                      },
                      text: '3',
                    ),
                  ],
                ),
                SizedBox(
                  width: width(context),
                  height: height(context) * 0.05,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: width(context) * 0.14,
                      height: width(context) * 0.14,
                      alignment: Alignment.topCenter,
                      child: IconButton(
                        icon: const Icon(Icons.check),
                        iconSize: 36.0,
                        splashRadius: 0.01,
                        color: Theme.of(context).highlightColor,
                        onPressed: () => log('Hecho'),
                      ),
                    ),
                    NumberButton(
                      onTap: () {
                        setState(() {
                          switch (currentFocus) {
                            case 1:
                              if (_firstNumberFocus.hasFocus) {
                                _firstNumberController.text = '0';
                                currentFocus++;
                                FocusScope.of(context).requestFocus(_secondNumberFocus);
                              }
                              break;
                            case 2:
                              if (_secondNumberFocus.hasFocus) {
                                _secondNumberController.text = '0';
                                currentFocus++;
                                FocusScope.of(context).requestFocus(_thirdNumberFocus);
                              }
                              break;
                            case 3:
                              if (_thirdNumberFocus.hasFocus) {
                                _thirdNumberController.text = '0';
                                currentFocus++;
                                FocusScope.of(context).requestFocus(_fourthNumberFocus);
                              }
                              break;
                            case 4:
                              if (_fourthNumberFocus.hasFocus) {
                                _fourthNumberController.text = '0';
                                currentFocus++;
                                FocusScope.of(context).requestFocus(_fifthNumberFocus);
                              }
                              break;
                            case 5:
                              if (_fifthNumberFocus.hasFocus) {
                                _fifthNumberController.text = '0';
                                FocusScope.of(context).unfocus();
                              }
                              break;
                          }
                        });
                      },
                      text: '0',
                    ),
                    Container(
                      width: width(context) * 0.14,
                      height: width(context) * 0.14,
                      alignment: Alignment.center,
                      child: IconButton(
                          icon: const Icon(Icons.backspace_outlined),
                          iconSize: 28.0,
                          splashColor: Colors.transparent,
                          splashRadius: 0.01,
                          color: Theme.of(context).indicatorColor,
                          onPressed: () {
                            setState(() {
                              switch (currentFocus) {
                                case 1:
                                  if (_firstNumberFocus.hasFocus) {
                                    _firstNumberController.text = '';
                                  }
                                  break;
                                case 2:
                                  if (_secondNumberFocus.hasFocus) {
                                    currentFocus--;
                                    _secondNumberController.text = '';
                                    FocusScope.of(context).requestFocus(_firstNumberFocus);
                                  }
                                  break;
                                case 3:
                                  if (_thirdNumberFocus.hasFocus) {
                                    currentFocus--;
                                    _thirdNumberController.text = '';
                                    FocusScope.of(context).requestFocus(_secondNumberFocus);
                                  }
                                  break;
                                case 4:
                                  if (_fourthNumberFocus.hasFocus) {
                                    currentFocus--;
                                    _fourthNumberController.text = '';
                                    FocusScope.of(context).requestFocus(_thirdNumberFocus);
                                  }
                                  break;
                                case 5:
                                  if (_fifthNumberFocus.hasFocus) {
                                    currentFocus--;
                                    _fifthNumberController.text = '';
                                    FocusScope.of(context).requestFocus(_fourthNumberFocus);
                                  }
                                  break;
                              }
                            });
                          }),
                    ),
                  ],
                ),
                SizedBox(
                  width: width(context),
                  height: height(context) * 0.05,
                ),
                Text(
                  '¿Quieres cancelar el proceso de registro?',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontFamily: 'Tw Cen MT Regular',
                    fontSize: 12.0,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1.0,
                  ),
                ),
                SizedBox(
                  height: height(context) * 0.01,
                ),
                GestureDetector(
                  onTap: () => log("Cancelar"),
                  child: Text(
                    'Cancelar',
                    style: TextStyle(
                      color: Theme.of(context).highlightColor,
                      fontFamily: 'Tw Cen MT Regular',
                      fontSize: 12.0,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.0,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
