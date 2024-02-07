import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:shop_app/components/custom_surfix_icon.dart';
import 'package:shop_app/components/default_button.dart';
import 'package:shop_app/components/file-upload_button.dart';
import 'package:shop_app/components/secondary_button.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/helper/dropdowninputForm.dart';
import 'package:shop_app/helper/form.dart';
import 'package:shop_app/helper/store.dart';
import 'package:shop_app/helper/utile.dart';
import 'package:shop_app/models/api_error.dart';
import 'package:shop_app/models/country.dart';
import 'package:shop_app/models/login_success.dart';
import 'package:shop_app/screens/country/component/flag_widget.dart';
import 'package:shop_app/screens/country/country_page.dart';
import 'package:shop_app/screens/entry_point.dart';
import 'package:shop_app/screens/securite/securite.dart';
import 'package:shop_app/services/auth.dart';
import 'package:shop_app/size_config.dart';

import '../../../helper/keyboard.dart';

class FirstSouscription extends StatefulWidget {
  @override
  static String routeName = "/firstsouscription";
  @override
  _FirstSouscriptionState createState() => _FirstSouscriptionState();
}

class _FirstSouscriptionState extends State<FirstSouscription> {
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
  TextEditingController cityCtl = TextEditingController();
  TextEditingController countryCtl = TextEditingController();

  TextEditingController mereCtl = TextEditingController();
  TextEditingController pereCtl = TextEditingController();
  TextEditingController birthPlaceCtl = TextEditingController();
  TextEditingController matrimonialCtl = TextEditingController();
  TextEditingController nbrenfantsCtl = TextEditingController();

  TextEditingController idPhotoCtl = TextEditingController();
  TextEditingController zipcodeCtl = TextEditingController();
  TextEditingController adresseCtl = TextEditingController();

  TextEditingController delivreparCtl = TextEditingController();
  TextEditingController delivreaCtl = TextEditingController();
  TextEditingController expireAtCtl = TextEditingController();
  TextEditingController delivreAtCtl = TextEditingController();

  TextEditingController professionCtl = TextEditingController();
  TextEditingController employeurCtl = TextEditingController();
  TextEditingController secteurCtl = TextEditingController();
  TextEditingController adresseemployeurCtl = TextEditingController();
  TextEditingController dateembaucheCtl = TextEditingController();
  //TextEditingController birthPlaceCtl = TextEditingController();

  TextEditingController originefondsCtl = TextEditingController();

  bool remember = false;

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

