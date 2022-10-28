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
  static final TextEditingController _emailController = TextEditingController();
  final FocusNode _emailFocus = FocusNode();
  bool _isEmailErrorVisible = false;

  @override
  void initState() {
    _emailFocus.addListener(() {});
    super.initState();
  }

  @override
  void dispose() {
    // _emailController.dispose();
    _emailFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: width(context) * 0.075, right: width(context) * 0.075),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: width(context),
                height: height(context) * 0.14,
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
                hasError: _isEmailErrorVisible,
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
                opacity: _isEmailErrorVisible ? 1 : 0,
                child: const ErrorMessage(message: 'Introduce un email válido'),
              ),
              SizedBox(
                width: width(context),
                height: height(context) * 0.08,
              ),
              Button(
                text: 'Continuar',
                onPressed: () {
                  setState(() {
                    if (isValidEmail(_emailController.text)) {
                      _isEmailErrorVisible = false;
                      Navigator.of(context).push(createRoute(const DataRegisterScreen()));
                    } else {
                      _isEmailErrorVisible = true;
                    }
                  });
                },
              ),
              SizedBox(
                width: width(context),
                height: height(context) * 0.08,
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
                      "Registrarse con Google o Facebook",
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
                height: height(context) * 0.02,
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
                    onTap: () => log("Iniciar sesión"),
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
                height: height(context) * 0.12,
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
      ),
    );
  }
}
