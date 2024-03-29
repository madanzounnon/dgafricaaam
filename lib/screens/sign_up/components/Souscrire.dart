import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop_app/components/custom_surfix_icon.dart';
import 'package:shop_app/components/default_button.dart';
import 'package:shop_app/components/secondary_button.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/helper/form.dart';
import 'package:shop_app/helper/store.dart';
import 'package:shop_app/helper/utile.dart';
import 'package:shop_app/models/api_error.dart';
import 'package:shop_app/models/country.dart';
import 'package:shop_app/models/login_success.dart';
import 'package:shop_app/screens/country/component/flag_widget.dart';
import 'package:shop_app/screens/country/country_page.dart';
import 'package:shop_app/screens/entry_point.dart';
import 'package:shop_app/screens/forgot_password/forgot_password_screen.dart';
import 'package:shop_app/screens/securite/securite.dart';
import 'package:shop_app/services/auth.dart';
import 'package:shop_app/size_config.dart';
import 'package:shop_app/components/form_error.dart';

import '../../../helper/keyboard.dart';

class Souscrire extends StatefulWidget {
  @override
  static String routeName = "/souscrire";
  @override
  _SouscrireState createState() => _SouscrireState();
}

class _SouscrireState extends State<Souscrire> {
  Country? country;
  // List<Country> countries = [];
  int? codeEnvoyer;
  bool estEnvoyer = false;

  int _currentStep = 0;
  StepperType stepperType = StepperType.vertical;
  final _formKey1 = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();
  final _formKey3 = GlobalKey<FormState>();
  final _formKey4 = GlobalKey<FormState>();
  final _formKey5 = GlobalKey<FormState>();

  String? firstName = '';
  String? lastName = '';
  String? civilite = null;
  String? address = '';
  TextEditingController dateCtl = TextEditingController();
  DateTime? date = DateTime.now();

  String? email = '';
  String? pays = '';
  bool? termecondition = false;
  bool? modeenvoi = false;
  bool? modeenvoi1 = false;
  String? prefix = '';
  DateTime initialDate = DateTime.now();

  TextEditingController passwordCtl = TextEditingController();
  TextEditingController conform_passwordCtl = TextEditingController();
  TextEditingController usernameCtl = TextEditingController();
  TextEditingController emailCtl = TextEditingController();
  TextEditingController firstnameCtl = TextEditingController();
  TextEditingController lastnameCtl = TextEditingController();
  TextEditingController bithdayCtl = TextEditingController();
  TextEditingController civiliteCtl = TextEditingController();
  TextEditingController telephoneCtl = TextEditingController();
  TextEditingController addressCtl = TextEditingController();
  TextEditingController countryCtl = TextEditingController();
  TextEditingController birthPlaceCtl = TextEditingController();

  bool estphone = false;

  bool remember = false;
  final List<String?> infopass = [
    "au mois 8 caractères",
    "des lettres majuscules et minuscules ",
    "au mois  un chiffre",
    "au mois  un caractère special(@, #, &,...)"
  ];

  TextEditingController code1Ctl = TextEditingController();
  TextEditingController code2Ctl = TextEditingController();
  TextEditingController code3Ctl = TextEditingController();
  TextEditingController code4Ctl = TextEditingController();
  TextEditingController code5Ctl = TextEditingController();

  String? code1 = '';
  String? code2 = '';
  String? code3 = '';
  String? code4 = '';
  String? code5 = '';
  String? codes;
  String? typepiece = null;
  int? numpiece = 0;
  String? photo = '';
  String? pieceidentite = '';
  String? signanture = '';

  bool iscomplete = false;
  FocusNode? pin2FocusNode;
  FocusNode? pin3FocusNode;
  FocusNode? pin4FocusNode;
  FocusNode? pin5FocusNode;

  @override
  void initState() {
    super.initState();
    dateCtl.text = '';
    pin2FocusNode = FocusNode();
    pin3FocusNode = FocusNode();
    pin4FocusNode = FocusNode();
    pin5FocusNode = FocusNode();
    //KeyboardUtil.hideKeyboard(context);
  }

  Future<void> sendCode(String country, String email) async {
    Utile.loarder(context);
    StoreAuth().restoreUser();
    Response res = await Auth().sendVerifyCode(country, email);
    if (res.statusCode == 200) {
      print(res.data);
      setState(() {
        estEnvoyer = res.data["success"];
        codeEnvoyer = res.data["verification_code"];
      });
      print(codeEnvoyer);
      Navigator.of(context).pop();
      KeyboardUtil.hideKeyboard(context);
      // Utile.messageSuccess(context, loginSuccess.message);
    } else {
      Navigator.of(context).pop();
      ApiError apiError = ApiError.fromMap(res.data);
      Utile.messageErro(context, '${apiError.message}');
    }
  }

