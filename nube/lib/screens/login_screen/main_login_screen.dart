import 'package:flutter/material.dart';
import 'package:nube/imports.dart';

class MainLoginScreen extends StatefulWidget {
  const MainLoginScreen({super.key});

  @override
  State<MainLoginScreen> createState() => _MainLoginScreenState();
}

class _MainLoginScreenState extends State<MainLoginScreen> {
  /*
   *  Variables
   */
  final TextEditingController _emailController = TextEditingController();
  final FocusNode _emailFocus = FocusNode();
  bool _isEmailErrorVisible = false;
  bool _isUserRegisteredError = false;

  @override
  void initState() {
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
              height: height(context) * 0.05,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '¡Hola de nuevo!',
                  style: TextStyle(
                    color: Theme.of(context).highlightColor,
                    fontFamily: 'Tw Cen MT Condensed',
                    fontSize: 38.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5,
                  ),
                ),
                SizedBox(
                  width: width(context) * 0.02,
                ),
                Text(
                  '👋',
                  style: TextStyle(
                    color: Theme.of(context).highlightColor,
                    fontFamily: 'Tw Cen MT Condensed',
                    fontSize: 26.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Text(
              'Inicia sesión para ver lo ocurrido mientras no estabas...',
              style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontFamily: 'Tw Cen MT Regular',
                  fontSize: 12.0,
                  fontWeight: FontWeight.normal,
                  letterSpacing: 1.0,
                  height: 2),
            ),
            SizedBox(
              width: width(context),
              height: height(context) * 0.04,
            ),
            Container(
              height: height(context) * 0.1,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Theme.of(context).cardColor,
              ),
            ),
            SizedBox(
              width: width(context),
              height: height(context) * 0.04,
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
            SizedBox(
              height: height(context) * 0.05,
            ),
            InputField(
              focusNode: _emailFocus,
              hintText: 'Contraseña',
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
              height: height(context) * 0.04,
            ),
            const Center(
              child: Opacity(
                opacity: 0,
                child: ErrorMessage(message: 'Los datos no son correctos'),
              ),
            ),
            SizedBox(
              width: width(context),
              height: height(context) * 0.02,
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
                    Navigator.of(context).push(createRoute(const DataRegisterScreen()));
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
              height: height(context) * 0.03,
            ),
            Row(
              children: [
                const Expanded(
                  child: Divider(
                    thickness: 2.0,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    "Iniciar sesión con Google o Facebook",
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontFamily: 'Tw Cen MT Regular',
                      fontSize: 12.0,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 1.0,
                    ),
                  ),
                ),
                const Expanded(
                  child: Divider(
                    thickness: 2.0,
                  ),
                ),
              ],
            ),
            SizedBox(
              width: width(context),
              height: height(context) * 0.03,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SocialMediaButton(
                  asset: 'assets/images/google-icon.png',
                  socialMediaText: 'Google',
                  onTap: () => log('Google'),
                ),
                SocialMediaButton(
                  asset: 'assets/images/facebook-icon.png',
                  socialMediaText: 'Facebook',
                  onTap: () => log('Facebook'),
                ),
              ],
            ),
            SizedBox(
              width: width(context),
              height: height(context) * 0.025,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '¿Aún no tienes cuenta?',
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
                  onTap: () => log("Registrarse"),
                  child: Text(
                    'Crear cuenta',
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
              height: height(context) * 0.02,
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
