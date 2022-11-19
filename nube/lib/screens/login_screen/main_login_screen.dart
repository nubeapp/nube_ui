import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:nube/imports.dart';

class MainLoginScreen extends StatefulWidget {
  const MainLoginScreen({super.key});

  @override
  State<MainLoginScreen> createState() => _MainLoginScreenState();
}

class _MainLoginScreenState extends State<MainLoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _emailFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();
  bool _isErrorVisible = false;
  bool _isPasswordVisible = false;
  int currentTab = 1;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _emailFocus.dispose();
    _passwordFocus.dispose();
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
                height: 2,
              ),
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
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          if (currentTab == 2) {
                            currentTab = 1;
                          }
                        });
                      },
                      child: Container(
                        width: width(context) * 0.38,
                        height: height(context) * 0.07,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: currentTab == 1 ? Theme.of(context).backgroundColor : Theme.of(context).cardColor,
                        ),
                        child: Center(
                          child: Text(
                            'Correo electrónico',
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontFamily: 'Tw Cen MT Regular',
                              fontSize: 12.0,
                              fontWeight: FontWeight.normal,
                              letterSpacing: 1.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          if (currentTab == 1) {
                            currentTab = 2;
                          }
                        });
                      },
                      child: Container(
                        width: width(context) * 0.38,
                        height: height(context) * 0.07,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: currentTab == 2 ? Theme.of(context).backgroundColor : Theme.of(context).cardColor,
                        ),
                        child: Center(
                          child: Text(
                            'Nombre de usuario',
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontFamily: 'Tw Cen MT Regular',
                              fontSize: 12.0,
                              fontWeight: FontWeight.normal,
                              letterSpacing: 1.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: width(context),
              height: height(context) * 0.04,
            ),
            InputField(
              focusNode: _emailFocus,
              hintText: currentTab == 1 ? 'Correo electrónico' : 'Nombre de usuario',
              hasError: _isErrorVisible,
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
              height: height(context) * 0.06,
            ),
            InputField(
              focusNode: _passwordFocus,
              hintText: 'Contraseña',
              hasError: _isErrorVisible,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.done,
              obscureText: !_isPasswordVisible,
              controller: _passwordController,
              onChanged: (value) {
                setState(() {});
              },
              onPressed: () {
                setState(() {
                  if (_passwordController.text.isNotEmpty) {
                    _isPasswordVisible = !_isPasswordVisible;
                  }
                });
              },
              suffixIcon: _passwordController.text.isNotEmpty ? (!_isPasswordVisible ? Icons.visibility_off_outlined : Icons.visibility_outlined) : null,
            ),
            SizedBox(
              width: width(context),
              height: height(context) * 0.04,
            ),
            Center(
              child: Opacity(
                opacity: _isErrorVisible ? 1 : 0,
                child: const ErrorMessage(message: 'Los datos no son correctos'),
              ),
            ),
            SizedBox(
              width: width(context),
              height: height(context) * 0.02,
            ),
            Button(
              text: 'Continuar',
              onPressed: () {
                // Comprobar que el user está en la BBDD. Si no está mostrar un error.
                // Si está -> loguearlo y asignarlo como current_user
                setState(() {
                  if (isValidEmail(_emailController.text)) {
                    _isErrorVisible = false;
                    Navigator.of(context).push(createRouteFromRight(const MainScreen()));
                  } else {
                    _isErrorVisible = true;
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
                  onTap: () {
                    Navigator.of(context).push(createRouteFromRight(const MainRegisterScreen()));
                  },
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
