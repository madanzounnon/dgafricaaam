import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/models/Fcp.dart';
import 'package:shop_app/screens/portefeuille/components/item_element.dart';
import 'package:shop_app/size_config.dart';

import 'components/body.dart';

class PortefeuilleDetailsScreen extends StatelessWidget {
  static String routeName = "/portefeuille_detail";
  
  String text="";
  @override
  Widget build(BuildContext context) {
    final FcpDetailsArguments agrs = ModalRoute.of(context)!.settings.arguments as FcpDetailsArguments;
    print(agrs);
    return Scaffold(
      appBar:buildAppBar(agrs.fcp), /*AppBar(
        title: Text("recapturatif du Portefeuille",
            style: TextStyle(fontSize: getProportionateScreenWidth(25),fontWeight:FontWeight.bold, color: Colors.black),),
      ),*/
      body: Body( fcp: agrs.fcp),
      //bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.portefeuille),
    );
  }
}

PreferredSizeWidget buildAppBar(Fcp fcp) {
  final IconData icon=FontAwesomeIcons.apple;
  final Color couleur=kPrimaryColor;
  final Color textcolor=Colors.white;
    return AppBar(
      
      title: Row(
        children: [
        Text(fcp.fcp!,style:TextStyle(color: Colors.white,fontSize:getProportionateScreenHeight(20))),
        ],
      ),
      shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
      ),   
      automaticallyImplyLeading : true,
      centerTitle:true,
      titleTextStyle:TextStyle(color: Colors.white),
      backgroundColor:pPrimaryColor,
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(220),
        child:Padding(padding:EdgeInsets.symmetric(horizontal: getProportionateScreenHeight(30)),
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ItemElement(cle: 'Nombre de parts détenues:',valeur: fcp.nbrpart,couleur: couleur,textcolor: textcolor,icon: icon),
            ItemElement(cle: 'CUMP:',valeur: fcp.cump,couleur: couleur,textcolor: textcolor,icon: icon),
            ItemElement(cle: 'VL veille:',valeur: fcp.vlv,couleur: couleur,textcolor: textcolor,icon: icon),
            ItemElement(cle: 'VL jour:',valeur: fcp.vlj,couleur: couleur,textcolor: textcolor,icon: icon),
            ItemElement(cle: '+/-Values:',valeur: fcp.pmvl,couleur: couleur,textcolor: textcolor,icon: icon),
            ItemElement(cle: '+/- Values totales:',valeur: fcp.pmvltl,couleur: couleur,textcolor: textcolor,icon: icon),
            ItemElement(cle: '% de +/-Values:',valeur:fcp.pmvalpcg ,couleur: couleur,textcolor: textcolor,icon: icon),
            SizedBox(height: getProportionateScreenHeight(20),),
        ],
        )
        ,) 
      ),
    );
  }
class FcpDetailsArguments {
  final Fcp fcp;
  FcpDetailsArguments({required this.fcp});
}
