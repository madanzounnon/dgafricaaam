import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/screens/portefeuille/components/item_element.dart';
import '../../../size_config.dart';

class PortefeuilletemD extends StatelessWidget {
const PortefeuilletemD({
    Key? key,
    /*this.nomfond,this.naturefond,this.nbrepart,this.cump,this.cumpcumpcump,this.pmvaleur,this.valeurtotal,this.valeur,
    this.date,
    this.press,*/
    
    this.date,
    this.pmvltl,
    this.cump,
    this.vlv,
    this.vlj,
    this.pmvl,
    this.pmvalpcg,
    this.nbrpart
    //this.icon,
  }) : super(key: key);
  //final String? nomfond,naturefond,nbrepart,cump,cumpcumpcump,valeur,pmvaleur,valeurtotal;
  final String? date,pmvltl,cump,vlv,vlj,pmvalpcg,nbrpart,pmvl;
  final IconData icon=FontAwesomeIcons.moneyBill;
  final Color couleur=kPrimaryColor;
  final Color textcolor=pPrimaryColor;
  //final Function? press;
 // final String? date;
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
                     color: Color.fromRGBO(204, 221, 245, 1).withOpacity(0.32),
                      child:Column(
                          children: [
                            Container(
                              width: double.infinity,
                              height: getProportionateScreenWidth(50),
                              color: kSecondaryColor,
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(date!,style: TextStyle(color: Colors.white,fontWeight:FontWeight.bold,fontSize: getProportionateScreenWidth(18),)),
                                    //Text(nomfond!,style: TextStyle(color: pPrimaryColor,fontWeight:FontWeight.bold,fontSize: getProportionateScreenWidth(15),))
                                ],)
                                ),
                            ),
                      Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                              ItemElement(cle: 'Nombre de parts détenues:',valeur: nbrpart,couleur: couleur,textcolor: textcolor,icon: icon),
                              ItemElement(cle: 'CUMP:',valeur: cump,couleur: couleur,textcolor: textcolor,icon: icon),
                              ItemElement(cle: 'VL veille:',valeur: vlv,couleur: couleur,textcolor: textcolor,icon: icon),
                              ItemElement(cle: 'VL jour:',valeur: vlj,couleur: couleur,textcolor: textcolor,icon: icon),
                              ItemElement(cle: '+/-Values:',valeur: pmvl,couleur: couleur,textcolor: textcolor,icon: icon),
                              ItemElement(cle: '+/- Values totales:',valeur: pmvltl,couleur: couleur,textcolor: textcolor,icon: icon),
                              ItemElement(cle: '% de +/-Values:',valeur:pmvalpcg ,couleur: couleur,textcolor: textcolor,icon: icon),
                              
                           /* ItemElementD(cle: 'Nom du Fonds:',valeur: nomfond,couleur: couleur,textcolor: textcolor,icon: icon,),
                            ItemElementD(cle: 'Nature du Fonds:',valeur: naturefond,couleur: couleur,textcolor: textcolor,icon: icon),
                            ItemElementD(cle: 'Nombre de parts détenues:',valeur: nbrepart,couleur: couleur,textcolor: textcolor,icon: icon),
                            ItemElementD(cle: 'CUMP:',valeur: cump,couleur: couleur,textcolor: textcolor,icon: icon),
                            ItemElementD(cle: 'VL:',valeur: valeur,couleur: couleur,textcolor: textcolor,icon: icon),
                            ItemElementD(cle: '% de +/-Values:',valeur: pmvaleur,couleur: couleur,textcolor: textcolor,icon: icon),
                            ItemElementD(cle: '+/- Values totales:',valeur: valeurtotal,couleur: couleur,textcolor: textcolor,icon: icon),
                            ItemElementD(cle: 'CUMPCUMPCUMP:',valeur: cumpcumpcump,couleur: couleur,textcolor: textcolor,icon: icon),
                            //SizedBox(height:  getProportionateScreenWidth(10),),
                            SmallButton(text: "Consulter les détails",
                              press: () => Navigator.pushNamed(
                                context,
                                DetailsOrdreScreen.routeName,
                                arguments: DetailsOrdreArguments(ordre:demoOrdre[1]),
                              ),
                            ),*/
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
        SizedBox(height: getProportionateScreenHeight(20),),
        ]
      );

  }
}
