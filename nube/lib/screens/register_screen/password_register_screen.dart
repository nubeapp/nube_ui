import '../../imports.dart';
import 'package:flutter/material.dart';

class PasswordRegisterScreen extends StatefulWidget {
  const PasswordRegisterScreen({Key? key}) : super(key: key);

  @override
  State<PasswordRegisterScreen> createState() => _PasswordRegisterScreenState();
}

class _PasswordRegisterScreenState extends State<PasswordRegisterScreen> {
  /*
   *  Variables
   */
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _rPasswordController = TextEditingController();

  bool _isPasswordErrorVisible = false;
  bool _isRPasswordErrorVisible = false;

  List<bool> passwordValidator = List.empty();

  @override
  void dispose() {
    _passwordController.dispose();
    _rPasswordController.dispose();
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
                height: height(context) * 0.05,
              ),
              CustomIconButton(
                icon: Icons.arrow_back_ios_new_rounded,
                onTap: () => Navigator.of(context).pop(),
              ),
              SizedBox(
                width: width(context),
                height: height(context) * 0.025,
              ),
              Text(
                'Por último...',
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
              InputField(
                hintText: 'Contraseña',
                keyboardType: TextInputType.text,
                obscureText: passwordVisibility["PASSWORD"]!,
                textInputAction: TextInputAction.done,
                controller: _passwordController,
                hasError: _isPasswordErrorVisible,
                onChanged: (password) {
                  setState(() {
                    _updateContainerColor(checkPasswordStrength(password));
                  });
                },
                onPressed: () {
                  setState(() {
                    if (_passwordController.text.isNotEmpty) {
                      _updatePasswordVisibility("PASSWORD");
                    }
                  });
                },
                suffixIcon:
                    _passwordController.text.isNotEmpty ? (passwordVisibility["PASSWORD"]! ? Icons.visibility_off_outlined : Icons.visibility_outlined) : null,
              ),
              SizedBox(
                width: width(context),
                height: height(context) * 0.01,
              ),
              _passwordController.text.isEmpty
                  ? Opacity(
                      opacity: _isPasswordErrorVisible ? 1 : 0,
                      child: const ErrorMessage(message: 'La contraseña no puede estar vacía'),
                    )
                  : Row(
                      children: [
                        SizedBox(
                          width: width(context) * 0.01,
                        ),
                        Container(
                          width: width(context) * 0.12,
                          height: height(context) * 0.01,
                          color: strengthValues["EASY"]! ? const Color(0xFFC1FF3B) : Theme.of(context).cardColor,
                        ),
                        SizedBox(
                          width: width(context) * 0.02,
                        ),
                        Container(
                          width: width(context) * 0.12,
                          height: height(context) * 0.01,
                          color: strengthValues["MEDIUM"]! ? const Color(0xFFFFD43B) : Theme.of(context).cardColor,
                        ),
                        SizedBox(
                          width: width(context) * 0.02,
                        ),
                        Container(
                          width: width(context) * 0.12,
                          height: height(context) * 0.01,
                          color: strengthValues["HARD"]! ? const Color(0xFFF31B2F) : Theme.of(context).cardColor,
                        ),
                      ],
                    ),
              SizedBox(
                width: width(context),
                height: height(context) * 0.06,
              ),
              InputField(
                hintText: 'Repetir contraseña',
                keyboardType: TextInputType.text,
                obscureText: passwordVisibility["RPASSWORD"]!,
                textInputAction: TextInputAction.done,
                hasError: _isRPasswordErrorVisible,
                controller: _rPasswordController,
                onChanged: (rPassword) {
                  setState(() {});
                },
                onPressed: () {
                  setState(() {
                    if (_rPasswordController.text.isNotEmpty) {
                      _updatePasswordVisibility("RPASSWORD");
                    }
                  });
                },
                suffixIcon: _rPasswordController.text.isNotEmpty
                    ? (passwordVisibility["RPASSWORD"]! ? Icons.visibility_off_outlined : Icons.visibility_outlined)
                    : null,
              ),
              SizedBox(
                width: width(context),
                height: height(context) * 0.01,
              ),
              Opacity(
                opacity: _isRPasswordErrorVisible ? 1 : 0,
                child: const ErrorMessage(message: 'Las contraseñas no coinciden'),
              ),
              SizedBox(
                width: width(context),
                height: height(context) * 0.08,
              ),
              Button(
                text: 'Finalizar',
                onPressed: () {
                  setState(() {
                    passwordValidator = passwordScreenValidator(_passwordController.text, _rPasswordController.text);
                    _isPasswordErrorVisible = passwordValidator[0];
                    _isRPasswordErrorVisible = passwordValidator[1];
                    if (!_isPasswordErrorVisible && !_isRPasswordErrorVisible) {
                      Navigator.of(context).push(createRoute(const VerificationRegisterScreen()));
                    }
                  });
                },
              ),
              SizedBox(
                width: width(context),
                height: height(context) * 0.02,
              ),
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Pulsando sobre Finalizar se aceptan los ',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontFamily: 'Tw Cen MT Regular',
                        fontSize: 12.0,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 1.0,
                      ),
                    ),
                    SizedBox(
                      height: height(context) * 0.005,
                    ),
                    GestureDetector(
                      onTap: () => log("Términos"),
                      child: Text(
                        'Términos y Condiciones del servicio',
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
              SizedBox(
                width: width(context),
                height: height(context) * 0.28,
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

Map<String, bool> strengthValues = {"EASY": false, "MEDIUM": false, "HARD": false};
Map<String, bool> passwordVisibility = {"PASSWORD": true, "RPASSWORD": true};

void _updateMap(bool easy, bool medium, bool hard) {
  strengthValues = {"EASY": easy, "MEDIUM": medium, "HARD": hard};
}

void _updatePasswordVisibility(String password) {
  password == "PASSWORD"
      ? passwordVisibility = {"PASSWORD": !passwordVisibility["PASSWORD"]!, "RPASSWORD": passwordVisibility["RPASSWORD"]!}
      : passwordVisibility = {"PASSWORD": passwordVisibility["PASSWORD"]!, "RPASSWORD": !passwordVisibility["RPASSWORD"]!};
}

void _updateContainerColor(Strength strength) {
  switch (strength) {
    case Strength.empty:
      _updateMap(false, false, false);
      break;
    case Strength.easy:
      _updateMap(true, false, false);
      break;
    case Strength.medium:
      _updateMap(true, true, false);
      break;
    case Strength.hard:
      _updateMap(true, true, true);
      break;
  }
}
