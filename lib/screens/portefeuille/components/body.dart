import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shop_app/models/Fcp.dart';
import 'package:shop_app/models/Ordre.dart';
import 'package:shop_app/screens/details_order/details_ordre.dart';
import 'package:shop_app/screens/portefeuille/components/portef_item.dart';
import 'package:shop_app/screens/portefeuille_details/components/portef_item_d.dart';
import 'package:shop_app/screens/portefeuille_details/portefeuille_detais_screen.dart';
import 'package:shop_app/size_config.dart';

import '../../../constants.dart';

class Body extends StatefulWidget {
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> with TickerProviderStateMixin{
  late TabController tabController;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync:this);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Container(
      //padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      height: MediaQuery.of(context).size.height,
      width: double.infinity,
      child:Column(
        children: [
          SizedBox(height: getProportionateScreenHeight(10),),
          Text("Récapitulatif des fonds", textAlign: TextAlign.center, style: TextStyle(fontSize: getProportionateScreenWidth(17))),
          SizedBox(height: getProportionateScreenHeight(15),),
         // Row(
           // mainAxisAlignment: MainAxisAlignment.center,
           // children: [
              TabBar(
                indicator: BoxDecoration(
                  color: kPrimaryColor,
                  shape: BoxShape.circle,
                  border: Border.all(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  width: 2),
                ),
                automaticIndicatorColorAdjustment: false,
                indicatorSize: TabBarIndicatorSize.label,
                isScrollable: true,
                //padding: EdgeInsets.zero,
                indicatorPadding: EdgeInsets.zero,
                labelPadding: EdgeInsets.all(getProportionateScreenWidth(2)),
                indicatorWeight: 2,
                //indicatorColor: Colors.white,
                padding:EdgeInsets.only(bottom: getProportionateScreenHeight(20)),
                controller: tabController,
                tabs: [
                  Tab(
                    height: getProportionateScreenWidth(70),
                    child:Container(
                      width: getProportionateScreenWidth(80),
                      height: getProportionateScreenWidth(70),
                      color: Color.fromRGBO(204, 221, 245, 1),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(7, 7, 7, 7),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("03",style: TextStyle(fontWeight:FontWeight.bold,fontSize: getProportionateScreenWidth(25),)),
                            Text("Monétaires",style: TextStyle(fontWeight:FontWeight.bold,fontSize: getProportionateScreenWidth(9),))
                        ],)
                    ),
                  ),
                  ),
                  Tab(
                  height: getProportionateScreenWidth(70),
                  child:  Container(
                    width: getProportionateScreenWidth(80),
                    height: getProportionateScreenWidth(70),
                    color: Color.fromRGBO(255, 236, 218, 1),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(7, 7, 7, 7),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("06",style: TextStyle(fontWeight:FontWeight.bold,fontSize: getProportionateScreenWidth(25),)),
                          Text("Obligataires",style: TextStyle(fontWeight:FontWeight.bold,fontSize: getProportionateScreenWidth(9),))
                      ],)
                      ),
                  ),
                  ),
                  Tab(
                     height: getProportionateScreenWidth(70),
                    child: Container(
                      width: getProportionateScreenWidth(80),
                      height: getProportionateScreenWidth(70),
                      color: Color.fromRGBO(208, 248, 238, 1),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(7, 7, 7, 7),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("12",style: TextStyle(fontWeight:FontWeight.bold,fontSize: getProportionateScreenWidth(25),)),
                            Text("Diversifiés",style: TextStyle(fontWeight:FontWeight.bold,fontSize: getProportionateScreenWidth(9),))
                        ],)
                      ),
                    ),
                  ),
                  Tab(
                     height: getProportionateScreenWidth(70),
                    child:Container(
                      width: getProportionateScreenWidth(80),
                      height: getProportionateScreenWidth(70),
                      color: Color.fromRGBO(226, 226, 226, 1),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(7, 7, 7, 7),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("08",style: TextStyle(fontWeight:FontWeight.bold,fontSize: getProportionateScreenWidth(25),)),
                            Text("Actions",style: TextStyle(fontWeight:FontWeight.bold,fontSize: getProportionateScreenWidth(9),))
                        ],)
                        ),
                    ),
                  )
                ],
                labelColor: const Color.fromARGB(0, 0, 0, 0),
              ),
          //  ],
         //),
          //SizedBox(height: getProportionateScreenHeight(20),),
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: [
              Column(
                  children: [
                    Portefeuilletem(
                    nomfond: demoFcp[0].fcp,
                    nbrepart: demoFcp[0].nbrpart,
                    cump: demoFcp[0].cump,
                    pmvaleur: demoFcp[0].pmvalpcg,
                    valeurtotal: demoFcp[0].pmvltl,
                    valeur: demoFcp[0].vlv,
                    cumpcumpcump: demoFcp[0].pmvl,
                    colorbody:Color.fromRGBO(236, 244, 255, 1),
                    couleurheader:Color.fromRGBO(204, 221, 245, 1),
                    press: () => Navigator.pushNamed(
                      context,
                      PortefeuilleDetailsScreen.routeName,
                      arguments:FcpDetailsArguments(fcp: demoFcp[0])
                    ))
                    ],
                  )
                ,
              
               Column(
                  children: [ Portefeuilletem(
                    nomfond: demoFcp[1].fcp,
                    nbrepart: demoFcp[1].nbrpart,
                    cump: demoFcp[1].cump,
                    pmvaleur: demoFcp[1].pmvalpcg,
                    valeurtotal: demoFcp[1].pmvltl,
                    valeur: demoFcp[1].vlv,
                    cumpcumpcump: demoFcp[1].pmvl,
                    colorbody:Color.fromRGBO(252, 248, 244, 1),
                    couleurheader:Color.fromRGBO(255, 236, 218, 1),
                    press: () => Navigator.pushNamed(
                      context,
                      PortefeuilleDetailsScreen.routeName,
                      arguments:FcpDetailsArguments(fcp: demoFcp[1])
                    ),
                  )
                  ]
              ),
               Column(
                  children:[Portefeuilletem(
                    nomfond: demoFcp[2].fcp,
                    nbrepart: demoFcp[2].nbrpart,
                    cump: demoFcp[2].cump,
                    pmvaleur: demoFcp[2].pmvalpcg,
                    valeurtotal: demoFcp[2].pmvltl,
                    valeur: demoFcp[2].vlv,
                    cumpcumpcump: demoFcp[2].pmvl,
                    colorbody:Color.fromRGBO(234, 252, 248, 1),
                    couleurheader:Color.fromRGBO(208, 248, 238, 1),
                    press: () => Navigator.pushNamed(
                      context,
                      PortefeuilleDetailsScreen.routeName,
                      arguments:FcpDetailsArguments(fcp: demoFcp[2])
                    ),
                  )
                  ]
                ),
               Column(
                  children: [ Portefeuilletem(
                    nomfond: demoFcp[3].fcp,
                    nbrepart: demoFcp[3].nbrpart,
                    cump: demoFcp[3].cump,
                    pmvaleur: demoFcp[3].pmvalpcg,
                    valeurtotal: demoFcp[3].pmvltl,
                    valeur: demoFcp[3].vlv,
                    cumpcumpcump: demoFcp[3].pmvl,
                    colorbody: Color.fromRGBO(247, 246, 246, 1),
                    couleurheader: Color.fromRGBO(226, 226, 226, 1),
                    press: () => Navigator.pushNamed(
                      context,
                      PortefeuilleDetailsScreen.routeName,
                      arguments:FcpDetailsArguments(fcp: demoFcp[3])
                    ),
                  
                ),
               ]
              ),
            ]
           )
          ),

          SizedBox(height: getProportionateScreenHeight(20),),
         /* Portefeuilletem(
            nomfond: "AAM Capital SÛR",
            //naturefond: 'Monétaire',
            nbrepart: "670",
            cump: '7 280',
            valeurtotal: "817 250",
            valeur:'8 500',
            cumpcumpcump: '1220',
            pmvaleur:'16,75%',
            press: () => Navigator.pushNamed(
            context,PortefeuilleDetailsScreen.routeName),
          ),
          SizedBox(height: getProportionateScreenHeight(20),),
           Portefeuilletem(
            nomfond: "AAM Obligatif",
            //naturefond: 'Obligataire',
            nbrepart: "670",
            cump: '7 280',
            valeurtotal: "817 250",
            valeur:'8 500',
            cumpcumpcump: '1220',
            pmvaleur:'16,75%',
            press: () => Navigator.pushNamed(
            context,PortefeuilleDetailsScreen.routeName),
          ),
          SizedBox(height: getProportionateScreenHeight(20),),
           Portefeuilletem(
            nomfond: "Epargne Action",
            //naturefond: 'Diversifié',
            nbrepart: "670",
            cump: '7 280',
            valeurtotal: "817 250",
            valeur:'8 500',
            cumpcumpcump: '1220',
            pmvaleur:'16,75%',
            press: () =>Navigator.pushNamed(
            context,PortefeuilleDetailsScreen.routeName),
          ),
          SizedBox(height: getProportionateScreenHeight(20),),
           Portefeuilletem(
            nomfond: "Epargne Action",
           // naturefond: 'Actions',
            nbrepart: "670",
            cump: '7 280',
            valeurtotal: "817 250",
            valeur:'8 500',
            cumpcumpcump: '1220',
            pmvaleur:'16,75%',
            press: () => Navigator.pushNamed(
            context,
            PortefeuilleDetailsScreen.routeName,
          ),
          ),*/
          
        ],)),
        
    ));
  }
}