  @override
  void initState() {
    super.initState();
    dateCtl.text = '';
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
      "city": cityCtl.text.trim(),
      "birthday": dateCtl.text.trim(),
      "password": passwordCtl.text
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
  }

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
                      final isLast = _currentStep == 4;
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
                        title: new Text(''),
                        content: Form(
                            key: _formKey1,
                            child: Column(
                              children: <Widget>[
                                Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    //mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        "Informations personnelles",
                                        style: TextStyle(
                                          fontSize:
                                              getProportionateScreenWidth(20),
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                          height: 1.5,
                                        ),
                                      ),
                                      SizedBox(
                                          height:
                                              getProportionateScreenHeight(20)),
                                      buildFirstNameFormField(),
                                      SizedBox(
                                          height:
                                              getProportionateScreenHeight(20)),
                                      buildLastNameFormField(),
                                      SizedBox(
                                          height:
                                              getProportionateScreenHeight(20)),
                                      inputForm(
                                        controller: pereCtl,
                                        validInput: true,
                                        labeltext: "Nom et prénom de père",
                                      ),
                                      inputForm(
                                        controller: mereCtl,
                                        validInput: true,
                                        labeltext: "Nom et prénom de la mère",
                                      ),
                                      // buildSingleCountry(),
                                      buildCivilite(context),
                                      SizedBox(
                                          height:
                                              getProportionateScreenHeight(20)),
                                      TextFormField(
                                        controller:
                                            dateCtl, //editing controller of this TextField
                                        decoration: InputDecoration(
                                          labelText: "Date de naissance",
                                          hintText: "Entrez date de naissance",
                                          floatingLabelBehavior:
                                              FloatingLabelBehavior.always,
                                          suffixIcon: Padding(
                                              padding: EdgeInsets.only(top: 10),
                                              child: FaIcon(
                                                  FontAwesomeIcons.calendar)),
                                        ),
                                        readOnly:
                                            true, //set it true, so that user will not able to edit text
                                        onTap: () async {
                                          DateTime? pickedDate =
                                              await showDatePicker(
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
                                          height:
                                              getProportionateScreenHeight(20)),
                                      inputForm(
                                        controller: birthPlaceCtl,
                                        validInput: true,
                                        labeltext: "Lieu de naissance",
                                      ),
                                      DropdownButtonFormField(
                                          decoration: InputDecoration(
                                            labelText: "Statut matrimonial",
                                            hintText:
                                                "Selectionnez votre Statut matrimonial",
                                            floatingLabelBehavior:
                                                FloatingLabelBehavior.always,
                                            //suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Bell.svg"),
                                            filled: true,
                                            //fillColor: Colors.blueAccent,
                                          ),
                                          //dropdownColor: Colors.blueAccent,
                                          onChanged: (String? newValue) {
                                            if (newValue!.isNotEmpty) {
                                              removeError(
                                                  error: kcivilitelNullError);
                                            }
                                            setState(() {
                                              matrimonialCtl.text = newValue;
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
                                            DropdownMenuItem(
                                                child: Text("Célibataire"),
                                                value: "Célibataire"),
                                            DropdownMenuItem(
                                                child: Text("Marié(e)"),
                                                value: "Marié(e)"),
                                            DropdownMenuItem(
                                                child: Text("Divorcé(e)"),
                                                value: "Divorcé(e)"),
                                            DropdownMenuItem(
                                                child: Text("Veuf(e)"),
                                                value: "Veuf(e)"),
                                          ]),
                                      SizedBox(
                                          height:
                                              getProportionateScreenHeight(20)),
                                      inputForm(
                                        controller: nbrenfantsCtl,
                                        type: TextInputType.number,
                                        validInput: true,
                                        labeltext: "Nombre d'enfants",
                                      ),
                                    ]),

                                //buildEmailFormField(),
                                //FormError(errors: errors),
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
                        title: new Text(''),
                        content: Form(
                            key: _formKey2,
                            child: Column(
                              children: <Widget>[
                                Text(
                                  "Informations de contact",
                                  style: TextStyle(
                                    fontSize: getProportionateScreenWidth(20),
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    height: 1.5,
                                  ),
                                ),
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
                                    labelText: "Téléphone mobile",
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
                                    labelText: "Téléphone domicile",
                                    hintText: "Entrez votre numéro de fixe",
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
                                buildAddressFormField(),
                                SizedBox(
                                    height: getProportionateScreenHeight(20)),

                                FileUploadButton(
                                  text:
                                      "Selectionnez votre Justificatif de résidence",
                                  press: () {
                                    //Navigator.pushNamed(context,SignInScreen.routeName);
                                  },
                                ),
                                SizedBox(
                                    height: getProportionateScreenHeight(20)),
                                inputForm(
                                  controller: adresseCtl,
                                  validInput: true,
                                  labeltext: "Adresse actuelle",
                                ),
                                inputForm(
                                  controller: zipcodeCtl,
                                  validInput: true,
                                  labeltext: "Code postal",
                                ),

                                // inputForm(
                                //   controller: idPhotoCtl,
                                //   validInput: true,
                                //   labeltext: "photo d'identité",
                                // ),
                              ],
                            )),
                        isActive: _currentStep >= 0,
                        state: _currentStep >= 1
                            ? StepState.complete
                            : StepState.disabled,
                      ),
                      Step(
                        title: new Text(''),
                        content: Form(
                            key: _formKey3,
                            child: Column(
                              children: <Widget>[
                                Text(
                                  "Pièce d'identité",
                                  style: TextStyle(
                                    fontSize: getProportionateScreenWidth(20),
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    height: 1.5,
                                  ),
                                ),
                                SizedBox(
                                    height: getProportionateScreenHeight(10)),
                                FileUploadButton(
                                  text: "Selectionnez votre photo d'identité",
                                  press: () {
                                    //Navigator.pushNamed(context,SignInScreen.routeName);
                                  },
                                ),
                                SizedBox(
                                    height: getProportionateScreenHeight(20)),
                                FileUploadButton(
                                  text: "Selectionnez votre pièce d'identité",
                                  press: () {
                                    //Navigator.pushNamed(context,SignInScreen.routeName);
                                  },
                                ),
                                SizedBox(
                                    height: getProportionateScreenHeight(20)),
                                buildTypepiece(context),
                                SizedBox(
                                    height: getProportionateScreenHeight(20)),
                                buildPieceNumberFormField(),
                                SizedBox(
                                    height: getProportionateScreenHeight(20)),
                                inputForm(
                                  controller: delivreaCtl,
                                  validInput: true,
                                  labeltext: "Délivrée à",
                                ),
                                inputForm(
                                  controller: delivreparCtl,
                                  validInput: true,
                                  labeltext: "Délivrée par",
                                ),
                                TextFormField(
                                  controller:
                                      delivreAtCtl, //editing controller of this TextField
                                  decoration: InputDecoration(
                                    labelText: "Date de délivrance",
                                    hintText:
                                        "Selectionnez la date de délivrance",
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.always,
                                    suffixIcon: Padding(
                                        padding: EdgeInsets.only(top: 10),
                                        child:
                                            FaIcon(FontAwesomeIcons.calendar)),
                                  ),
                                  readOnly:
                                      true, //set it true, so that user will not able to edit text
                                  onTap: () async {
                                    DateTime? pickedDate = await showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime(
                                            2000), //DateTime.now() - not to allow to choose before today.
                                        lastDate: DateTime.now());

                                    if (pickedDate != null) {
                                      print(
                                          pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                                      String formattedDate =
                                          DateFormat('yyyy-MM-dd')
                                              .format(pickedDate);
                                      setState(() {
                                        delivreAtCtl.text =
                                            formattedDate; //set output date to TextField value.
                                      });
                                    } else {
                                      print("Date is not selected");
                                    }
                                  },
                                ),
                                SizedBox(
                                    height: getProportionateScreenHeight(20)),
                                TextFormField(
                                  controller:
                                      expireAtCtl, //editing controller of this TextField
                                  decoration: InputDecoration(
                                    labelText: "Date d'expiration",
                                    hintText: "Selectionnez date d'expiration",
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.always,
                                    suffixIcon: Padding(
                                        padding: EdgeInsets.only(top: 10),
                                        child:
                                            FaIcon(FontAwesomeIcons.calendar)),
                                  ),
                                  readOnly:
                                      true, //set it true, so that user will not able to edit text
                                  onTap: () async {
                                    DateTime? pickedDate = await showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime
                                            .now(), //DateTime.now() - not to allow to choose before today.
                                        lastDate: DateTime(2101));

                                    if (pickedDate != null) {
                                      print(
                                          pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                                      String formattedDate =
                                          DateFormat('yyyy-MM-dd')
                                              .format(pickedDate);
                                      setState(() {
                                        expireAtCtl.text =
                                            formattedDate; //set output date to TextField value.
                                      });
                                    } else {
                                      print("Date is not selected");
                                    }
                                  },
                                ),
                                SizedBox(
                                    height: getProportionateScreenHeight(20)),
                              ],
                            )),
                        isActive: _currentStep >= 0,
                        state: _currentStep >= 2
                            ? StepState.complete
                            : StepState.disabled,
                      ),
                      Step(
                        title: new Text(''),
                        content: Center(
                            child: Form(
                                key: _formKey4,
                                child: Column(
                                  children: <Widget>[
                                    Text(
                                      "Informations professionnelles",
                                      style: TextStyle(
                                        fontSize:
                                            getProportionateScreenWidth(20),
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        height: 1.5,
                                      ),
                                    ),
                                    SizedBox(
                                        height:
                                            getProportionateScreenHeight(20)),
                                    inputForm(
                                      controller: professionCtl,
                                      validInput: true,
                                      labeltext: "Profession",
                                    ),
                                    DropdownButtonFormField(
                                        decoration: InputDecoration(
                                          labelText: "Salaire",
                                          hintText:
                                              "Selectionnez votre tranche",
                                          floatingLabelBehavior:
                                              FloatingLabelBehavior.always,
                                          //suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Bell.svg"),
                                          filled: true,
                                          //fillColor: Colors.blueAccent,
                                        ),
                                        //dropdownColor: Colors.blueAccent,
                                        onChanged: (String? newValue) {
                                          if (newValue!.isNotEmpty) {
                                            removeError(
                                                error: kcivilitelNullError);
                                          }
                                          setState(() {
                                            matrimonialCtl.text = newValue;
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
                                          DropdownMenuItem(
                                              child:
                                                  Text("50.001 F - 100.000 F"),
                                              value: "50.001 F - 100.000 F"),
                                          DropdownMenuItem(
                                              child:
                                                  Text("100.001 F - 150.000 F"),
                                              value: "100.001 F - 150.000 F"),
                                          DropdownMenuItem(
                                              child:
                                                  Text("150.001 F - 200.000 F"),
                                              value: "150.001 F - 200.000 F"),
                                          DropdownMenuItem(
                                              child:
                                                  Text("200.001 F - 250.000 F"),
                                              value: "200.001 F - 250.000 F"),
                                          DropdownMenuItem(
                                              child:
                                                  Text("200.001 F - 250.000 F"),
                                              value: "200.001 F - 250.000 F"),
                                          DropdownMenuItem(
                                              child:
                                                  Text("250.001 F - 300.000 F"),
                                              value: "250.001 F - 300.000 F"),
                                          DropdownMenuItem(
                                              child:
                                                  Text("300.001 F - 350.000 F"),
                                              value: "300.001 F - 350.000 F"),
                                          DropdownMenuItem(
                                              child:
                                                  Text("350.001 F - 400.000 F"),
                                              value: "350.001 F - 400.000 F"),
                                          DropdownMenuItem(
                                              child:
                                                  Text("400.001 F - 450.000 F"),
                                              value: "400.001 F - 450.000 F"),
                                          DropdownMenuItem(
                                              child:
                                                  Text("450.001 F - 500.000 F"),
                                              value: "450.001 F - 500.000 F"),
                                          DropdownMenuItem(
                                              child: Text("Plus de 500.001 F"),
                                              value: "Plus de 500.001 F"),
                                        ]),
                                    SizedBox(
                                        height:
                                            getProportionateScreenHeight(20)),
                                    inputForm(
                                      controller: employeurCtl,
                                      validInput: true,
                                      labeltext: "Employeur",
                                    ),
                                    inputForm(
                                      controller: secteurCtl,
                                      validInput: true,
                                      labeltext: "Secteur",
                                    ),
                                    inputForm(
                                      controller: adresseemployeurCtl,
                                      validInput: true,
                                      labeltext:
                                          "Adresse complète du lieu de travail",
                                    ),
                                    TextFormField(
                                      controller:
                                          dateembaucheCtl, //editing controller of this TextField
                                      decoration: InputDecoration(
                                        labelText: "Date d'embauche",
                                        hintText:
                                            "Selectionnez la date d'embauche",
                                        floatingLabelBehavior:
                                            FloatingLabelBehavior.always,
                                        suffixIcon: Padding(
                                            padding: EdgeInsets.only(top: 10),
                                            child: FaIcon(
                                                FontAwesomeIcons.calendar)),
                                      ),
                                      readOnly:
                                          true, //set it true, so that user will not able to edit text
                                      onTap: () async {
                                        DateTime? pickedDate =
                                            await showDatePicker(
                                                context: context,
                                                initialDate: DateTime.now(),
                                                firstDate: DateTime(
                                                    1970), //DateTime.now() - not to allow to choose before today.
                                                lastDate: DateTime.now());

                                        if (pickedDate != null) {
                                          print(
                                              pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                                          String formattedDate =
                                              DateFormat('yyyy-MM-dd')
                                                  .format(pickedDate);
                                          setState(() {
                                            dateembaucheCtl.text =
                                                formattedDate; //set output date to TextField value.
                                          });
                                        } else {
                                          print("Date is not selected");
                                        }
                                      },
                                    ),
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
                      Step(
                        title: new Text(''),
                        content: Form(
                            key: _formKey5,
                            child: Column(children: <Widget>[
                              Column(children: <Widget>[
                                DropdowninputForm(
                                  controller: originefondsCtl,
                                  labeltext: "Origine des fonds investis",
                                  data: [
                                    "Votre activité professionnelle salariée",
                                    "votre activité professionnelle non salariéeotre activité professionnelle non salariée",
                                    "Autres"
                                  ],
                                )
                              ])
                            ])),
                        isActive: _currentStep >= 0,
                        state: _currentStep >= 4
                            ? StepState.complete
                            : StepState.disabled,
                      ),
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
          if (_formKey1.currentState!.validate()) {
            _formKey1.currentState!.save();
            estvalide = _formKey1.currentState!.validate();
          }
        }
        break;
      case 1:
        {
          if (_formKey2.currentState!.validate()) {
            _formKey1.currentState!.save();
            estvalide = _formKey2.currentState!.validate();
          }
        }
        break;
      case 2:
        {
          if (_formKey3.currentState!.validate()) {
            _formKey3.currentState!.save();
            estvalide = _formKey3.currentState!.validate();
          }
        }
        break;
      case 3:
        {
          if (_formKey4.currentState!.validate()) {
            _formKey4.currentState!.save();
            estvalide = _formKey4.currentState!.validate();
          }
        }
        break;
    }
    return estvalide;
  }

  continued() {
    final islast = _currentStep == 4;
    //validestape(_currentStep);
    //if (validestape(_currentStep)) {
    if (islast) {
      register();
      //setState((() => iscomplete = true));
      print(iscomplete);
    } else {
      _currentStep < 4 ? setState(() => _currentStep += 1) : null;
    }
    //}
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

  TextFormField buildEmailFormField() {
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
      validator: (value) {
        if (value!.isEmpty) {
          return kEmailNullError;
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          return kInvalidEmailError;
        }
        return null;
      },
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
      controller: cityCtl,
      onSaved: (newValue) => cityCtl.text = newValue!,
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
        labelText: "Ville",
        hintText: "Entrez votre ville",
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
              DropdownMenuItem(child: Text("Monsieur"), value: "M."),
              DropdownMenuItem(child: Text("Madame"), value: "Mme"),
              DropdownMenuItem(child: Text("Mademoiselle"), value: "Mdme"),
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
