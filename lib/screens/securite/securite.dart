
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shop_app/screens/securite/code_pin.dart';
import '../../constants.dart';
import '../../size_config.dart';

class SecuritePage extends StatefulWidget {

  static String routeName = "/securite";

  @override
  _SecuritePageState createState() => _SecuritePageState();
}

class _SecuritePageState extends State<SecuritePage> {
 
 bool switchvalue=true;
 @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: buildAppBar(context),
      body: getbody(),
     // bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.profile),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: true,
      title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("Sécurité",style: TextStyle(fontSize: getProportionateScreenWidth(20),fontWeight: FontWeight.bold,color:pPrimaryColor),),
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
            ],
          ),
        ),
  ]));
}
  Widget getbody(){
    return ListView(
        children: [
          Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: Column(
          children: [
              SizedBox(height: SizeConfig.screenHeight * 0.05),
              Container(
                padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(50)),
                child: SvgPicture.asset(
                  'assets/icons/securite.svg',
                    height:getProportionateScreenHeight(150),
                    width: getProportionateScreenHeight(150),
                ),
              ),
              SizedBox(height: getProportionateScreenHeight(20)),
              Text(
                "Renforcer la sécurité de\nvotre compte",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: getProportionateScreenWidth(25),
                  color: pPrimaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: getProportionateScreenHeight(30)),
              Container(
              padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
              width: double.infinity,
              decoration: BoxDecoration(
                color:pPrimaryColor.withOpacity(0.32),
                borderRadius: BorderRadius.circular(30),
              ),
              child:Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
               Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                     // Navigator.pushNamed(context, CodePinScreen.routeName);
                    },
                    child: Text('Empreintes digitales',style: TextStyle(color: pPrimaryColor, fontWeight: FontWeight.w500,fontSize: getProportionateScreenWidth(18)),),
                  ),
                  Switch(
                    activeColor: Colors.green,
                    inactiveThumbColor: pPrimaryColor,
                    inactiveTrackColor: pPrimaryColor.withOpacity(0.60),
                    value: switchvalue, 
                    onChanged: ((bool){
                    setState(() {
                        switchvalue=bool; 
                    });
                  }))
                ],
              ),
              /*Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, CodePinScreen.routeName);
                    },
                    child: Text('Modifier',style: TextStyle(color: pPrimaryColor, fontWeight: FontWeight.w500,fontSize: getProportionateScreenWidth(15)),),
                  ),
                ]
              )*/
              ],)
            ),
            Text(
                "Déverrouillez l’application avec vos empreintes digitales",
                textAlign: TextAlign.center,
              ),
            SizedBox(height: getProportionateScreenHeight(30)),
              Container(
              padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
              width: double.infinity,
              decoration: BoxDecoration(
                color:pPrimaryColor.withOpacity(0.32),
                borderRadius: BorderRadius.circular(30),
              ),
              child:Column(children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, CodePinScreen.routeName);
                    },
                    child: Text('PIN Spécifique',style: TextStyle(color: pPrimaryColor, fontWeight: FontWeight.w500,fontSize: getProportionateScreenWidth(18)),),
                  ),
                  Switch(
                    activeColor: Colors.green,
                    inactiveThumbColor: pPrimaryColor,
                    inactiveTrackColor: pPrimaryColor.withOpacity(0.60),
                    value: switchvalue, 
                    onChanged: ((bool){
                    setState(() {
                        switchvalue=bool; 
                    });
                  }))
                ],
              ),
              /*Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                    },
                    child: Text('Modifier',style: TextStyle(color: pPrimaryColor, fontWeight: FontWeight.w500,fontSize: getProportionateScreenWidth(15)),),
                  ),
                ]
              )*/
              ],)
            ),
            Text(
                "Déverrouillez l’application avec un code personnelle spécifique ",
                textAlign: TextAlign.center,
            ),
          ],
        ),
      ), 
    )]);
  }
}
