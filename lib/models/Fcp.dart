import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shop_app/constants.dart';

class Fcp {
  final int id;
  final String? description;
  final String? fcp,pmvltl,cump,vlv,vlj,iconurl,pmvalpcg,nbrpart,pmvl;
  final IconData? icon;
  final Color? couleur;
  final Color? textcolor;
  final Color? backColor;
  final List<Fcpdetails> fcpdetails;

  Fcp({
    required this.id,
    this.description,
    this.fcp,this.pmvltl,this.cump,this.vlv,this.vlj,this.iconurl,this.pmvalpcg,this.nbrpart,this.pmvl,
    this.icon,
    this.couleur,
    this.textcolor,
    this.backColor,
    required this.fcpdetails,
  });

  
  
}


class Fcpdetails {
  final String? date,pmvltl,cump,vlv,vlj,pmvalpcg,nbrpart,pmvl;
  const Fcpdetails({
    this.date,
    this.pmvltl,
    this.cump,
    this.vlv,
    this.vlj,
    this.pmvl,
    this.pmvalpcg,
    this.nbrpart
  });
}

// Our demo Products
List<Fcp> demoFcp = [
      Fcp(
        id: 1,
        fcp: "OBLIGATIS",
        pmvltl: '817250',
        cump: "7280",
        vlv: '8500',
        vlj: '8450',
        pmvl: '1220',
        pmvalpcg:'+16,75',
        nbrpart:'500',
        description: "Il est investi en titres de créances sans distinction de maturité. Il s’adresse à ceux qui désirent investir sur des actifs sans risque et à long terme. Avec une performance de 7,17% en 2021, ce fonds s’est placé en 1ère position des fonds obligataires de l’UEMOA.",
        icon:FontAwesomeIcons.moneyCheckAlt,
        //iconurl: "assets/icons/money-check-dollar-solid.svg",
        couleur:pPrimaryColor ,
        textcolor: Colors.white,
        fcpdetails: [
          Fcpdetails(
            date: "Lundi 10 janvier 2023",
            pmvltl: '817250',
            cump: "7280",
            vlv: '8500',
            vlj: '8450',
            pmvl: '1220',
            pmvalpcg:'+16,75',
            nbrpart:'500',
          ),
          Fcpdetails(
            date: "Samedi 19 Fevrier 2023",
            pmvltl: '817250',
            cump: "7280",
            vlv: '8500',
            vlj: '8450',
            pmvl: '1220',
            pmvalpcg:'+16,75',
            nbrpart:'500',
          ),
          Fcpdetails(
            date: "vendredi 10 Mars 2023",
            pmvltl: '817250',
            cump: "7280",
            vlv: '8500',
            vlj: '8450',
            pmvl: '1220',
            pmvalpcg:'+16,75',
            nbrpart:'500',
          ),
          Fcpdetails(
            date: "jeu 10 janvier 2023",
            pmvltl: '817250',
            cump: "7280",
            vlv: '8500',
            vlj: '8450',
            pmvl: '1220',
            pmvalpcg:'+16,75',
            nbrpart:'500',
          ),
          Fcpdetails(
            date: "Mercredi 10 janvier 2023",
            pmvltl: '817250',
            cump: "7280",
            vlv: '8500',
            vlj: '8450',
            pmvl: '1220',
            pmvalpcg:'+16,75',
            nbrpart:'500',
          )
        ]
      ),
      Fcp(
        id: 2,
        fcp: "CAPITAL SÛR",
        pmvltl: '817250',
        cump: "7280",
        vlv: '8500',
        vlj: '8450',
        pmvl: '1220',
        pmvalpcg:'+16,75',
        nbrpart:'500',
        icon:FontAwesomeIcons.star,
        //iconurl: "assets/icons/Bell.svg",
        couleur: kSecondaryColor,
        textcolor: Colors.white,
         fcpdetails: [
          Fcpdetails(
            date: "Lundi 10 janvier 2023",
            pmvltl: '817250',
            cump: "7280",
            vlv: '8500',
            vlj: '8450',
            pmvl: '1220',
            pmvalpcg:'+16,75',
            nbrpart:'500',
          ),
          Fcpdetails(
            date: "Samedi 19 Fevrier 2023",
            pmvltl: '817250',
            cump: "7280",
            vlv: '8500',
            vlj: '8450',
            pmvl: '1220',
            pmvalpcg:'+16,75',
            nbrpart:'500',
          ),
          Fcpdetails(
            date: "vendredi 10 Mars 2023",
            pmvltl: '817250',
            cump: "7280",
            vlv: '8500',
            vlj: '8450',
            pmvl: '1220',
            pmvalpcg:'+16,75',
            nbrpart:'500',
          ),
          Fcpdetails(
            date: "jeu 10 janvier 2023",
            pmvltl: '817250',
            cump: "7280",
            vlv: '8500',
            vlj: '8450',
            pmvl: '1220',
            pmvalpcg:'+16,75',
            nbrpart:'500',
          ),
          Fcpdetails(
            date: "Mercredi 10 janvier 2023",
            pmvltl: '817250',
            cump: "7280",
            vlv: '8500',
            vlj: '8450',
            pmvl: '1220',
            pmvalpcg:'+16,75',
            nbrpart:'500',
          )
        ],
        description: "Il est investi en obligations et bons du trésor de maturité inférieure à deux ans. Recommandé pour les investissements d’une durée inférieure à un an Avec une performance de 4,84% en 2021, ce fonds s’est placé en 2e position des fonds monétaires de l’UEMOA.",
      ),
      Fcp(
        id: 3,
        fcp: "EPARGNE CROISSANCE",
        pmvltl: '817250',
        cump: "7280",
        vlv: '8500',
        vlj: '8450',
        pmvl: '1220',
        pmvalpcg:'+16,75',
        nbrpart:'500',
        icon:FontAwesomeIcons.chartLine,
        //,iconurl: "assets/icons/Settings.svg",
        couleur:pPrimaryColor ,
        textcolor: Colors.white,
        description: "lI est investi à la fois en actions et en obligations. Il est recommandé pour les investisseurs du moyen et long terme désirant un rendement au dessus de la moyenne. Avec une performance de 26,17% en 2021, ce fonds s’est placé en 7e position des fonds diversifiés de l’UEMOA.",
         fcpdetails: [
          Fcpdetails(
            date: "Lundi 10 janvier 2023",
            pmvltl: '817250',
            cump: "7280",
            vlv: '8500',
            vlj: '8450',
            pmvl: '1220',
            pmvalpcg:'+16,75',
            nbrpart:'500',
          ),
          Fcpdetails(
            date: "Samedi 19 Fevrier 2023",
            pmvltl: '817250',
            cump: "7280",
            vlv: '8500',
            vlj: '8450',
            pmvl: '1220',
            pmvalpcg:'+16,75',
            nbrpart:'500',
          ),
          Fcpdetails(
            date: "vendredi 10 Mars 2023",
            pmvltl: '817250',
            cump: "7280",
            vlv: '8500',
            vlj: '8450',
            pmvl: '1220',
            pmvalpcg:'+16,75',
            nbrpart:'500',
          ),
          Fcpdetails(
            date: "jeu 10 janvier 2023",
            pmvltl: '817250',
            cump: "7280",
            vlv: '8500',
            vlj: '8450',
            pmvl: '1220',
            pmvalpcg:'+16,75',
            nbrpart:'500',
          ),
          Fcpdetails(
            date: "Mercredi 10 janvier 2023",
            pmvltl: '817250',
            cump: "7280",
            vlv: '8500',
            vlj: '8450',
            pmvl: '1220',
            pmvalpcg:'+16,75',
            nbrpart:'500',
          )
        ]
      ),
      Fcp(
        id: 4,
        fcp: "EPARGNE ACTION",
        pmvltl: '817250',
        cump: "7280",
        vlv: '8500',
        vlj: '8450',
        pmvl: '1220',
        pmvalpcg:'+16,75',
        nbrpart:'500',
        icon:FontAwesomeIcons.piggyBank,
        iconurl: "assets/icons/Question mark.svg",
        couleur: kSecondaryColor,
        textcolor: Colors.white,
        description: "Il est investi exclusivement en actions cotées à la BRVM. Il est recommandé pour ceux qui veulent le rendement maximal possible et qui sont prêts à investir à long terme. Avec une performance de 68,79% en 2021, ce fonds s’est placé en 1ere position des fonds actions de l’UEMOA.s",
         fcpdetails: [
          Fcpdetails(
            date: "Lundi 10 janvier 2023",
            pmvltl: '817250',
            cump: "7280",
            vlv: '8500',
            vlj: '8450',
            pmvl: '1220',
            pmvalpcg:'+16,75',
            nbrpart:'500',
          ),
          Fcpdetails(
            date: "Samedi 19 Fevrier 2023",
            pmvltl: '817250',
            cump: "7280",
            vlv: '8500',
            vlj: '8450',
            pmvl: '1220',
            pmvalpcg:'+16,75',
            nbrpart:'500',
          ),
          Fcpdetails(
            date: "vendredi 10 Mars 2023",
            pmvltl: '817250',
            cump: "7280",
            vlv: '8500',
            vlj: '8450',
            pmvl: '1220',
            pmvalpcg:'+16,75',
            nbrpart:'500',
          ),
          Fcpdetails(
            date: "jeu 10 janvier 2023",
            pmvltl: '817250',
            cump: "7280",
            vlv: '8500',
            vlj: '8450',
            pmvl: '1220',
            pmvalpcg:'+16,75',
            nbrpart:'500',
          ),
          Fcpdetails(
            date: "Mercredi 10 janvier 2023",
            pmvltl: '817250',
            cump: "7280",
            vlv: '8500',
            vlj: '8450',
            pmvl: '1220',
            pmvalpcg:'+16,75',
            nbrpart:'500',
          )
        ]
      ),
  ];

const String description =
    "Wireless Controller for PS4™ gives you what you want in your gaming from over precision control your games to sharing …";
