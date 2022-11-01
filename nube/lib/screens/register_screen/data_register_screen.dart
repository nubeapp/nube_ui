import 'package:nube/widgets/container_country_code_number.dart';

import '../../imports.dart';
import 'package:flutter/material.dart';

class DataRegisterScreen extends StatefulWidget {
  const DataRegisterScreen({Key? key}) : super(key: key);

  @override
  State<DataRegisterScreen> createState() => _DataRegisterScreenState();
}

class _DataRegisterScreenState extends State<DataRegisterScreen> {
  /*
   *  Variables
   */
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _fSurnameController = TextEditingController();
  final TextEditingController _sSurnameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  final FocusNode _usernameFocus = FocusNode();
  final FocusNode _nameFocus = FocusNode();
  final FocusNode _fSurnameFocus = FocusNode();
  final FocusNode _sSurnameFocus = FocusNode();
  final FocusNode _phoneFocus = FocusNode();

  bool _isUsernameErrorVisible = false;
  bool _isNameErrorVisible = false;
  bool _isPhoneErrorVisible = false;

  List<bool> usernameNamePhoneValidator = List.empty();

  @override
  void initState() {
    _usernameController.text = user.getUsername();
    _nameController.text = user.getName();
    _fSurnameController.text = user.getFirstSurname() ?? '';
    _sSurnameController.text = user.getSecondSurname() ?? '';
    _phoneController.text = user.getPhone();
    _usernameFocus.addListener(() {});
    _nameFocus.addListener(() {});
    _fSurnameFocus.addListener(() {});
    _sSurnameFocus.addListener(() {});
    _phoneFocus.addListener(() {});
    super.initState();
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _nameController.dispose();
    _fSurnameController.dispose();
    _sSurnameController.dispose();
    _phoneController.dispose();
    _usernameFocus.dispose();
    _nameFocus.dispose();
    _fSurnameFocus.dispose();
    _sSurnameFocus.dispose();
    _phoneFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: width(context) * 0.075, right: width(context) * 0.075),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: width(context),
                height: height(context) * 0.07,
              ),
              CustomIconButton(
                  icon: Icons.arrow_back_ios_new_rounded,
                  onTap: () {
                    user.saveUserData(null, _usernameController.text, _nameController.text, _fSurnameController.text, _sSurnameController.text,
                        ContainerCountryCodeNumber.countryName, _phoneController.text, null);
                    Navigator.of(context).pop();
                  }),
              SizedBox(
                width: width(context),
                height: height(context) * 0.025,
              ),
              Text(
                'Necesitamos algunos datos más para completar el registro...',
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
                focusNode: _usernameFocus,
                hintText: 'Nombre de usuario',
                keyboardType: TextInputType.text,
                obscureText: false,
                hasError: _isUsernameErrorVisible,
                textInputAction: TextInputAction.done,
                controller: _usernameController,
                onChanged: (value) {
                  setState(() {});
                },
                onPressed: () {
                  resetTextIfNoFocus(_usernameController, _usernameFocus);
                },
                suffixIcon: hideShowIcon(_usernameController, _usernameFocus),
              ),
              SizedBox(
                width: width(context),
                height: height(context) * 0.01,
              ),
              Opacity(
                opacity: _isUsernameErrorVisible ? 1 : 0,
                child: const ErrorMessage(message: "El nombre de usuario es obligatorio"),
              ),
              SizedBox(
                width: width(context),
                height: height(context) * 0.05,
              ),
              InputField(
                focusNode: _nameFocus,
                hintText: 'Nombre',
                hasError: _isNameErrorVisible,
                keyboardType: TextInputType.text,
                obscureText: false,
                textInputAction: TextInputAction.done,
                controller: _nameController,
                onChanged: (value) {
                  setState(() {});
                },
                onPressed: () {
                  resetTextIfNoFocus(_nameController, _nameFocus);
                },
                suffixIcon: hideShowIcon(_nameController, _nameFocus),
              ),
              SizedBox(
                width: width(context),
                height: height(context) * 0.01,
              ),
              Opacity(
                opacity: _isNameErrorVisible ? 1 : 0,
                child: const ErrorMessage(message: 'El nombre es obligatorio'),
              ),
              SizedBox(
                width: width(context),
                height: height(context) * 0.05,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: width(context) * 0.41,
                    height: height(context) * 0.065,
                    child: InputField(
                      focusNode: _fSurnameFocus,
                      hintText: 'Apellido 1',
                      keyboardType: TextInputType.text,
                      obscureText: false,
                      hasError: false,
                      textInputAction: TextInputAction.done,
                      controller: _fSurnameController,
                      onChanged: (value) {
                        setState(() {});
                      },
                      onPressed: () {
                        resetTextIfNoFocus(_fSurnameController, _fSurnameFocus);
                      },
                      suffixIcon: hideShowIcon(_fSurnameController, _fSurnameFocus),
                    ),
                  ),
                  SizedBox(
                    width: width(context) * 0.41,
                    height: height(context) * 0.065,
                    child: InputField(
                      focusNode: _sSurnameFocus,
                      hintText: 'Apellido 2',
                      keyboardType: TextInputType.text,
                      obscureText: false,
                      hasError: false,
                      textInputAction: TextInputAction.done,
                      controller: _sSurnameController,
                      onChanged: (value) {
                        setState(() {});
                      },
                      onPressed: () {
                        resetTextIfNoFocus(_sSurnameController, _sSurnameFocus);
                      },
                      suffixIcon: hideShowIcon(_sSurnameController, _sSurnameFocus),
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: width(context),
                height: height(context) * 0.07,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const ContainerCountryCodeNumber(),
                  SizedBox(
                    width: width(context) * 0.57,
                    height: height(context) * 0.065,
                    child: InputField(
                      focusNode: _phoneFocus,
                      hintText: 'Teléfono móvil',
                      keyboardType: TextInputType.phone,
                      obscureText: false,
                      hasError: _isPhoneErrorVisible,
                      textInputAction: TextInputAction.done,
                      controller: _phoneController,
                      onChanged: (value) {
                        setState(() {});
                      },
                      onPressed: () {
                        resetTextIfNoFocus(_phoneController, _phoneFocus);
                      },
                      suffixIcon: hideShowIcon(_phoneController, _phoneFocus),
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: width(context),
                height: height(context) * 0.01,
              ),
              Row(
                children: [
                  SizedBox(
                    width: width(context) * 0.28,
                    height: height(context) * 0.01,
                  ),
                  Opacity(
                    opacity: _isPhoneErrorVisible ? 1 : 0,
                    child: const ErrorMessage(message: "El teléfono móvil es obligatorio"),
                  ),
                ],
              ),
              SizedBox(
                width: width(context),
                height: height(context) * 0.06,
              ),
              Button(
                text: 'Continuar',
                onPressed: () {
                  setState(() {
                    usernameNamePhoneValidator = dataScreenValidator(_usernameController.text, _nameController.text, _phoneController.text);
                    _isUsernameErrorVisible = usernameNamePhoneValidator[0];
                    _isNameErrorVisible = usernameNamePhoneValidator[1];
                    _isPhoneErrorVisible = usernameNamePhoneValidator[2];
                    if (!_isUsernameErrorVisible && !_isNameErrorVisible && !_isPhoneErrorVisible) {
                      user.saveUserData(null, _usernameController.text, _nameController.text, _fSurnameController.text, _sSurnameController.text,
                          ContainerCountryCodeNumber.countryName, _phoneController.text, null);
                      Navigator.of(context).push(
                        createRoute(
                          const PasswordRegisterScreen(),
                        ),
                      );
                    }
                  });
                },
              ),
              SizedBox(
                width: width(context),
                height: height(context) * 0.06,
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
