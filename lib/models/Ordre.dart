import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shop_app/constants.dart';

class Ordre {
  final int id;
  final String description;
  final String? fcp,redement,liquidative,performanceJ,performanceO,iconurl;
  final IconData icon;
  final Color? couleur;
  final Color? textcolor;
  final Function? press;
 
  const Ordre({
    required this.id,
    this.fcp,
    this.redement,
    this.liquidative,
    this.performanceJ,
    this.performanceO,
    this.iconurl,
    this.couleur,this.textcolor,
    this.press,
    required this.description,
   required this.icon,
  });
}



// Our demo Products

List<Ordre> demoOrdre = [
          Ordre(
            id: 1,
            fcp: "OBLIGATIS",
            redement: '6%',
            liquidative: "8570",
            performanceJ: '88%',
            performanceO: "0",
            description: "Il est investi en titres de créances sans distinction de maturité. Il s’adresse à ceux qui désirent investir sur des actifs sans risque et à long terme. Avec une performance de 7,17% en 2021, ce fonds s’est placé en 1ère position des fonds obligataires de l’UEMOA.",
            icon:FontAwesomeIcons.moneyCheckAlt,
            //iconurl: "assets/icons/money-check-dollar-solid.svg",
            couleur:pPrimaryColor ,
            textcolor: Colors.white,
            press: () => {},
          ),
          Ordre(
            id: 2,
            fcp: "CAPITAL SÛR",
            redement: '-',
            liquidative: "7969",
            performanceJ: '0',
            performanceO: "65%",
            icon:FontAwesomeIcons.star,
            //iconurl: "assets/icons/Bell.svg",
            couleur: kSecondaryColor,
            textcolor: Colors.white,
            press: () {},
            description: "Il est investi en obligations et bons du trésor de maturité inférieure à deux ans. Recommandé pour les investissements d’une durée inférieure à un an Avec une performance de 4,84% en 2021, ce fonds s’est placé en 2e position des fonds monétaires de l’UEMOA.",
          ),
          Ordre(
            id: 3,
            fcp: "EPARGNE CROISSANCE",
            redement: '-',
            liquidative: "7620",
            performanceJ: '0',
            performanceO: "54%",
            icon:FontAwesomeIcons.chartLine,
            //,iconurl: "assets/icons/Settings.svg",
            couleur:pPrimaryColor ,
            textcolor: Colors.white,
            press: () {},
            description: "lI est investi à la fois en actions et en obligations. Il est recommandé pour les investisseurs du moyen et long terme désirant un rendement au dessus de la moyenne. Avec une performance de 26,17% en 2021, ce fonds s’est placé en 7e position des fonds diversifiés de l’UEMOA.",
          ),
          Ordre(
            id: 4,
            fcp: "EPARGNE ACTION",
            redement: '-',
            liquidative: "5525",
            performanceJ: '0',
            performanceO: "14%",
            icon:FontAwesomeIcons.piggyBank,
            iconurl: "assets/icons/Question mark.svg",
            couleur: kSecondaryColor,
            textcolor: Colors.white,
            press: () {},
            description: "Il est investi exclusivement en actions cotées à la BRVM. Il est recommandé pour ceux qui veulent le rendement maximal possible et qui sont prêts à investir à long terme. Avec une performance de 68,79% en 2021, ce fonds s’est placé en 1ere position des fonds actions de l’UEMOA.s",
          ),
      ];

const String description =
    "Wireless Controller for PS4™ gives you what you want in your gaming from over precision control your games to sharing …";
