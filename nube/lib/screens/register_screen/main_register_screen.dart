import '../../imports.dart';
import 'package:flutter/material.dart';

class MainRegisterScreen extends StatefulWidget {
  const MainRegisterScreen({Key? key}) : super(key: key);

  @override
  State<MainRegisterScreen> createState() => _MainRegisterScreenState();
}

class _MainRegisterScreenState extends State<MainRegisterScreen> {
  /*
   *  Variables
   */
  final TextEditingController _emailController = TextEditingController();
  final FocusNode _emailFocus = FocusNode();
  bool _isEmailErrorVisible = false;
  bool _isUserRegisteredError = false;

  @override
  void initState() {
    _emailFocus.addListener(() async {
      if (await getUserByEmail(_emailController.text) == 200) {
        _isUserRegisteredError = true;
      } else {
        _isUserRegisteredError = false;
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _emailFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.only(left: width(context) * 0.075, right: width(context) * 0.075),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: width(context),
              height: height(context) * 0.2,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Nuevo usuario',
                  style: TextStyle(
                    color: Theme.of(context).highlightColor,
                    fontFamily: 'Tw Cen MT Condensed',
                    fontSize: 38.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5,
                  ),
                ),
                SizedBox(
                  width: width(context) * 0.01,
                ),
                Text(
                  '🔥',
                  style: TextStyle(
                    color: Theme.of(context).highlightColor,
                    fontFamily: 'Tw Cen MT Condensed',
                    fontSize: 26.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(
              width: width(context),
              height: height(context) * 0.025,
            ),
            Text(
              'Introduce su correo para continuar...',
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontFamily: 'Tw Cen MT Regular',
                fontSize: 12.0,
                fontWeight: FontWeight.normal,
                letterSpacing: 1.0,
              ),
            ),
            SizedBox(
              width: width(context),
              height: height(context) * 0.06,
            ),
            InputField(
              focusNode: _emailFocus,
              hintText: 'Correo electrónico',
              hasError: _isEmailErrorVisible || _isUserRegisteredError,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.done,
              obscureText: false,
              controller: _emailController,
              onChanged: (value) {
                setState(() {});
              },
              onPressed: () {
                resetTextIfNoFocus(_emailController, _emailFocus);
              },
              suffixIcon: hideShowIcon(_emailController, _emailFocus),
            ),
            SizedBox(
              width: width(context),
              height: height(context) * 0.01,
            ),
            Opacity(
              opacity: _isEmailErrorVisible ? 1 : (_isUserRegisteredError ? 1 : 0),
              child: ErrorMessage(message: _isEmailErrorVisible ? 'Introduce un email válido' : (_isUserRegisteredError ? 'El email ya está registrado' : '')),
            ),
            SizedBox(
              width: width(context),
              height: height(context) * 0.08,
            ),
            Button(
              text: 'Continuar',
              onPressed: () async {
                bool isUserRegistered = await getUserByEmail(_emailController.text) == 200;
                setState(() {
                  if (isValidEmail(_emailController.text) && !isUserRegistered) {
                    _isEmailErrorVisible = false;
                    _isUserRegisteredError = false;
                    user.saveUserData(_emailController.text, null, null, null, null, null, null, null);
                    FocusManager.instance.primaryFocus?.unfocus();
                    Navigator.of(context).push(createRouteFromRight(const DataRegisterScreen()));
                  } else if (isValidEmail(_emailController.text) && isUserRegistered) {
                    _isEmailErrorVisible = false;
                    _isUserRegisteredError = true;
                  } else {
                    _isEmailErrorVisible = true;
                  }
                });
              },
            ),
            SizedBox(
              width: width(context),
              height: height(context) * 0.01,
            ),
            // Row(
            //   children: [
            //     const Expanded(
            //       child: Divider(
            //         thickness: 2.0,
            //       ),
            //     ),
            //     Padding(
            //       padding: const EdgeInsets.symmetric(horizontal: 8.0),
            //       child: Text(
            //         "Registrarse con Google o Facebook",
            //         style: TextStyle(
            //           color: Theme.of(context).primaryColor,
            //           fontFamily: 'Tw Cen MT Regular',
            //           fontSize: 12.0,
            //           fontWeight: FontWeight.w500,
            //           letterSpacing: 1.0,
            //         ),
            //       ),
            //     ),
            //     const Expanded(
            //       child: Divider(
            //         thickness: 2.0,
            //       ),
            //     ),
            //   ],
            // ),
            // SizedBox(
            //   width: width(context),
            //   height: height(context) * 0.02,
            // ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     SocialMediaButton(
            //       asset: 'assets/images/google-icon.png',
            //       socialMediaText: 'Google',
            //       onTap: () => log('Google'),
            //     ),
            //     SocialMediaButton(
            //       asset: 'assets/images/facebook-icon.png',
            //       socialMediaText: 'Facebook',
            //       onTap: () => log('Facebook'),
            //     ),
            //   ],
            // ),
            SizedBox(
              width: width(context),
              height: height(context) * 0.025,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '¿Ya tienes una cuenta?',
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
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    Navigator.of(context).push(createRouteFromLeft(const MainLoginScreen()));
                  },
                  child: Text(
                    'Iniciar sesión',
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
              height: height(context) * 0.32,
            ),
            const Center(
              child: Image(
                width: 60.0,
                image: AssetImage(
                  'assets/images/nube-icon.png',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