  Future<void> register() async {
    Utile.loarder(context);

    Map<String, dynamic>? userData = {
      "email": email,
      "country": pays,
      "verification_code": codeEnvoyer,
      "first_name": firstnameCtl.text.trim(),
      "last_name": lastnameCtl.text.trim(),
      "username": usernameCtl.text.trim(),
      "mobile_phone": telephoneCtl.text.trim(),
      "gender": civiliteCtl.text.trim(),
      "city": addressCtl.text.trim(),
      "birthday": dateCtl.text.trim(),
      "password": passwordCtl.text,
      "birth_place": birthPlaceCtl.text.trim(),
    };

    print(userData);

    Response res = await Auth().register(userData);
    if (res.statusCode == 200) {
      Navigator.of(context).pop();
      StoreAuth().restoreUser();
      LoginSuccess loginSuccess = LoginSuccess.fromMap(res.data);
      StoreAuth().saveUser(loginSuccess.user);
      StoreAuth().saveToken(loginSuccess.token);
      Navigator.of(context).pop();
      KeyboardUtil.hideKeyboard(context);
      Navigator.pushReplacementNamed(context, EntryPoint.routeName);
      Utile.messageSuccess(context, "Votre compte a été créé avec succès");
    } else {
      Navigator.of(context).pop();
      ApiError apiError = ApiError.fromMap(res.data);
      Utile.messageErro(context, '${apiError.message}');
    }
  }

  @override
  void dispose() {
    super.dispose();
    pin2FocusNode!.dispose();
    pin3FocusNode!.dispose();
    pin4FocusNode!.dispose();
    pin5FocusNode!.dispose();
  }

  /*bool _obscureText = true;
  // Toggles the password show status
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }*/

