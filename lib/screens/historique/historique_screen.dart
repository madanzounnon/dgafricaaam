// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:shop_app/components/coustom_bottom_nav_bar.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/enums.dart';
import 'package:shop_app/models/opera.dart';
import 'package:shop_app/screens/historique/components/alaune_offers.dart';
import 'package:shop_app/screens/historique/components/body.dart';
import 'package:shop_app/screens/historique/operation.dart';

import '../../../size_config.dart';

/*class HistoriqueScreen extends StatefulWidget {
  static String routeName = "/historique";
  @override
  _HistoriqueScreenState createState() => _HistoriqueScreenState();
}

class _HistoriqueScreenState extends State<HistoriqueScreen> {
  @override
  Widget build(BuildContext context) {
    int taille = 3;
   
    return Scaffold(
        appBar: buildAppBar(context),
        body: getBody(taille),
        bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.transactions),
    );
  }*/
class HistoriqueScreen extends StatelessWidget {
  static String routeName = "/historique";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: buildAppBar(context),
      body: Body(),
      //bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.home),
    );
  }
}

AppBar buildAppBar(BuildContext context) {
  return AppBar(
      automaticallyImplyLeading: true,
      title: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(
          "Hitoriques",
          style: TextStyle(
              fontSize: getProportionateScreenWidth(20),
              fontWeight: FontWeight.bold,
              color: pPrimaryColor),
        ),
        /* Container(
          height: 30,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Color.fromARGB(255, 176, 249, 201),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Icon(Icons.add_circle,color: Color.fromARGB(255, 3, 185, 66) ,size: 32,),
              Padding(
                padding: EdgeInsets.only(left: 2,right: 8,top: 2,bottom: 2),
                child:Text("Dépôt",style: TextStyle(color: pPrimaryColor, fontSize: 14,fontWeight: FontWeight.bold),),)
            ],
          ),
        ),*/
      ]));
}
  /* buildAppBar(BuildContext context) {
    return AppBar(
        title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Hitorique",style: TextStyle(fontSize: getProportionateScreenWidth(18),fontWeight: FontWeight.bold,color:Colors.black),),
          Container(
            padding: EdgeInsets.only(left: 0,right: 8,top: 0,bottom: 2),
            height: 30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.pink[50],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.add_circle,color: pPrimaryColor,size: 35,),
                      
                Text("Dépôt",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
              ],
            ),
          ),
    ]));
  }
 
 
 
 Widget getBody(int taille) {
     return
      ListView(
        children:[ 
          Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SafeArea(
              child: Padding(
                padding: EdgeInsets.only(left: 16,right: 16,top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Hitorique",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                    Container(
                      padding: EdgeInsets.only(left: 0,right: 8,top: 2,bottom: 2),
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.pink[50],
                      ),
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.add_circle,color: pPrimaryColor,size: 30,),
                          SizedBox(width: 2,),
                          Text("Dépôt",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(left: 5, right: 5),
                child: Column(children:[
                ListView.builder(
                itemCount: taille,
                shrinkWrap: true,
                padding: EdgeInsets.only(top: 16),
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index){
                  return OperationList(
                    id: operations[index].id,
                    montant: operations[index].montant,
                    motif: operations[index].motif,
                    icon: operations[index].icon,
                    date: operations[index].date,
                    typeoperation: (index == 0 || index == 3)?true:false,
                  );
                },
              ),
              GestureDetector(
                onTap: () =>  setState(() {
                      taille= operations.length;
                  }),
                child: Text(
                  "Acceder à l'accueil",
                  style: TextStyle(decoration: TextDecoration.underline,color: pPrimaryColor,fontSize:getProportionateScreenWidth(15)),
                ),
              ),
              SizedBox(height: getProportionateScreenHeight(20),),
              ]),),
          ],
        ),
        
        ]
      );
 }
}*/

