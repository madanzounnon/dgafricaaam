import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shop_app/components/coustom_bottom_nav_bar.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/enums.dart';
import 'package:shop_app/screens/portefeuille/components/item_element.dart';
import 'package:shop_app/size_config.dart';

class InformationPersonnelleScreen extends StatefulWidget {
  @override
   static String routeName = "/information";
  _InformationPersonnelleScreenState createState() => _InformationPersonnelleScreenState();
}

class _InformationPersonnelleScreenState extends State<InformationPersonnelleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      backgroundColor: Colors.white,
      body: getBody(),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.profile),
    );
  }
  Widget getBody() {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 0, right: 0, top: 0),
          child: 
          SizedBox(
            width: double.infinity,
            height: getProportionateScreenHeight(170),
              child:Stack(
                children:[
                  Container(
                   width: double.infinity,
                    height: getProportionateScreenHeight(170),
                    decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(300),
                        image: DecorationImage(
                           opacity: 0.02,
                            image: AssetImage("assets/images/usercarr.jpg"), fit: BoxFit.cover)),
                  ),
                   Container(
                   width: double.infinity,
                    height: getProportionateScreenHeight(170),
                    decoration: BoxDecoration(
                       // borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            image: AssetImage("assets/images/decoruser.png"), fit: BoxFit.cover)),
                  ),
                   Container(
                    width: double.infinity,
                    height: getProportionateScreenHeight(170),
                    decoration: BoxDecoration(
                       // color: pPrimaryColor,
                       // borderRadius: BorderRadius.circular(10),
                       //image: DecorationImage( image: AssetImage("assets/images/decoruser.png"), fit: BoxFit.cover)
                        ),
                    child:Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                          SizedBox(
                            height: 120,
                            width: 120,
                            child: Stack(
                              fit: StackFit.expand,
                              clipBehavior: Clip.none,
                              children: [
                                CircleAvatar(
                                  backgroundImage: AssetImage("assets/images/usercarr.jpg"),
                                ),
                               /* Positioned(
                                  right: 12,
                                  bottom: 0,
                                  child: SizedBox(
                                    height: 40,
                                    width: 90,
                                    child: TextButton(
                                      style: TextButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(50),
                                          side: BorderSide(color: Colors.white),
                                        ),
                                        primary: Colors.white,
                                        backgroundColor: Color.fromRGBO(204,221,245,1),
                                      ),
                                      onPressed: () {},
                                      child: Text('Modifier',style: TextStyle(color: pPrimaryColor),),
                                    ),
                                  ),
                                )*/
                              ],
                            ),
                          ),
                          SizedBox(
                            width: getProportionateScreenWidth(10),
                          ),
                      ],
                    )
                  )
                ]
              )
            ),
        ),  
        Padding(padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20),vertical: getProportionateScreenHeight(10)),
        child: Text('Compte', style: TextStyle(fontSize: getProportionateScreenHeight(18),fontWeight: FontWeight.bold),),),
        SizedBox(
           height: getProportionateScreenHeight(8),
        ),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
              color: Color.fromRGBO(204,221,245,1), borderRadius: BorderRadius.only(topLeft:Radius.circular(30),topRight: Radius.circular(30)),
          ),
        child:
        Padding(
          padding: EdgeInsets.only(left: 15, right: 15,top: 20, bottom: getProportionateScreenHeight(20)),
          child: Column( children: [
               
ItemElement(cle: 'Num de Compte',textcolor: pPrimaryColor,valeur: '12365478963',),
SizedBox(  height: getProportionateScreenHeight(8), ),
            ItemElement(cle: 'Email',textcolor: pPrimaryColor,valeur: 'adanzmarico@gmail.com',),
            SizedBox(  height: getProportionateScreenHeight(8), ),
            ItemElement(cle: 'Num de Tel',textcolor: pPrimaryColor,valeur: '12365478963',),
            SizedBox(  height: getProportionateScreenHeight(8), ),
            ItemElement(cle: 'Mot de passe',textcolor: pPrimaryColor,valeur: '***********',),          
           ]
              )
            ),
        ), 
         SizedBox(
           height: getProportionateScreenHeight(8),
        ),
          Padding(padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20),vertical: getProportionateScreenHeight(10)),
        child: Text('Information personnelle', style: TextStyle(fontSize: getProportionateScreenHeight(18),fontWeight: FontWeight.bold),),),
         Container(
          width: double.infinity,
          decoration: BoxDecoration(
              color: Color.fromRGBO(204,221,245,1), borderRadius: BorderRadius.only(topLeft:Radius.circular(30),topRight: Radius.circular(30)),
          ),
        child:
        Padding(
          padding: EdgeInsets.only(left: 15, right: 15,top: 20,bottom: getProportionateScreenHeight(20)),
          child: Column( children: [
            ItemElement(cle: 'Prénom',textcolor: pPrimaryColor,valeur: '12365478963',),
             SizedBox(  height: getProportionateScreenHeight(8), ),
            ItemElement(cle: 'Nom',textcolor: pPrimaryColor,valeur: 'adanzmarico@gmail.com',),
            SizedBox(  height: getProportionateScreenHeight(8), ),
            ItemElement(cle: 'Civilité',textcolor: pPrimaryColor,valeur: '12368478963',),
            SizedBox(  height: getProportionateScreenHeight(8), ),
            ItemElement(cle: 'Pays',textcolor: pPrimaryColor,valeur: '***********',),
            SizedBox(  height: getProportionateScreenHeight(8), ),
            ItemElement(cle: 'Ville',textcolor: pPrimaryColor,valeur: '12368478963',),
            SizedBox(  height: getProportionateScreenHeight(8), ),
            ItemElement(cle: 'Adresse Actuel',textcolor: pPrimaryColor,valeur: 'Vedoko M/TCHA',),
            SizedBox(  height: getProportionateScreenHeight(8), ),
            ItemElement(cle: 'Pièce ID',textcolor: pPrimaryColor,valeur: '10286688128',),
            SizedBox(  height: getProportionateScreenHeight(8), ),
            ItemElement(cle: 'Num pièce',textcolor: pPrimaryColor,valeur: '12368478963',),
            SizedBox(  height: getProportionateScreenHeight(8), ),
            ItemElement(cle: 'Expire le',textcolor: pPrimaryColor,valeur: '28-04-2023',),
           ]
              )
            ),
        ), 
    ]);
  }

AppBar buildAppBar(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: true,
      title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("Information personnelle",style: TextStyle(fontSize: getProportionateScreenWidth(20),fontWeight: FontWeight.bold,color:pPrimaryColor),),
        Container(
          height: 30,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Color.fromARGB(255, 176, 249, 201),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Icon(FontAwesomeIcons.bell,color: Color.fromARGB(255, 3, 185, 66) ,size: 20,),
             // SizedBox(width: 2,),
             /* Padding(
                padding: EdgeInsets.only(left: 2,right: 8,top: 2,bottom: 2),
                child:Text("Dépôt",style: TextStyle(color: pPrimaryColor, fontSize: 14,fontWeight: FontWeight.bold),),)*/
            ],
          ),
        ),
  ]));
  }
}