  Future<void> _showDate(BuildContext context) async {
    showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(1978),
      lastDate: DateTime(2023),
    ).then((value) => {
          if (value != null)
            {
              setState(() {
                initialDate = value;
              })
            }
        });
  }

  Future<void> _selectDate(BuildContext context) async {
    final now = DateTime.now();
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: date ?? now,
        firstDate: DateTime(1920),
        lastDate: DateTime(2003));
    if (picked != null && picked != date) {
      //print('hello $picked');
      setState(() {
        date = picked;
      });
    }
  }

  void nextField(String value, FocusNode? focusNode) {
    if (value.length == 1) {
      focusNode!.requestFocus();
    }
  }

  final List<String?> errors = [];

  void addError({String? error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String? error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /* appBar: AppBar(
          automaticallyImplyLeading: false,
            title: Text('Flutter Stepper Demo'),
          centerTitle: true,
        ),*/
      body: iscomplete
          ? sucess()
          : SafeArea(
              child: Column(children: [
                Expanded(
                  child: Stepper(
                    type: StepperType.horizontal,
                    physics: ScrollPhysics(),
                    currentStep: _currentStep,
                    onStepTapped: (step) => tapped(step),
                    onStepContinue: continued,
                    onStepCancel: cancel,
                    controlsBuilder:
                        (BuildContext context, ControlsDetails details) {
                      final isLast = _currentStep == 3;
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          SecondaryButton(
                            textcolor: Colors.white,
                            text: isLast ? 'Enregistrer' : 'Continuer',
                            backcolor: pPrimaryColor,
                            press: details.onStepContinue,
                          ),
                          SizedBox(height: getProportionateScreenHeight(20)),
                          if (_currentStep > 0)
                            SecondaryButton(
                              textcolor: Colors.white,
                              text: 'Retourner',
                              backcolor: kPrimaryColor,
                              press: details.onStepCancel,
                            ),
                        ],
                      );
                    },
                    steps: <Step>[
                      Step(
                        title: new Text('CT'),
                        content: Form(
                            key: _formKey1,
                            child: Column(
                              children: <Widget>[
                                Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    //mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                        alignment: Alignment.center,
                                        padding: EdgeInsets.symmetric(
                                            horizontal:
                                                getProportionateScreenWidth(
                                                    50)),
                                        child: SvgPicture.asset(
                                          'assets/icons/simplelogo.svg',
                                          height:
                                              getProportionateScreenHeight(100),
                                          width:
                                              getProportionateScreenHeight(100),
                                        ),
                                      ),
                                      //SizedBox(height: getProportionateScreenHeight(20)),
                                      Text(
                                        "Merci de nous \n rejoindre",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize:
                                              getProportionateScreenWidth(28),
                                          color: pPrimaryColor,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(
                                          height:
                                              getProportionateScreenHeight(10)),
                                      Text(
                                          "Veuillez fournir les informations \n ci-dessous.",
                                          textAlign: TextAlign.center),
                                    ]),
                                buildSingleCountry(),
                                SizedBox(
                                    height: getProportionateScreenHeight(20)),
                                buildEmailFormField(estphone),
                                FormError(errors: errors),
                                SizedBox(
                                    height: getProportionateScreenHeight(20)),
                              ],
                            )),
                        isActive: _currentStep >= 0,
                        state: _currentStep >= 0
                            ? StepState.complete
                            : StepState.disabled,
                      ),
                      Step(
                        title: new Text('OTP'),
                        content: Form(
                            key: _formKey2,
                            child: Column(
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal:
                                          getProportionateScreenWidth(45)),
                                  child: Image.asset(
                                    'assets/images/phoneopt.png',
                                    height: getProportionateScreenHeight(170),
                                    width: getProportionateScreenHeight(170),
                                  ),
                                ),
                                SizedBox(
                                    height: SizeConfig.screenHeight * 0.04),
                                Text("Veuillez insérer le code envoyé à",
                                    textAlign: TextAlign.center),
                                Text(
                                  " $email ",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: pPrimaryColor,
                                      fontWeight: FontWeight.bold),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("Ce code expirera dans  15min "),
                                    TweenAnimationBuilder(
                                      tween: Tween(begin: 15, end: 0.0),
                                      duration: Duration(minutes: 15),
                                      builder: (_, dynamic value, child) =>
                                          Text(
                                        "00:${value.toInt()}",
                                        style: TextStyle(color: pPrimaryColor),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                    height: SizeConfig.screenHeight * 0.01),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: getProportionateScreenWidth(45),
                                      child: TextFormField(
                                        controller: code1Ctl,
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return "oop";
                                          }
                                          return null;
                                        },
                                        autofocus: true,
                                        obscureText: true,
                                        style: TextStyle(fontSize: 24),
                                        keyboardType: TextInputType.number,
                                        textAlign: TextAlign.center,
                                        decoration: otpInputDecoration,
                                        maxLength: 1,
                                        onChanged: (value) {
                                          code1 = value;
                                          nextField(value, pin2FocusNode);
                                        },
                                      ),
                                    ),
                                    SizedBox(
                                      width: getProportionateScreenWidth(45),
                                      child: TextFormField(
                                          controller: code2Ctl,
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return "oop";
                                            }
                                            return null;
                                          },
                                          focusNode: pin2FocusNode,
                                          maxLength: 1,
                                          obscureText: true,
                                          style: TextStyle(fontSize: 24),
                                          keyboardType: TextInputType.number,
                                          textAlign: TextAlign.center,
                                          decoration: otpInputDecoration,
                                          onChanged: (value) {
                                            code2 = value;
                                            nextField(value, pin3FocusNode);
                                          }),
                                    ),
                                    SizedBox(
                                      width: getProportionateScreenWidth(45),
                                      child: TextFormField(
                                        controller: code3Ctl,
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return "oop";
                                          }
                                          return null;
                                        },
                                        focusNode: pin3FocusNode,
                                        maxLength: 1,
                                        obscureText: true,
                                        style: TextStyle(fontSize: 24),
                                        keyboardType: TextInputType.number,
                                        textAlign: TextAlign.center,
                                        decoration: otpInputDecoration,
                                        onChanged: (value) {
                                          code3 = value;
                                          nextField(value, pin4FocusNode);
                                        },
                                      ),
                                    ),
                                    SizedBox(
                                      width: getProportionateScreenWidth(45),
                                      child: TextFormField(
                                        controller: code4Ctl,
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return "oop";
                                          }
                                          return null;
                                        },
                                        focusNode: pin4FocusNode,
                                        maxLength: 1,
                                        obscureText: true,
                                        style: TextStyle(fontSize: 24),
                                        keyboardType: TextInputType.number,
                                        textAlign: TextAlign.center,
                                        decoration: otpInputDecoration,
                                        onChanged: (value) {
                                          code4 = value;
                                          nextField(value, pin5FocusNode);
                                        },
                                      ),
                                    ),
                                    SizedBox(
                                      width: getProportionateScreenWidth(45),
                                      child: TextFormField(
                                        controller: code5Ctl,
                                        focusNode: pin5FocusNode,
                                        obscureText: true,
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return "oop";
                                          }
                                          return null;
                                        },
                                        style: TextStyle(fontSize: 24),
                                        maxLength: 1,
                                        keyboardType: TextInputType.number,
                                        textAlign: TextAlign.center,
                                        decoration: otpInputDecoration,
                                        onChanged: (value) {
                                          if (value.length == 1) {
                                            code5 = value;
                                            // Then you need to check is the code is correct or not
                                          }
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                    height: SizeConfig.screenHeight * 0.01),
                                GestureDetector(
                                  onTap: () {
                                    // OTP code resend
                                  },
                                  child: Text(
                                    "Renvoyer un nouveau code",
                                    style: TextStyle(
                                        color: pPrimaryColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                SizedBox(
                                    height: getProportionateScreenHeight(20)),
                                FormError(errors: errors)
                              ],
                            )),
                        isActive: _currentStep >= 0,
                        state: _currentStep >= 1
                            ? StepState.complete
                            : StepState.disabled,
                      ),
                      Step(
                        title: new Text('IP'),
                        content: Form(
                            key: _formKey3,
                            child: Column(
                              children: <Widget>[
                                //Image.asset('assets/icons/Image8.png',height:50),
                                Text(
                                  "Encore un petit effort !",
                                  style: headingStyle,
                                ),
                                // Text(
                                //     "Veuillez renseigner vos informations personnelles.",
                                //     textAlign: TextAlign.center),

                                SizedBox(
                                    height: getProportionateScreenHeight(20)),
                                buildCivilite(context),
                                SizedBox(
                                    height: getProportionateScreenHeight(20)),
                                buildFirstNameFormField(),
                                SizedBox(
                                    height: getProportionateScreenHeight(20)),
                                buildLastNameFormField(),
                                SizedBox(
                                    height: getProportionateScreenHeight(20)),
                                IntlPhoneField(
                                  //controller: telephoneCtl,
                                  onSaved: (newValue) => telephoneCtl.text =
                                      newValue!.completeNumber,
                                  showCountryFlag: true,
                                  dropdownIcon: const Icon(
                                    Icons.arrow_drop_down,
                                    color: Colors.grey,
                                  ),
                                  decoration: const InputDecoration(
                                    labelText: "Numéro de téléphone",
                                    hintText:
                                        "Entrez votre numéro de téléphone",
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.always,
                                    filled: false,
                                    suffixIcon: Icon(FontAwesomeIcons.phone),
                                  ),
                                  initialCountryCode: 'BJ',
                                  onChanged: (text) => setState(() {
                                    if (text.isValidNumber()) {
                                      telephoneCtl.text = text.number;
                                    }
                                  }),
                                ),
                                // SizedBox(
                                //     height: getProportionateScreenHeight(20)),
                                TextFormField(
                                  controller:
                                      dateCtl, //editing controller of this TextField
                                  decoration: InputDecoration(
                                      labelText: "Date de naissance",
                                      hintText: "Entrez date de naissance",
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.always,
                                      suffixIcon:
                                          FaIcon(FontAwesomeIcons.calendar)),
                                  readOnly:
                                      true, //set it true, so that user will not able to edit text
                                  onTap: () async {
                                    DateTime? pickedDate = await showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime(
                                            2000), //DateTime.now() - not to allow to choose before today.
                                        lastDate: DateTime(2101));

                                    if (pickedDate != null) {
                                      print(
                                          pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                                      String formattedDate =
                                          DateFormat('yyyy-MM-dd')
                                              .format(pickedDate);
                                      print(
                                          formattedDate); //formatted date output using intl package =>  2021-03-16
                                      //you can implement different kind of Date Format here according to your requirement
                                      setState(() {
                                        dateCtl.text =
                                            formattedDate; //set output date to TextField value.
                                      });
                                    } else {
                                      print("Date is not selected");
                                    }
                                  },
                                ),
                                SizedBox(
                                    height: getProportionateScreenHeight(20)),
                                inputForm(
                                  controller: birthPlaceCtl,
                                  validInput: true,
                                  labeltext: "Lieu de naissance",
                                ),
                                buildAddressFormField(),
                                SizedBox(
                                    height: getProportionateScreenHeight(30)),
                                //FormError(errors: errors)
                              ],
                            )),
                        isActive: _currentStep >= 0,
                        state: _currentStep >= 2
                            ? StepState.complete
                            : StepState.disabled,
                      ),
                      Step(
                        title: new Text('MP'),
                        content: Center(
                            child: Form(
                                key: _formKey4,
                                child: Column(
                                  children: <Widget>[
                                    Column(
                                        //crossAxisAlignment: CrossAxisAlignment.center,
                                        //mainAxisAlignment: MainAxisAlignment.center,
                                        children: <Widget>[
                                          Text(
                                            "Definir votre mot de passe et\nvotre nom utilisateur",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize:
                                                  getProportionateScreenWidth(
                                                      18),
                                              color: pPrimaryColor,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(
                                              height:
                                                  getProportionateScreenHeight(
                                                      10)),
                                          //Text("Veuillez fournir les informations \n ci-dessous.", textAlign:TextAlign.center),
                                        ]),
                                    inputForm(
                                      controller: usernameCtl,
                                      validInput: true,
                                      labeltext: "Nom d'utilisateur",
                                    ),

                                    buildPasswordFormField(),
                                    SizedBox(
                                        height:
                                            getProportionateScreenHeight(20)),
                                    buildConformPassFormField(),
                                    SizedBox(
                                        height:
                                            getProportionateScreenHeight(20)),
                                    Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Votre mot de passe doit comporter:",
                                            style: TextStyle(
                                                color: pPrimaryColor,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                              height:
                                                  getProportionateScreenHeight(
                                                      10)),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              SvgPicture.asset(
                                                "assets/icons/Error.svg",
                                                height:
                                                    getProportionateScreenWidth(
                                                        15),
                                                width:
                                                    getProportionateScreenWidth(
                                                        15),
                                              ),
                                              SizedBox(
                                                width:
                                                    getProportionateScreenWidth(
                                                        10),
                                              ),
                                              Text("au mois "),
                                              Text(
                                                "8 caractères",
                                                style: TextStyle(
                                                    color: kPrimaryColor),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                              height:
                                                  getProportionateScreenHeight(
                                                      7)),
                                          Row(
                                            children: [
                                              SvgPicture.asset(
                                                "assets/icons/Error.svg",
                                                height:
                                                    getProportionateScreenWidth(
                                                        15),
                                                width:
                                                    getProportionateScreenWidth(
                                                        15),
                                              ),
                                              SizedBox(
                                                width:
                                                    getProportionateScreenWidth(
                                                        10),
                                              ),
                                              Text("des lettres "),
                                              Text(
                                                "majuscules et minuscules ",
                                                style: TextStyle(
                                                    color: kPrimaryColor),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                              height:
                                                  getProportionateScreenHeight(
                                                      7)),
                                          Row(
                                            children: [
                                              SvgPicture.asset(
                                                "assets/icons/Error.svg",
                                                height:
                                                    getProportionateScreenWidth(
                                                        15),
                                                width:
                                                    getProportionateScreenWidth(
                                                        15),
                                              ),
                                              SizedBox(
                                                width:
                                                    getProportionateScreenWidth(
                                                        10),
                                              ),
                                              Text("au mois "),
                                              Text(
                                                "un chiffre",
                                                style: TextStyle(
                                                    color: kPrimaryColor),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                              height:
                                                  getProportionateScreenHeight(
                                                      7)),
                                          Row(
                                            children: [
                                              SvgPicture.asset(
                                                "assets/icons/Error.svg",
                                                height:
                                                    getProportionateScreenWidth(
                                                        15),
                                                width:
                                                    getProportionateScreenWidth(
                                                        15),
                                              ),
                                              SizedBox(
                                                width:
                                                    getProportionateScreenWidth(
                                                        10),
                                              ),
                                              Text("au mois "),
                                              Text(
                                                "un caractère special(@, #, &,...)",
                                                style: TextStyle(
                                                    color: kPrimaryColor),
                                              ),
                                            ],
                                          ),
                                        ]),
                                    SizedBox(
                                        height:
                                            getProportionateScreenHeight(20)),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Checkbox(
                                          value: termecondition,
                                          activeColor: pPrimaryColor,
                                          onChanged: (value) {
                                            setState(() {
                                              termecondition = value;
                                            });
                                          },
                                        ),
                                        Expanded(
                                            child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              "J’ai lu et accepté ",
                                              style: TextStyle(
                                                  fontSize:
                                                      getProportionateScreenWidth(
                                                          15)),
                                            ),
                                            GestureDetector(
                                              onTap: () => Navigator.pushNamed(
                                                  context,
                                                  ForgotPasswordScreen
                                                      .routeName),
                                              child: Text(
                                                "les termes et conditions générales.",
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    color: pPrimaryColor,
                                                    fontSize:
                                                        getProportionateScreenWidth(
                                                            15)),
                                              ),
                                            )
                                          ],
                                        ))
                                      ],
                                    ),

                                    /// FormError(errors: errors),
                                    SizedBox(
                                        height:
                                            getProportionateScreenHeight(20)),
                                  ],
                                ))),
                        isActive: _currentStep >= 0,
                        state: _currentStep >= 3
                            ? StepState.complete
                            : StepState.disabled,
                      ),
                      /*Step(
                      title: new Text('DC'),
                      content: Form(
                        key: _formKey5,
                        child:Column(
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                            Column(
                            mainAxisAlignment: MainAxisAlignment.center,  
                            children: <Widget>[
                              Image.asset('assets/icons/Image8.png',height:50),
                              Text("Veuillez renseigner les informations de votre pièce d'identité.", textAlign:TextAlign.center),
                            ]
                          ),
                           SizedBox(height: getProportionateScreenHeight(35)),
                            //DropdownItems(),
                            buildTypepiece(context),
                            SizedBox(height: getProportionateScreenHeight(20)),
                            buildPieceNumberFormField(),
                            SizedBox(height: getProportionateScreenHeight(20)),
                             
                            FileUploadButton(
                              text: "Selectionnez votre pièce d'identité",
                              press: () {
                                //Navigator.pushNamed(context,SignInScreen.routeName);
                            },
                            ),
                            SizedBox(height: getProportionateScreenHeight(20)),
                              FileUploadButton(
                              text: "Selectionnez votre photo",
                              press: () {
                                //Navigator.pushNamed(context,SignInScreen.routeName);
                            },
                            ),
                            SizedBox(height: getProportionateScreenHeight(20)),
                              FileUploadButton(
                              text: "Selectionnez votre signanture",
                              press: () {
                                //Navigator.pushNamed(context,SignInScreen.routeName);
                            },
                            ),
                            SizedBox(height: SizeConfig.screenHeight * 0.04),
                            //SizedBox(height: getProportionateScreenHeight(30)),
                            FormError(errors: errors)
                          ] )
                          
                        ]
                      )),
                      isActive:_currentStep >= 0,
                      state: _currentStep >= 4?
                      StepState.complete : StepState.disabled,
                    ),*/
                    ],
                  ),
                ),
              ]),
            ),
    );
  }

  switchStepsType() {
    setState(() => stepperType == StepperType.vertical
        ? stepperType = StepperType.horizontal
        : stepperType = StepperType.vertical);
  }

  tapped(int step) {
    validestape(_currentStep);
    setState(() => _currentStep = step);
    //print(errors);
  }

  bool validestape(int current) {
    bool estvalide = false;
    switch (current) {
      case 0:
        {
          //print(current);
          if (email != null && pays != null) {
            print(email);
            print(pays);
            print(codeEnvoyer);
            print(estEnvoyer);
            if (_formKey1.currentState!.validate()) {
              _formKey1.currentState!.save();
              sendCode(pays!, email!);
              estvalide = _formKey1.currentState!.validate();
            }
          }
        }
        break;
      case 1:
        {
          if (_formKey2.currentState!.validate()) {
            codes = "$code1$code2$code3$code4$code5";
            print("$code1$code2$code3$code4$code5");
            print(codeEnvoyer.toString().length);
            print(codes!.length);
            print(codes!.compareTo(codeEnvoyer.toString()));
            print(codes!.trim() == codeEnvoyer.toString().trim());
            if (codes!.compareTo(codeEnvoyer.toString()) == 0) {
              estvalide = _formKey2.currentState!.validate();
            } else {
              Utile.messageErro(context, "Le code est incorrect");
            }
          }
        }
        break;
      case 2:
        {
          if (_formKey3.currentState!.validate()) {
            _formKey3.currentState!.save();
          }
          estvalide = _formKey3.currentState!.validate();
        }
        break;
      case 3:
        {
          if (_formKey4.currentState!.validate()) {
            _formKey4.currentState!.save();
          }
          estvalide = _formKey4.currentState!.validate();
        }
        break;
    }
    return estvalide;
  }

  continued() {
    final islast = _currentStep == 3;
    //validestape(_currentStep);
    if (validestape(_currentStep)) {
      for (var i = 0; i < errors.length; i++) {
        errors.clear();
      }
      if (islast) {
        register();
        //setState((() => iscomplete = true));
        print(iscomplete);
      } else {
        _currentStep < 3 ? setState(() => _currentStep += 1) : null;
      }
    }
  }

  cancel() {
    for (var i = 0; i < errors.length; i++) {
      errors.clear();
    }
    _currentStep > 0 ? setState(() => _currentStep -= 1) : null;
  }

  TextFormField buildConformPassFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => conform_passwordCtl!.text = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (value.isNotEmpty &&
            passwordCtl!.text.trim() == conform_passwordCtl!.text.trim()) {
          removeError(error: kMatchPassError);
        }
        conform_passwordCtl!.text = value;
      },
      validator: (value) {
        if (value!.isEmpty) {
          return kPassNullError;
        } else if ((passwordCtl!.text.trim() != value)) {
          return kMatchPassError;
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Confirmez le mot de passe",
        hintText: "Entrez à nouveau votre mot de passe",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      controller: passwordCtl,
      obscureText: true,
      onSaved: (newValue) => passwordCtl!.text = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (value.length >= 8) {
          removeError(error: kShortPassError);
        }
        passwordCtl.text = value;
      },
      validator: (value) {
        if (value!.isEmpty) {
          return kPassNullError;
        } else if (value.length < 8) {
          return kShortPassError;
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Mot de passe",
        hintText: "Tapez votre mot de passe",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
    );
  }

  TextFormField buildEmailFormField(bool estphone) {
    return TextFormField(
      controller: emailCtl,
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue,
      onChanged: (value) {
        email = value;
        if (value.isNotEmpty) {
          removeError(error: kEmailNullError);
        } else if (emailValidatorRegExp.hasMatch(value)) {
          removeError(error: kInvalidEmailError);
        }
        email = value;
        return null;
      },
      validator: (estphone == false)
          ? (value) {
              if (value!.isEmpty) {
                return kEmailNullError;
              } else if (!emailValidatorRegExp.hasMatch(value)) {
                return kInvalidEmailError;
              }
              return null;
            }
          : null,
      decoration: InputDecoration(
        labelText: "E-mail",
        hintText: "Entrer votre Email",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg"),
      ),
    );
  }

  TextFormField buildAddressFormField() {
    return TextFormField(
      controller: addressCtl,
      onSaved: (newValue) => addressCtl.text = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty) {
          address = value;
          removeError(error: kAddressNullError);
        }
        address = value;
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          return kAddressNullError;
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Adresse",
        hintText: "Entrez votre adresse",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon:
            CustomSurffixIcon(svgIcon: "assets/icons/Location point.svg"),
      ),
    );
  }

  TextFormField buildPieceNumberFormField() {
    return TextFormField(
      keyboardType: TextInputType.number,
      onSaved: (newValue) => numpiece = newValue as int,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPieceNumberNullError);
        }
        numpiece = value as int;
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          return kPieceNumberNullError;
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Numéro de la pièce",
        hintText: "Entrez votre numéro de la pièce",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Phone.svg"),
      ),
    );
  }

  TextFormField buildLastNameFormField() {
    return TextFormField(
      controller: lastnameCtl,
      onSaved: (newValue) => lastnameCtl.text = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kNamelNullError);
        }
        lastName = value;
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          return kNamelNullError;
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Nom",
        hintText: "Entrez votre nom",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
      ),
    );
  }

  TextFormField buildDateNaiFormField() {
    return TextFormField(
      keyboardType: TextInputType.datetime,
      controller: dateCtl,
      onSaved: (newValue) => initialDate = (newValue as DateTime?)!,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kDateNailNullError);
        }
        initialDate = value as DateTime;
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          return kDateNailNullError;
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Date de naissance",
        hintText: "Entrez date de naissance",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Padding(
            padding: EdgeInsets.fromLTRB(
              getProportionateScreenWidth(20),
              getProportionateScreenWidth(20),
              getProportionateScreenWidth(3),
              getProportionateScreenWidth(20),
            ),
            child: FaIcon(FontAwesomeIcons.calendar)),
        //CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
      ),
      //onTap:(() => _showDate(context)),
      onTap: () async {
        await _showDate(context);
      },
    );
  }

  TextFormField buildFirstNameFormField() {
    return TextFormField(
      controller: firstnameCtl,
      onSaved: (newValue) => firstName = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kFirstNamelNullError);
        }
        firstName = value;
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          return kFirstNamelNullError;
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Prénom(s)",
        hintText: "Entrez vos prénoms",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
      ),
    );
  }

  Widget buildSingleCountry() {
    final onTap = () async {
      final country = await Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => CountryPage()),
      );

      if (country == null) return;

      setState(() {
        this.country = country;
        var pre = country.prefix;
        this.prefix = '+$pre';
        this.pays = this.country!.name;
        countryCtl.text = country!.name;
      });
    };
    return buildCountryPicker(
      title: 'Selectionnez le pays',
      child: country == null
          ? buildListTile(title: 'Selectionnez le pays', onTap: onTap)
          : buildListTile(
              title: country!.name,
              leading: FlagWidget(code: country!.code),
              onTap: onTap,
            ),
    );
  }

  bool isDetailComplete() {
    if (_currentStep == 0) {
      if (telephoneCtl.text.isEmpty ||
          email!.isEmpty ||
          pays!.isEmpty ||
          !emailValidatorRegExp.hasMatch(email!)) {
        return false;
      } else {
        return true; //if all fields are not empty
      }
    } else if (_currentStep == 1) {
      codes = "$code1$code2$code2$code4";
      //check receiver fields
      if (code1!.isEmpty ||
          code2!.isEmpty ||
          code3!.isEmpty ||
          code4!.isEmpty ||
          codes!.length != 4) {
        return false;
      } else {
        return true;
      }
    } else if (_currentStep == 2) {
      if (lastName!.isEmpty ||
          firstName!.isEmpty ||
          civilite!.isEmpty ||
          address!.isEmpty) {
        return false;
      } else {
        return true;
      }
    } else if (_currentStep == 3) {
      if (typepiece!.isEmpty) {
        return false;
      } else {
        return true;
      }
    }
    return false;
  }

  /* Widget buildMultipleCountry() {
    final countriesText = countries.map((country) => country.name).join(', ');
    final onTap = () async {
      final countries = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => CountryPage(
                  isMultiSelection: true,
                  countries: List.of(this.countries),
                )),
      );

      if (countries == null) return;

      setState(() => this.countries = countries);
    };

    return buildCountryPicker(
      title: 'Select Countries',
      child: countries.isEmpty
          ? buildListTile(title: 'No Countries', onTap: onTap)
          : buildListTile(title: countriesText, onTap: onTap),
    );
  }
*/
  Widget buildListTile({
    required String title,
    required VoidCallback onTap,
    Widget? leading,
  }) {
    return ListTile(
      onTap: onTap,
      leading: leading,
      title: Text(
        title,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(color: Colors.black, fontSize: 18),
      ),
      trailing: Icon(Icons.arrow_drop_down, color: Colors.black),
    );
  }

  Widget buildCountryPicker({
    required String title,
    required Widget child,
  }) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          Card(
              margin: EdgeInsets.zero,
              child: child,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)))),
        ],
      );
  Widget buildCivilite(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        DropdownButtonFormField(
            decoration: InputDecoration(
              labelText: "civilité",
              hintText: "Selectionnez votre civilité",
              floatingLabelBehavior: FloatingLabelBehavior.always,
              //suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Bell.svg"),
              filled: true,
              //fillColor: Colors.blueAccent,
            ),
            //dropdownColor: Colors.blueAccent,
            value: civilite,
            onChanged: (String? newValue) {
              if (newValue!.isNotEmpty) {
                removeError(error: kcivilitelNullError);
              }
              setState(() {
                civiliteCtl.text = newValue;
              });
              //civilite = newValue;
            },
            validator: (value) {
              if (value == null) {
                return kcivilitelNullError;
              }
              return null;
            },
            items: [
              DropdownMenuItem(child: Text("Masculin"), value: "Male"),
              DropdownMenuItem(child: Text("Féminim"), value: "Female"),
              // DropdownMenuItem(child: Text("Mademoiselle"), value: "Mdme"),
            ])
      ],
    );
  }

  Widget buildTypepiece(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        DropdownButtonFormField(
            decoration: InputDecoration(
              labelText: "Type de pièce",
              hintText: "Selectionnez le type de pièce",
              floatingLabelBehavior: FloatingLabelBehavior.always,
              //suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Bell.svg"),
              filled: true,
              //fillColor: Colors.blueAccent,
            ),
            //dropdownColor: Colors.blueAccent,
            value: typepiece,
            onChanged: (String? newValue) {
              if (newValue!.isNotEmpty) {
                removeError(error: KtypepiecelNullError);
              }
              setState(() {
                typepiece = newValue;
              });
            },
            validator: (value) {
              if (value == null) {
                return KtypepiecelNullError;
              }
              return null;
            },
            items: [
              DropdownMenuItem(child: Text("CIP"), value: "CIP."),
              DropdownMenuItem(
                  child: Text("Pièce d'identité national"),
                  value: "Pièce d'identité national"),
              DropdownMenuItem(
                  child: Text("Carte Biométrique"), value: "Carte Biométrique"),
              DropdownMenuItem(child: Text("Passport"), value: "Passport"),
            ])
      ],
    );
  }

  Widget sucess() {
    return Column(
      children: [
        SizedBox(height: SizeConfig.screenHeight * 0.06),
        Image.asset(
          "assets/images/success.png",
          height: SizeConfig.screenHeight * 0.4, //40%
        ),
        SizedBox(height: SizeConfig.screenHeight * 0.08),
        Text(
          "Felicitaions!",
          style: TextStyle(
            fontSize: getProportionateScreenWidth(30),
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        Spacer(),
        SizedBox(
          width: SizeConfig.screenWidth * 0.8,
          child: DefaultButton(
            text: "Sécurisez mon compte",
            press: () {
              Navigator.pushReplacementNamed(context, SecuritePage.routeName);
            },
          ),
        ),
        Spacer(),
      ],
    );
  }
}
