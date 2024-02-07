import 'package:flutter/material.dart';
import 'package:shop_app/constants.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../size_config.dart';
import 'section_title.dart';

class SpecialOffers extends StatelessWidget {
  const SpecialOffers({
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
            press: () {_launchURL();},
          ),
        ),
        SizedBox(height: getProportionateScreenWidth(20)),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SpecialOfferCard(
                image: "assets/images/banner1.jpeg",
                category: "EPARGNE ACTION",
                numOfBrands: 'UN FONDS UNIQUEMENT EXPOSE AU MARCHE DES ACTIONS',
                press: () {},
              ),
              SpecialOfferCard(
                image: "assets/images/banner2.jpeg",
                category: "CAPITAL SÛR",
                numOfBrands: "UN FONDS D'INVESTISSEMENT FRUCTIFIANT VOS PLACEMENTS POUR EN TIRER DES BENEFICES",
                press: () {},
              ),
              SpecialOfferCard(
                image: "assets/images/banner3.jpeg",
                category: "FCP AAM OBLIGATIS",
                numOfBrands: "UN FONDS D'INVESTISSEMENT BASE SUR UN PORTEFEUILLE D'OBLIGATION",
                press: () {},
              ),
              SpecialOfferCard(
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

  _launchURL() async {
   final Uri url = Uri.parse('https://www.africabourse-am.com/fr/offres.html');
   if (!await launchUrl(url)) {
        throw Exception('Could not launch $url');
    }
}
}

class SpecialOfferCard extends StatelessWidget {
  const SpecialOfferCard({
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
      padding: EdgeInsets.only(left: getProportionateScreenWidth(20)),
      child: GestureDetector(
        onTap: press,
        child: SizedBox(
          width: getProportionateScreenWidth(308),
          height: getProportionateScreenWidth(180),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Stack(
              children: [
                Image.asset(
                  image,
                  width: getProportionateScreenWidth(308),
                  height: getProportionateScreenWidth(180),
                  fit: BoxFit.cover,
                ),
                Container(
                  width: getProportionateScreenWidth(308),
                  height: getProportionateScreenWidth(180),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: getProportionateScreenWidth(308),
                        height: getProportionateScreenWidth(180)/2,
                      ),
                      Container(
                        width: getProportionateScreenWidth(308),
                        height: getProportionateScreenWidth(180)/2,
                         decoration: BoxDecoration(
                          color:Color.fromRGBO(7,43,75,0.72),
                          borderRadius: BorderRadius.only(bottomLeft:Radius.circular(20),bottomRight: Radius.circular(20))
                          ),
                          child:Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: getProportionateScreenWidth(8),
                            vertical: getProportionateScreenWidth(6),
                          ),
                          child: Text.rich(
                            TextSpan(
                              style: TextStyle(color: Colors.white),
                              children: [
                                TextSpan(
                                  text: "$category\n",
                                  style: TextStyle(
                                    fontSize: getProportionateScreenWidth(15),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                TextSpan(text: "$numOfBrands\n".toLowerCase(), style:TextStyle( fontWeight: FontWeight.bold,fontSize: getProportionateScreenWidth(13))),
                                //TextSpan(text:"Souscrire",style: TextStyle(decoration: TextDecoration.underline,fontWeight: FontWeight.bold, fontSize: getProportionateScreenWidth(10),color: Colors.white),),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ]),
                ),
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}
