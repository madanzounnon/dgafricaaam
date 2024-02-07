import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_app/components/default_button.dart';
import 'package:shop_app/components/secondary_button.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/screens/sign_up/sign_up_screen.dart';
import 'package:shop_app/screens/transactions/transaction_screen.dart';

import '../../../size_config.dart';

class DiscountBanner extends StatelessWidget {
  const DiscountBanner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height:getProportionateScreenWidth(300),
      width: double.infinity,
      //margin: EdgeInsets.all(getProportionateScreenWidth(20)),
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(20),
        vertical: getProportionateScreenWidth(15),
      ),
      decoration: BoxDecoration(
        color:pPrimaryColor,
         borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
       // borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment : MainAxisAlignment.start,
        children: [
          Container(
            child:Padding(
              padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(70),vertical: getProportionateScreenHeight(20)),
              child: SvgPicture.asset(
                'assets/images/Logo_Logo_inverse.svg',
                  height:getProportionateScreenHeight(50),
                  width: getProportionateScreenHeight(50),
              ),
            )
          ),
          Expanded(child:
            Text.rich(
              TextSpan(
                style: TextStyle(color: Colors.white),
                children: [
                  TextSpan(text: "Offres du mois\n"),
                  TextSpan(
                    text: "Epargne Action  ",
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(23),
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  TextSpan(text: "Recommandé\n",style:TextStyle(color: Color.fromRGBO(30, 200, 153, 1))),
                  TextSpan(
                    text: "Il est investi exclusivement en actions cotées à la BRVM.",
                  ),
                ],
              ),
            ),
          ),
          SecondaryButton(
            text: "En savoir plus",
            backcolor: Color.fromRGBO(208, 248, 238, 1),
            textcolor: Colors.black,
            press: () {
                Navigator.pushNamed(context, TransactioScreen.routeName);
            },
          ),
          /*GestureDetector(
            onTap: () => Navigator.pushNamed(context, SignUpScreen.routeName),
            child: Text(
              "Souscrire",
              style: TextStyle(
                  fontSize: getProportionateScreenWidth(16),
                  color: kPrimaryColor),
            ),
          ),*/
        ]
      )
      
    );
  }
}
