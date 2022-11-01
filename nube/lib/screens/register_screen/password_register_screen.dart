import 'package:flutter/gestures.dart';
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
    log('${user.toJson()}');
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.only(left: width(context) * 0.075, right: width(context) * 0.075),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: width(context),
              height: height(context) * 0.07,
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
              suffixIcon:
                  _rPasswordController.text.isNotEmpty ? (passwordVisibility["RPASSWORD"]! ? Icons.visibility_off_outlined : Icons.visibility_outlined) : null,
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
              onPressed: () async {
                // String code = generateOTP(5);
                // await sendEmail(user.email, user.name, code);
                setState(() {
                  passwordValidator = passwordScreenValidator(_passwordController.text, _rPasswordController.text);
                  _isPasswordErrorVisible = passwordValidator[0];
                  _isRPasswordErrorVisible = passwordValidator[1];
                  if (!_isPasswordErrorVisible && !_isRPasswordErrorVisible) {
                    user.saveUserData(null, null, null, null, null, null, null, _passwordController.text);
                    Navigator.of(context).push(createRoute(const VerificationRegisterScreen()));
                  }
                });
              },
            ),
            SizedBox(
              width: width(context),
              height: height(context) * 0.01,
            ),
            RichText(
              text: TextSpan(
                text: 'Al pulsar sobre ',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontFamily: 'Tw Cen MT Regular',
                  fontSize: 12.0,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 1.0,
                  height: 1.5,
                ),
                children: [
                  TextSpan(
                    text: 'Finalizar ',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontFamily: 'Tw Cen MT Regular',
                      fontSize: 12.0,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.italic,
                      letterSpacing: 1.0,
                      height: 1.5,
                    ),
                  ),
                  TextSpan(
                    text: 'se aceptan los ',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontFamily: 'Tw Cen MT Regular',
                      fontSize: 12.0,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 1.0,
                      height: 1.5,
                    ),
                  ),
                  TextSpan(
                    text: 'Términos y condiciones del servicio',
                    style: TextStyle(
                      color: Theme.of(context).highlightColor,
                      fontFamily: 'Tw Cen MT Regular',
                      fontSize: 12.0,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.0,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        showGeneralDialog(
                          context: context,
                          pageBuilder: (context, animation1, animation2) {
                            return Container();
                          },
                          transitionBuilder: (context, a1, a2, widget) {
                            final curvedValue = Curves.easeInOutBack.transform(a1.value) - 1.0;
                            return Transform(
                              transform: Matrix4.translationValues(0.0, curvedValue * 200, 0.0),
                              child: Opacity(
                                opacity: a1.value,
                                child: Scaffold(
                                  resizeToAvoidBottomInset: true,
                                  backgroundColor: Colors.transparent,
                                  body: Center(
                                    child: Container(
                                      width: width(context) * 0.85,
                                      height: height(context) * 0.85,
                                      color: Theme.of(context).backgroundColor,
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(horizontal: width(context) * 0.035),
                                        child: Column(
                                          children: [
                                            const ClosePopupButton(),
                                            Expanded(
                                              child: SingleChildScrollView(
                                                child: Padding(
                                                  padding: EdgeInsets.only(bottom: height(context) * 0.025),
                                                  child: Text(
                                                    condiciones,
                                                    textAlign: TextAlign.justify,
                                                    style: TextStyle(
                                                      color: Theme.of(context).primaryColor,
                                                      fontFamily: 'Tw Cen MT Regular',
                                                      fontSize: 12.0,
                                                      fontWeight: FontWeight.w500,
                                                      letterSpacing: 1.0,
                                                      height: 2.0,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      },
                  ),
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

String condiciones =
    'Te damos la bienvenida a Instagram. Estas Condiciones de uso ("Condiciones") rigen el uso que haces de Instagram, excepto en los casos en que indiquemos expresamente que se aplican otras condiciones (y no estas), y proporcionan información sobre el servicio de Instagram ("Servicio"), detallado a continuación. Cuando creas una cuenta de Instagram o usas Instagram, aceptas estas condiciones. Las Condiciones del servicio de Meta no se aplican a este Servicio. \nHaz clic aquí para consultar un resumen del contrato y aquí para obtener otra información que el Código Europeo de las Comunicaciones Electrónicas nos exige brindar. \nSi tienes un negocio con sede en la UE y usas la función Comprar en Instagram para vender productos a consumidores ubicados en esta región, puedes revisar el Aviso sobre el reglamento P2B, que complementa nuestras Condiciones de uso, para obtener más información sobre tu relación comercial con nosotros. \nEl Servicio de Instagram es uno de los Productos de Meta que Meta Platforms Ireland Limited te proporciona. Por lo tanto, estas Condiciones de uso constituyen un acuerdo entre tú y Meta Platforms Ireland Limited. \nHaz clic aquí para consultar un resumen del contrato y aquí para obtener otra información que el Código Europeo de las Comunicaciones Electrónicas nos exige brindar. \nSi tienes un negocio con sede en la UE y usas la función "Comprar en Instagram" para vender productos a consumidores ubicados en esta región, puedes revisar el Aviso sobre el reglamento P2B, que complementa nuestras Condiciones de uso, para obtener más información sobre tu relación comercial con nosotros. \n El Servicio de Instagram es uno de los Productos de Meta que Meta Platforms Ireland Limited te proporciona. Por lo tanto, estas Condiciones de uso constituyen un acuerdo entre tú y Meta Platforms Ireland Limited. \nEl Servicio de Instagram\nAceptamos proporcionarte el Servicio de Instagram, que incluye todos los productos, las funciones, las apps, los servicios, las tecnologías y el software que ofrecemos para cumplir la misión de Instagram: acercarte a las personas y cosas que te encantan. El Servicio se compone de los siguientes aspectos:\nOfrecer oportunidades personalizadas para crear, conectar, comunicar, descubrir y compartir.\nCada persona es distinta. Queremos fortalecer las relaciones por medio de experiencias compartidas que realmente te interesen. Por lo tanto, creamos sistemas que intentan entender quiénes o qué cosas te interesan y les interesan a los demás, y usamos esa información para ayudarte a crear, encontrar, unir y compartir experiencias que te resulten relevantes. Parte de esto consiste en destacar el contenido, las funciones, las ofertas y las cuentas que te pueden interesar, y ofrecerte formas de experimentar Instagram en función de lo que tú y otras personas hacen tanto dentro como fuera de Instagram.';
