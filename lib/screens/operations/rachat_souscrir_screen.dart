import 'package:flutter/material.dart';
import 'package:shop_app/models/opera.dart';
import 'package:shop_app/size_config.dart';
import '../../../constants.dart';
import '../../components/secondary_button.dart';
import '../moyen_paiement/moyen_paiement_screen.dart';

class RachatSouscrireScreen extends StatelessWidget {
   static String routeName = "/rachatp";
  @override
  Widget build(BuildContext context) {
    final op = ModalRoute.of(context)!.settings.arguments as Operationdetail;
    return Scaffold(
      appBar: buildAppBar(op),
      body: body(context),
    );
  }
   AppBar buildAppBar(Operationdetail op) {
    return AppBar(
      automaticallyImplyLeading: true,
      title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("${op.nom.toUpperCase()} - Rachat", style: TextStyle(fontSize:getProportionateScreenWidth(15),color: pPrimaryColor,fontWeight: FontWeight.bold),),
            Text(op.typeoperation,style: TextStyle(fontSize: getProportionateScreenWidth(11),color: kTextColor)),
          ],
        ),
        /*Container(
          height: 30,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Color.fromARGB(255, 176, 249, 201),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Icon(FontAwesomeIcons.bell,color: Color.fromARGB(255, 3, 185, 66) ,size: 20,),
            ],
          ),
        ),*/
  ]));
}
  Widget body(BuildContext context) {
     
    
    return Center(
      child: SingleChildScrollView(
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: Column(
            children: [
              // Text(
              //   "Réinitialisez votre \nmot de passe",
              //   textAlign: TextAlign.center,
              //   style: TextStyle(
              //     fontSize: getProportionateScreenWidth(28),
              //     color: pPrimaryColor,
              //     fontWeight: FontWeight.bold,
              //   ),
              // ),
              // SizedBox(height: getProportionateScreenHeight(20)),
              Container(
                child: Image.asset(
                  'assets/images/rachetersouscrire.jpeg',
                    height:getProportionateScreenHeight(300),
                    width: getProportionateScreenHeight(300),
                ),
              ),
              //SizedBox(height: getProportionateScreenHeight(10)),
              SecondaryButton(
                text: "Racheter",
                backcolor: Color.fromRGBO(255, 234, 225, 1), 
                textcolor: Color.fromRGBO(255, 118, 67, 1),
                 press: () {
                  Navigator.pushNamed(context,MoyenPaiementScreen.routeName,arguments:<String,String>{'type':'Rachat - Retrait'});
                },
              ),
              Text(
                "Retirez directement vos gains",
                textAlign: TextAlign.center,
              ),
              SizedBox(height: getProportionateScreenHeight(30)),
              SecondaryButton(
                text: "++ Racheter - souscrire",
                backcolor: Color.fromRGBO(0, 120, 20, 1),
                textcolor: Color.fromARGB(255, 255, 255, 255),
                press: () {
                  Navigator.pushNamed(context,MoyenPaiementScreen.routeName,arguments:<String,String>{'type':'Rachat - Souscription'});
                },
              ),
               Text(
                "Réinvestissez ces gains sur une\n nouvelle souscription ",
                ///textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

