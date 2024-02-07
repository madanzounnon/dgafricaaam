import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/models/Ordre.dart';
import 'package:shop_app/screens/details_order/details_ordre.dart';
import 'odre_item.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          //ProfilePic(),
          //SizedBox(height: 20),
          OrdreItem(
            fcp: "Obligatif",
            redement: '6%',
            liquidative: "8570",
            performanceJ: '88%',
            performanceO: "0",
            icon:FontAwesomeIcons.moneyCheckAlt,
            //iconurl: "assets/icons/money-check-dollar-solid.svg",
            couleur:pPrimaryColor ,
            textcolor: Colors.white,
            press: () => Navigator.pushNamed(
            context,
            DetailsOrdreScreen.routeName,
            arguments: DetailsOrdreArguments(ordre:demoOrdre[0]),
          ),
          ),
          OrdreItem(
            fcp: "Capital SÛR",
            redement: '-',
            liquidative: "7969",
            performanceJ: '0',
            performanceO: "65%",
            icon:FontAwesomeIcons.star,
            //iconurl: "assets/icons/Bell.svg",
            couleur: kSecondaryColor,
            textcolor: Colors.white,
            press: () => Navigator.pushNamed(
            context,
            DetailsOrdreScreen.routeName,
            arguments: DetailsOrdreArguments(ordre:demoOrdre[1]),
          ),
          ),
          OrdreItem(
            fcp: "Epargne Croissance",
            redement: '-',
            liquidative: "7620",
            performanceJ: '0',
            performanceO: "54%",
            icon:FontAwesomeIcons.chartLine,
            //,iconurl: "assets/icons/Settings.svg",
            couleur:pPrimaryColor ,
            textcolor: Colors.white,
            press: () => Navigator.pushNamed(
            context,
            DetailsOrdreScreen.routeName,
            arguments: DetailsOrdreArguments(ordre:demoOrdre[2]),
          ),
          ),
          OrdreItem(
            fcp: "Epargne ACTION",
            redement: '-',
            liquidative: "5525",
            performanceJ: '0',
            performanceO: "14%",
            icon:FontAwesomeIcons.piggyBank,
            iconurl: "assets/icons/Question mark.svg",
            couleur: kSecondaryColor,
            textcolor: Colors.white,
            press: () => Navigator.pushNamed(
            context,
            DetailsOrdreScreen.routeName,
            arguments: DetailsOrdreArguments(ordre:demoOrdre[3]),
          ),
          ),
        ],
      ),
    );
  }
}
