import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/components/default_button.dart';
import 'package:shop_app/components/secondary_button.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/screens/home/components/home_header.dart';
import 'package:shop_app/screens/home/home_screen.dart';
import 'package:shop_app/screens/sign_in/sign_in_screen.dart';
import 'package:shop_app/screens/sign_up/components/Souscrire.dart';
import 'package:shop_app/size_config.dart';

import '../../../helper/keyboard.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child:  SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20),vertical:getProportionateScreenWidth(20) ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //SizedBox(height: SizeConfig.screenHeight * 0.10),
                Image.asset('assets/images/1.png',height:80),
                SizedBox(height: SizeConfig.screenHeight * 0.02), // 4%
                Text("AFB-AM", style: headingStyle),
                Text(
                  "POURSUIVRE VOTRE AVENTURE BOURSIERE",
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.08),
                DefaultButton(
                  text: "S’identifier",
                  press: () {
                      KeyboardUtil.hideKeyboard(context);
                      Navigator.pushNamed(context,SignInScreen.routeName);
                  },
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.04),
                SecondaryButton(
                  textcolor:Colors.white,
                  text: "Ouvrir un compte",
                  backcolor: kPrimaryColor,
                  press: () {
                    KeyboardUtil.hideKeyboard(context);
                    Navigator.pushNamed(context,Souscrire.routeName);
                  },
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.03),
                GestureDetector(
                onTap: () => Navigator.pushNamed(
                    context, HomeScreen.routeName),
                child: Text(
                  "Acceder à l'accueil",
                  style: TextStyle(decoration: TextDecoration.underline,color: pPrimaryColor,fontSize:getProportionateScreenWidth(15)),
                ),
              )
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
