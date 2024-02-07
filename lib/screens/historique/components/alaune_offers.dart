import 'package:flutter/material.dart';
import 'package:shop_app/components/secondary_button.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/models/Fcp.dart';
import 'package:shop_app/screens/home/components/section_title.dart';
import 'package:shop_app/screens/sign_up/components/Souscrire.dart';

import '../../../../size_config.dart';

class AlauneOffers extends StatelessWidget {
  const AlauneOffers({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
         Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SectionTitle(
            title: "Nos Offres",
            press: () {},
          ),
        ),
        SizedBox(height: getProportionateScreenWidth(20)),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              AlauneOfferCard(
                image: "assets/images/banner1.jpeg",
                category: "EPARGNE ACTION",
                numOfBrands: 'UN FONDS UNIQUEMENT EXPOSE AU MARCHE DES ACTIONS',
                press: () {},
              ),
              AlauneOfferCard(
                image: "assets/images/banner2.jpeg",
                category: "CAPITAL SÛR",
                numOfBrands: "UN FONDS D'INVESTISSEMENT FRUCTIFIANT VOS PLACEMENTS POUR EN TIRER DES BENEFICES",
                press: () {},
              ),
              AlauneOfferCard(
                image: "assets/images/banner3.jpeg",
                category: "FCP AAM OBLIGATIS",
                numOfBrands: "UN FONDS D'INVESTISSEMENT BASE SUR UN PORTEFEUILLE D'OBLIGATION",
                press: () {},
              ),
              AlauneOfferCard(
                image: "assets/images/banner4.jpeg",
                category: "EPARGNE CROISSANCE",
                numOfBrands: "UN FONDS D'INVESTISSEMENT FRUCTIFIANT VOS PLACEMENTS POUR EN TIRER DES BENEFICES",
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
class AlauneOfferCard extends StatelessWidget {
  const AlauneOfferCard({
    Key? key,
    required this.category,
    required this.image,
    required this.numOfBrands,
    required this.press,
  }) : super(key: key);

  final String category, image;
  final String numOfBrands;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: getProportionateScreenWidth(15)),
      child: Container(
      height:getProportionateScreenHeight(200),
      width: getProportionateScreenWidth(325),
      //margin: EdgeInsets.symmetric(vertical: getProportionateScreenWidth(20),horizontal: getProportionateScreenWidth(5)),
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(20),
        vertical: getProportionateScreenWidth(15),
      ),
      decoration: BoxDecoration(
        color:pPrimaryColor,
        /* borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),*/
       borderRadius: BorderRadius.circular(20),
      ),
      child: 
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(child:
                    Text.rich(
                      
                      TextSpan(
                        style: TextStyle(color: Colors.white),
                        children: [
                          TextSpan(text: "Offres du mois\n"),
                          TextSpan(
                            text: "$category  ",
                            style: TextStyle(
                              fontSize: getProportionateScreenWidth(18),
                              fontWeight: FontWeight.bold
                            ),
                          ),
                          TextSpan(text: "Recommandé\n",style:TextStyle(color: Color.fromRGBO(30, 200, 153, 1))),
                          TextSpan(
                            text:description.toLowerCase(),
                          ),
                        ],
                      ),
                      maxLines: 4,
                    ),
                  ),
                  /*Text("Offres du mois",style:TextStyle(color: Color.fromRGBO(255, 255, 255, 1))),
                  Text(
                    "$category  ",
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(18),
                      fontWeight: FontWeight.bold,color: Color.fromRGBO(255, 255, 255, 1)
                    ),
                  ),
                  Text("Recommandé",style:TextStyle(color: Color.fromRGBO(30, 200, 153, 1))),
                  Text(
                    description.toLowerCase(),style:TextStyle(color: Color.fromRGBO(255, 255, 255, 1)),maxLines: 3,
                  ),*/
               SizedBox(height: getProportionateScreenHeight(10),),
              SecondaryButton(
                text: "Souscrire",
                backcolor: Color.fromRGBO(208, 248, 238, 1),
                textcolor: Colors.black,
                press: () {
                    Navigator.pushNamed(context, Souscrire.routeName);
                },
              ),
        ]
      )
      )
    );
  }
}
