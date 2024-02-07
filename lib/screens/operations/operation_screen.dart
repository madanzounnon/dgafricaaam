import 'package:flutter/material.dart';
import 'package:shop_app/components/coustom_bottom_nav_bar.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/enums.dart';
import 'package:shop_app/size_config.dart';
import 'components/body.dart';

class OperationScreen extends StatelessWidget {
  static String routeName = "/operations";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: pPrimaryColor,
      appBar: buildAppBar(context),
      body: Body(),
      //bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.operations),
    );
  }

  /*AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: Column(
        children: [
          Text(
            "operations",
            style: TextStyle(color: Colors.black),
          ),
        ],
      ),
    );
  }*/

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
        //backgroundColor:pPrimaryColor,
        automaticallyImplyLeading: true,
        title:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(
            "Operations",
            style: TextStyle(
                fontSize: getProportionateScreenWidth(20),
                fontWeight: FontWeight.bold,
                color: pPrimaryColor),
          ),
          /*Container(
          //padding: EdgeInsets.only(left: 0,right: 8,top: 2,bottom: 2),
          height: 30,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Color.fromARGB(255, 2, 132, 47),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(width: getProportionateScreenWidth(8),),
              Icon(Icons.add,color: Colors.white ,size: 20,),
             // SizedBox(width: 2,),
              Padding(
                padding: EdgeInsets.only(left: 5,right: 8,top: 2,bottom: 3),
                child:Text("Dépôt",style: TextStyle(color: Colors.white, fontSize: getProportionateScreenWidth(12),fontWeight: FontWeight.bold),),)
            ],
          ),
        ),*/
        ]));
  }
}
/*
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/models/opera.dart';
import 'package:shop_app/screens/portefeuille/components/item_element.dart';
import '../../../components/Souscrire.dart';
import '../../moyen_paiement/moyen_paiement_screen.dart';
import '../rachat_souscrir_screen.dart';
import 'performace_design.dart';

import '../../../size_config.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: ListView(
        children: [
          //Divider(color: Colors.grey.withOpacity(0.8)),
          SizedBox(
            height: 5,
          ),
        Text("Commencez à \ninvesti",textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: getProportionateScreenWidth(35),
            fontWeight: FontWeight.w900,
            color: pPrimaryColor,
          ),
        ),
        Image.asset(
          "assets/images/man.png",
          height: SizeConfig.screenHeight * 0.35, //40%
        ),
        Transform.translate(
              offset: Offset(0, -100),
              child:
          Column(
              children: List.generate(listoperationdetail.length, (index) {
            return Container(
             // height:getProportionateScreenWidth(300),
              width: double.infinity,
               margin: EdgeInsets.symmetric(
                 horizontal: getProportionateScreenWidth(20),
                 vertical: getProportionateScreenWidth(10),
               ),
              decoration: BoxDecoration(
                color:Colors.white,
                borderRadius: BorderRadius.circular(30),
                //border: BoxBorder.lerp(a, b, t),
              ),
              child: Card(
              shape:const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30))),
              elevation: 10,
              child:Column(
              //mainAxisAlignment : MainAxisAlignment.start,
              children: [
                   Container(
                    padding: EdgeInsets.only(left: 5,right: 16,top: 10,bottom: 0),
                    child: Row(
                      children: [
                        SvgPicture.asset("assets/icons/cashicon.svg",
                          width:getProportionateScreenWidth(70),
                          height:getProportionateScreenHeight(70),
                        ),
                        
                        SizedBox(width: 12,),
                       // Column(
                         // crossAxisAlignment: CrossAxisAlignment.start,
                          //children:[
                            Row(
                              children:[
                                Expanded(
                                  child: Container(
                                    color: Colors.transparent,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children:[
                                        Text(listoperationdetail[index].nom.toUpperCase(), style: TextStyle(fontSize:getProportionateScreenWidth(17)  ,color: pPrimaryColor),),
                                        Text(listoperationdetail[index].typeoperation,style: TextStyle(fontSize: getProportionateScreenWidth(13))),
                                      ],
                                    ),
                                  ),
                                ),
                               /*Row(
                                  children: [
                                      SvgPicture.asset(
                                      "assets/icons/Star Icon.svg",
                                        height: getProportionateScreenWidth(15)
                                      ),
                                      SizedBox(width: 10,),
                                      Text('4.8',style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),),
                                  ]
                                )*/
                              ],
                            ),
                            //Text("Sgi Africabource et Partenaires".toUpperCase(),maxLines: 1,),
                          //]
                        //)
                      ]
                    ),
                  ),
                  Divider(),
                  Container(
                    padding: EdgeInsets.only(left: 16,right: 16,top: 10,bottom: 10),
                    child:Row(
                      mainAxisAlignment:MainAxisAlignment.spaceBetween,
                      children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Souscripteur",style: TextStyle(
                                fontSize: getProportionateScreenWidth(15),
                              ),),
                            Text(listoperationdetail[index].souscripteur,
                              style: TextStyle(
                                color: pPrimaryColor,
                                fontSize: getProportionateScreenWidth(18),
                                fontWeight: FontWeight.bold
                              ),
                            ),
                          ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Valeur à l'origine",style: TextStyle(
                                fontSize: getProportionateScreenWidth(15),
                              ),),
                            Text(listoperationdetail[index].valeurOrigine,
                              style: TextStyle(
                                color: pPrimaryColor,
                                fontSize: getProportionateScreenWidth(18),
                                fontWeight: FontWeight.bold
                              ),
                            ),
                          ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text("Code ISIN",style: TextStyle(
                                fontSize: getProportionateScreenWidth(15),
                              ),),
                            Text(listoperationdetail[index].souscripteur,
                              style: TextStyle(
                                color: pPrimaryColor,
                                fontSize: getProportionateScreenWidth(18),
                                fontWeight: FontWeight.bold
                              ),
                            ),
                          ],
                      ),
                    ],)
                    ),
                    Divider(),
                    Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text("Valeur liquidation".toUpperCase(),style: TextStyle(
                                  fontSize: getProportionateScreenWidth(15),
                                ),),
                              Text(listoperationdetail[index].valeurLiquidative,
                                style: TextStyle(
                                  color: pPrimaryColor,
                                  fontSize: getProportionateScreenWidth(25),
                                  fontWeight: FontWeight.w900
                                ),
                              ),
                            ],
                        ),
                    SizedBox(height: getProportionateScreenHeight(10),),
                    Container(
                      padding: EdgeInsets.only(left: 5,right: 5,top: 10,bottom: 10),
                      child:Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                        Souscrirebtn(
                          text: "Racheter",
                          backcolor: Color.fromRGBO(255, 234, 225, 1),
                          textcolor: Color.fromRGBO(255, 118, 67, 1),
                          press: () {},
                        ),
                        Souscrirebtn(
                          text: "Souscrire",
                          backcolor: Color.fromRGBO(0, 120, 20, 1),
                          textcolor: Color.fromARGB(255, 255, 255, 255),
                          press: () {
                            alertopt(listoperationdetail[index],context);
                          },
                        ),
                        
                      ])
                    )
                ]
              ) 
            ));
          })))
        ],
      ),
    );
}

 
 alertopt(Operationdetail listoperationdetail,BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return 
       AlertDialog(
        contentPadding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(0),vertical: getProportionateScreenHeight(0)),
           shape: RoundedRectangleBorder(
            borderRadius:BorderRadius.circular(30.0)
            ),
          content: Column(
              mainAxisAlignment : MainAxisAlignment.start,
              children: [
                   Container(
                   padding: EdgeInsets.only(left: 5,right: 16,top: 10,bottom: 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        SvgPicture.asset("assets/icons/cashicon.svg",
                            width:getProportionateScreenWidth(70),
                            //height:getProportionateScreenHeight(70),
                          ),
                        SizedBox(width: 12,),
                        Expanded(
                          child: Container(
                            color: Colors.transparent,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(listoperationdetail.nom.toUpperCase(), style: TextStyle(fontSize:getProportionateScreenWidth(13)  ,color: pPrimaryColor),),
                                Text(listoperationdetail.typeoperation,style: TextStyle(fontSize: getProportionateScreenWidth(11))),
                              ],
                            ),
                          ),
                        ),
                        Row(
                          children: <Widget>[
                              SvgPicture.asset(
                              "assets/icons/Star Icon.svg",
                                height: getProportionateScreenWidth(15)
                              ),
                              SizedBox(width: 10,),
                              Text('4.8',style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),),
                          ]
                        )
                      ],
                    ),
                  ),
                  Divider(),
                  Container(
                    padding: EdgeInsets.only(left: 16,right: 16,top: 10,bottom: 10),
                    child:Column(
                      mainAxisAlignment:MainAxisAlignment.start,
                      children: [
                        PerformaceDesign(cle: "Début d'année",date: '20/12/2022',valeur: listoperationdetail.performance.debannee,),
                        PerformaceDesign(cle: "Une semaine",date: '20/12/2022',valeur: listoperationdetail.performance.unesemaine,),
                        PerformaceDesign(cle: "Un mois",date: '20/12/2022',valeur: listoperationdetail.performance.unmois,),
                        PerformaceDesign(cle: "03 mois",date: '20/12/2022',valeur: listoperationdetail.performance.troismois,),
                        PerformaceDesign(cle: "06 mois",date: '20/12/2022',valeur: listoperationdetail.performance.sixemois,),
                        PerformaceDesign(cle: "Un an",date: '20/12/2022',valeur: listoperationdetail.performance.unannee,),
                        PerformaceDesign(cle: "03 ans",date: '20/12/2022',valeur: listoperationdetail.performance.troisannee,),
                    ],)
                    ),
                    Divider(),
                    Container(
                    padding: EdgeInsets.only(left: 16,right: 16,top: 10,bottom: 10),
                    child:Column(
                      mainAxisAlignment:MainAxisAlignment.start,
                      children: [
                        ItemElement(cle: "Droits d'entrée max.",valeur: listoperationdetail.droits.droitEntreMax,),
                        ItemElement(cle: "Droits de sortie max.",valeur: listoperationdetail.droits.droitSortirMax,),
                        ItemElement(cle: "Frais de gestion max.",valeur: listoperationdetail.droits.fraisGestionMax,),
                        ItemElement(cle: "Transmission des ordres",valeur: listoperationdetail.droits.transmissionOrdre,),
                    ],)
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 3,right: 3,top: 10,bottom: 10),
                      child:Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                        Souscrirebtn(
                          text: "Racheter",
                          backcolor: Color.fromRGBO(255, 234, 225, 1), 
                          textcolor: Color.fromRGBO(255, 118, 67, 1),
                          press: ()  {
                            //Navigator.pushNamed(context,RachatSouscrireScreen.routeName,arguments: listoperationdetail);
                            },
                        ),
                        Souscrirebtn(
                          text: "Souscrire",
                          backcolor: Color.fromRGBO(0, 120, 20, 1),
                          textcolor: Color.fromARGB(255, 255, 255, 255),
                          press: () {
                           // Navigator.pushNamed(context,MoyenPaiementScreen.routeName,arguments:{'type':'Souscription'} );
                          },
                        ),
                      ])
                    )
                ]
              ) 
            ) ;
        },
    );  
 }

}


*/