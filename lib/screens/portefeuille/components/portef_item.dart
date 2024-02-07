import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shop_app/components/secondary_button.dart';
import 'package:shop_app/components/small_button.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/models/Ordre.dart';
import 'package:shop_app/screens/details_order/details_ordre.dart';
import 'package:shop_app/screens/portefeuille/components/item_element.dart';
import 'package:shop_app/screens/transactions/transaction_screen.dart';

import '../../../size_config.dart';

class Portefeuilletem extends StatelessWidget {
const Portefeuilletem({
    Key? key,
    this.nomfond,this.naturefond,this.nbrepart,this.cump,this.cumpcumpcump,this.pmvaleur,this.valeurtotal,this.valeur,
    required this.couleurheader,
    required this.colorbody,
    //this.couleur,this.textcolor,
    this.press,
    //this.icon,
  }) : super(key: key);
  final String? nomfond,naturefond,nbrepart,cump,cumpcumpcump,valeur,pmvaleur,valeurtotal;
  final IconData icon=FontAwesomeIcons.apple;
  final Color couleur=kPrimaryColor;
  final Color textcolor=pPrimaryColor;
  final Color couleurheader;
  final Color colorbody;
  final Function? press;
  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment : MainAxisAlignment.center,
        children: [
           Card(
                    semanticContainer: true,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                     shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    //elevation: 30,
                    margin: EdgeInsets.only(bottom: 5),
                     //shadowColor: Colors.black,
                     color: Color.fromRGBO(236, 244, 255, 1),
                      child:Column(
                          children: [
                            Container(
                              width: double.infinity,
                              height: getProportionateScreenWidth(50),
                              color: Color.fromRGBO(204, 221, 245, 1),
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("$nomfond".toUpperCase(),style: TextStyle(color: pPrimaryColor,fontWeight:FontWeight.bold,fontSize: getProportionateScreenWidth(18),)),
                                    //Text(nomfond!,style: TextStyle(color: pPrimaryColor,fontWeight:FontWeight.bold,fontSize: getProportionateScreenWidth(15),))
                                ],)
                                ),
                            ),
                      Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                           // ItemElement(cle: 'Nom du Fonds:',valeur: nomfond,couleur: couleur,textcolor: textcolor,icon: icon,),
                            //ItemElement(cle: 'Nature du Fonds:',valeur: naturefond,couleur: couleur,textcolor: textcolor,icon: icon),
                            ItemElement(cle: 'Nombre de parts détenues:',valeur: nbrepart,couleur: couleur,textcolor: textcolor,icon: icon),
                            ItemElement(cle: 'CUMP:',valeur: cump,couleur: couleur,textcolor: textcolor,icon: icon),
                            ItemElement(cle: 'VL:',valeur: valeur,couleur: couleur,textcolor: textcolor,icon: icon),
                            ItemElement(cle: '+/-Values:',valeur: cumpcumpcump,couleur: couleur,textcolor: textcolor,icon: icon),
                            ItemElement(cle: '+/- Values totales:',valeur: valeurtotal,couleur: couleur,textcolor: textcolor,icon: icon),
                            ItemElement(cle: '% de +/-Values:',valeur:pmvaleur ,couleur: couleur,textcolor: textcolor,icon: icon),
                            SizedBox(height:  getProportionateScreenWidth(20),),
                            SmallButton(text: "Consulter les détails",
                              press: press
                            ),
                            /*SizedBox(
                              width: 200,
                              child: ElevatedButton(
                                onPressed: () => 'Null',
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all(Colors.blue)),
                                child: Padding(
                                  padding: const EdgeInsets.all(4),
                                  child: Row(
                                    children: const [
                                      Icon(Icons.touch_app),
                                      Text('Lire la suite')
                                    ],
                                  ),
                                ),
                            )
                          ) */
                          ]  
                        ), 
                    ),
                ])
              ), 
              SizedBox(height: getProportionateScreenHeight(20),)
        ]
      );

  }
}
