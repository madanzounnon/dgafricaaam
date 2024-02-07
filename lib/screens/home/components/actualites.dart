import 'package:flutter/material.dart';
import 'package:shop_app/constants.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../components/default_button.dart';
import '../../../size_config.dart';
import 'section_title.dart';

class Actualites extends StatelessWidget {
  const Actualites({
    Key? key,
  }) : super(key: key);

   _launchURL() async {
    final Uri url = Uri.parse('https://www.africabourse-am.com/fr/publications.html');
    if (!await launchUrl(url)) {
          throw Exception('Could not launch $url');
      }
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SectionTitle(
            title: "Nos Actualités",
            press: () {_launchURL();},
          ),
        ),
        SizedBox(height: getProportionateScreenWidth(20)),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ActualitesCard(
                image: "assets/images/actu1.jpeg",
                title: "HAUSSE DES MARCHES",
                smlldesc: 'La Banque centrale des Etats de l’Afrique de l’Ouest (BCEAO) a annoncé une quatrième hausse de son principal taux directeur en moins d’un an, passant de 2,75% à 3%. Cette politique monétaire a pour but de freiner la pression inflationniste qui reste forte dans la région, même si elle a diminué ces derniers mois. Par exemple, en décembre, l’inflation dans l’Uemoa est passée à 7%, pour retomber un peu plus en janvier à 6% en partie due à la bonne tenue de la campagne agricole dans la sous-région.',
                press: () {},
              ),
              ActualitesCard(
                image: "assets/images/actu2.jpeg",
                title: "HAUSSE DES MARCHES",
                smlldesc: "La Banque centrale des Etats de l’Afrique de l’Ouest (BCEAO) a annoncé une quatrième hausse de son principal taux directeur en moins d’un an, passant de 2,75% à 3%. Cette politique monétaire a pour but de freiner la pression inflationniste qui reste forte dans la région, même si elle a diminué ces derniers mois. Par exemple, en décembre, l’inflation dans l’Uemoa est passée à 7%, pour retomber un peu plus en janvier à 6% en partie due à la bonne tenue de la campagne agricole dans la sous-région.",
                press: () {},
              ),
              ActualitesCard(
                image: "assets/images/actu3.jpeg",
                title: "HAUSSE DES MARCHES",
                smlldesc: "La Banque centrale des Etats de l’Afrique de l’Ouest (BCEAO) a annoncé une quatrième hausse de son principal taux directeur en moins d’un an, passant de 2,75% à 3%. Cette politique monétaire a pour but de freiner la pression inflationniste qui reste forte dans la région, même si elle a diminué ces derniers mois. Par exemple, en décembre, l’inflation dans l’Uemoa est passée à 7%, pour retomber un peu plus en janvier à 6% en partie due à la bonne tenue de la campagne agricole dans la sous-région.",
                press: () {},
              ),
              ActualitesCard(
                image: "assets/images/actu4.jpeg",
                title: "HAUSSE DES MARCHES",
                smlldesc: "La Banque centrale des Etats de l’Afrique de l’Ouest (BCEAO) a annoncé une quatrième hausse de son principal taux directeur en moins d’un an, passant de 2,75% à 3%. Cette politique monétaire a pour but de freiner la pression inflationniste qui reste forte dans la région, même si elle a diminué ces derniers mois. Par exemple, en décembre, l’inflation dans l’Uemoa est passée à 7%, pour retomber un peu plus en janvier à 6% en partie due à la bonne tenue de la campagne agricole dans la sous-région.",
                press: () {},
              ),
              SizedBox(width: getProportionateScreenWidth(20)),
            ],
          ),
        ),
      ],
    );
  }
}

class ActualitesCard extends StatelessWidget {
  const ActualitesCard({
    Key? key,
    required this.title,
    required this.image,
    required this.smlldesc,
    required this.press,
  }) : super(key: key);

  final String title, image;
  final String smlldesc;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: getProportionateScreenWidth(20)),
      child: GestureDetector(
        onTap: press,
        child: SizedBox(
          width: getProportionateScreenWidth(308),
          height: getProportionateScreenHeight(390),
          child: Card(
                    semanticContainer: true,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                     shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    elevation: 50,
                  // margin: EdgeInsets.all(5),
                    shadowColor: Colors.black,
                    child:Column(
                          children: [
                           Container(
                            width: double.infinity, 
                            height: getProportionateScreenHeight(180),
                            child: Image.asset(
                              image,
                              fit: BoxFit.fill,
                              height: getProportionateScreenHeight(180),
                              width: double.infinity,
                            ),),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                      children: [//SizedBox
                        Text(
                          title,
                          style: TextStyle(
                            fontSize: getProportionateScreenWidth(20),
                            color:Colors.black,
                            fontWeight: FontWeight.bold,
                          ), //Textstyle
                        ), //Text
                        SizedBox(
                          height: getProportionateScreenHeight(8),
                        ), //SizedBox
                        Text(
                          smlldesc,
                          maxLines: 2,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 12,
                            color: kSecondaryColor,
                          ), //Textstyle
                        ), //Text
                        SizedBox(
                          height: getProportionateScreenHeight(10),
                        ), 
                        /* SmallButton(text: "Lire la suite",
                          press: () => {}
                        ),*///SizedBox
                        DefaultButton(text: 'Lire la suite',press: press)
                      ]  
                    ), 
                    ),
                ])
              ),)
      ),
    );
  }
 
}
