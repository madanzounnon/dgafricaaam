import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_app/components/no_account_text.dart';
import 'package:shop_app/screens/entry_point.dart';
import '../../../constants.dart';
import '../../../size_config.dart';
import 'sign_form.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(0)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                    width: double.infinity,
                    height: getProportionateScreenHeight(350),
                    child: Stack(
                      children: [
                        SvgPicture.asset(
                          'assets/icons/back.svg',
                          height: double.infinity,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                        Container(
                            width: double.infinity,
                            height: getProportionateScreenHeight(350),
                            child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                      width: double.infinity,
                                      height:
                                          getProportionateScreenHeight(350) / 2,
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal:
                                                getProportionateScreenWidth(
                                                    80)),
                                        child: SvgPicture.asset(
                                          'assets/icons/logoligth.svg',
                                          height:
                                              getProportionateScreenHeight(50),
                                          width:
                                              getProportionateScreenHeight(50),
                                        ),
                                      )),
                                  Container(
                                      width: double.infinity,
                                      height:
                                          getProportionateScreenHeight(350) / 2,
                                      child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              height:
                                                  getProportionateScreenHeight(
                                                      35),
                                            ),
                                            Text(
                                              "Heureux de vous \n revoir",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize:
                                                    getProportionateScreenWidth(
                                                        25),
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ]))
                                ]))
                      ],
                    )),

                // Text(
                //   "Connectez-vous avec votre e-mail et votre mot de passe ou continuez avec les réseaux sociaux",
                //   textAlign: TextAlign.center,
                // ),
                Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: getProportionateScreenWidth(20)),
                    child: Column(children: [
                      //SizedBox(height: SizeConfig.screenHeight * 0.03),
                      SignForm(),
                      SizedBox(height: getProportionateScreenHeight(20)),
                      NoAccountText(),
                      SizedBox(height: SizeConfig.screenHeight * 0.03),
                      GestureDetector(
                        onTap: () =>
                            Navigator.pushNamed(context, EntryPoint.routeName),
                        child: Text(
                          "Acceder à l'accueil",
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: pPrimaryColor,
                              fontSize: getProportionateScreenWidth(15)),
                        ),
                      )
                    ]))
                /*SizedBox(height: SizeConfig.screenHeight * 0.08),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SocalCard(
                      icon: "assets/icons/google-icon.svg",
                      press: () {},
                    ),
                    SocalCard(
                      icon: "assets/icons/facebook-2.svg",
                      press: () {},
                    ),
                    SocalCard(
                      icon: "assets/icons/twitter.svg",
                      press: () {},
                    ),
                  ],
                ),*/
              ],
            ),
          ),
        ),
      ),
    );
  }
}
