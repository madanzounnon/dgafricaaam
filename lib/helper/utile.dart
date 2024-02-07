import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kkiapay_flutter_sdk/kkiapay/view/widget_builder_view.dart';
import 'package:kkiapay_flutter_sdk/utils/kkiapayConf.sample.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop_app/constants.dart';

import '../size_config.dart';

class Utile {
  List<String>? user;
  Utile({this.user});

  Future<void> getUser() async {
    final Future<SharedPreferences> _sharedPreferences =
        SharedPreferences.getInstance();
    final SharedPreferences sharedPreferences = await _sharedPreferences;
    user = sharedPreferences.getStringList("abonne");
    //userInfos = sharedPreferences.getStringList("abonne");
  }

  static String formatCurrencit(dynamic valeur) {
    if (valeur != null) {
      var formatter = NumberFormat("#,###.##", 'fr');
      return formatter.format(valeur).toString();
    }
    return "0";
  }

  static void messageSuccess(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message), backgroundColor: kSecondaryColor));
  }

  static void messageErro(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(message),
        backgroundColor: const Color.fromARGB(255, 245, 100, 100)));
  }

  // Get date as a string for display.
  static String getFormattedDate(String date) {
    var localDate = DateTime.parse(date).toLocal();
    var inputFormat = DateFormat('yyyy-MM-dd HH:mm');
    var inputDate = inputFormat.parse(localDate.toString());
    var outputFormat = DateFormat('dd-MM-yyyy à HH:mm');
    var outputDate = outputFormat.format(inputDate);
    return outputDate.toString();
  }

  static Widget preloader() {
    return Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        const CircularProgressIndicator(),
        SizedBox(height: getProportionateScreenWidth(20)),
        const Text('Veuillez patienter SVP, le traitement est en cours')
      ]),
    );
  }

  static Widget isEmpty(String message) {
    return Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Image.asset(
          "assets/images/success.png",
          width: getProportionateScreenWidth(300),
          // height: getProportionateScreenHeight(300),
        ),
        SizedBox(height: getProportionateScreenWidth(30)),
        Padding(
            padding: EdgeInsets.all(getProportionateScreenWidth(20)),
            child: Text(
              message,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: getProportionateScreenWidth(20),
                  color: kPrimaryColor,
                  fontWeight: FontWeight.w700),
            )),
      ]),
    );
  }

  Widget kkiapay(
    void Function(Map<String, dynamic> response, BuildContext context)
        successCallback,
    int amount,
    String data,
    String reason,
  ) {
    return KKiaPay(
        amount: amount,
        countries: const ["BJ"],
        phone: user![2],
        name: user![0],
        email: user![1],
        reason: reason,
        data: data,
        sandbox: true,
        apikey: "ed4abc20b05911ee83820ffb85e01251",
        callback: successCallback,
        theme: "#2d5ca0",
        partnerId: 'AxXxXXxId',
        paymentMethods: const ["momo", "card"]);
  }

  static void loarder(BuildContext context) async {
    showDialog(
        barrierDismissible: false, //Don't close dialog when click outside
        context: context,
        builder: (_) {
          return const Dialog(
            backgroundColor: Colors.white,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 50),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircularProgressIndicator(), //Loading Indicator you can use any graphic
                  SizedBox(
                    height: 20,
                  ),
                  Text('Veuillez patienter SVP')
                ],
              ),
            ),
          );
        });
  }

  void successCallback(response, context) {
    switch (response['status']) {
      case PAYMENT_CANCELLED:
        debugPrint(PAYMENT_CANCELLED);
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(PAYMENT_CANCELLED),
        ));
        break;

      case PENDING_PAYMENT:
        debugPrint(PENDING_PAYMENT);
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(PENDING_PAYMENT),
        ));
        break;

      case PAYMENT_INIT:
        debugPrint(PAYMENT_INIT);
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(PAYMENT_INIT),
        ));
        break;

      case PAYMENT_SUCCESS:
        // addDemandee( response, context, "/paiements", "Liste des paiement");
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(PAYMENT_SUCCESS),
        ));
        break;

      case PAYMENT_FAILED:
        print(PAYMENT_FAILED);
        break;

      default:
        break;
    }
  }
}
