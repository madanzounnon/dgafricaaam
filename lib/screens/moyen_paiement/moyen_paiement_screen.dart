import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shop_app/size_config.dart';
import '../../../constants.dart';
import '../details/components/top_rounded_container.dart';

class MoyenPaiementScreen extends StatelessWidget {
   static String routeName = "/moyen_paiment";
  @override
  Widget build(BuildContext context) {
   final Map type = ModalRoute.of(context)!.settings.arguments as Map;
    print(type);
    return Scaffold(
      appBar: buildAppBar(type["type"]),
      body: body(context),
    );
  }
   AppBar buildAppBar(String title) {
    return AppBar(
      automaticallyImplyLeading: true,
      title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,style: TextStyle(fontSize: getProportionateScreenWidth(20),fontWeight: FontWeight.bold,color:pPrimaryColor),),
        Container(
          height: 30,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            //color: Color.fromARGB(255, 176, 249, 201),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Icon(FontAwesomeIcons.bell,color: Color.fromARGB(255, 3, 185, 66) ,size: 20,),
            ],
          ),
        ),
  ]));
}
  Widget body(BuildContext context) {
    return  SingleChildScrollView(
        child:Column(
          crossAxisAlignment:CrossAxisAlignment.start,
          children: 
        [
          SizedBox(height: getProportionateScreenHeight(30)),
           Container(
            padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
            child: Text("Moyen de paiement",style: TextStyle(fontWeight: FontWeight.bold,fontSize: getProportionateScreenWidth(18)),),
          ),
          
          TopRoundedContainer(
                color: Color(0xFFF6F7F9),
                child:Container(
              padding: EdgeInsets.only(left: getProportionateScreenWidth(20),right: getProportionateScreenWidth(20),top: 10,bottom: 0),
              //color:kSecondaryColor.withOpacity(0.2),
              child: Column(
                crossAxisAlignment:CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                GestureDetector(child: Image.asset("assets/images/KKiaPay.png",
                height: getProportionateScreenWidth(90),),onTap: () => {}),
                SizedBox(width: getProportionateScreenHeight(15)),
                GestureDetector(child: Image.asset("assets/images/FedaPay.png",
                height: getProportionateScreenWidth(90),),onTap: () => {})
              ],),
              SizedBox(height: getProportionateScreenHeight(20)),
               Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                GestureDetector(child: Image.asset("assets/images/masterc.png",
                height: getProportionateScreenWidth(90),
                ),onTap: () => {},),
                SizedBox(width: getProportionateScreenHeight(15)),
                GestureDetector(child: Image.asset("assets/images/visa.png",height: getProportionateScreenWidth(90),
                ),onTap: () => {})
              ],),
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
             /*  Container(
                padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(50)),
                child: SvgPicture.asset("assets/icons/visa.svg")
              )*/
              SizedBox(height: getProportionateScreenHeight(30)),
              ])),
             /* SizedBox(height: getProportionateScreenHeight(30)),
              Text(
                "Vous n'avez pas encore ajouté aucun\n moyen de paiement",
                textAlign: TextAlign.center,
              ),
              SizedBox(height: getProportionateScreenHeight(30)),
              DefaultButton(
                text: "Ajouter",
                press: () {
                 
                },
              ),
            ],
          ),
        ),*/
          ),
        ])
    );
  }
}

