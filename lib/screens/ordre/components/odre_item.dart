import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shop_app/components/secondary_button.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/screens/transactions/transaction_screen.dart';

import '../../../size_config.dart';

class OrdreItem extends StatelessWidget {
const OrdreItem({
    Key? key,
    this.fcp,this.redement,this.liquidative,this.performanceJ,this.performanceO,this.iconurl,
    this.couleur,this.textcolor,
    this.press,
    this.icon,
  }) : super(key: key);
  final String? fcp,redement,liquidative,performanceJ,performanceO,iconurl;
  final IconData? icon;
  final Color? couleur;
  final Color? textcolor;
  final Function? press;
  @override
  Widget build(BuildContext context) {
    return Container(
      height:getProportionateScreenWidth(280),
      width: double.infinity,
      margin: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(20),
        vertical: getProportionateScreenWidth(10),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(20),
        vertical: getProportionateScreenWidth(15),
      ),
      decoration: BoxDecoration(
        color:couleur,
         /*borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),*/
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisAlignment : MainAxisAlignment.center,
        children: [
          Row(
            children: [
             IconButton(
                icon: FaIcon(icon,size: 60,color: kPrimaryColor),
                /*SvgPicture.asset(iconurl!,
                width:120,
                height:120,
                color: kPrimaryColor,
              ),*/
              iconSize:60,
              onPressed: () {  },
            ),
            SizedBox(width: 10),
          Expanded(child:Text(fcp!,style: 
            TextStyle(
              fontSize: getProportionateScreenWidth(20),
              color: textcolor
            ),
          )
          )
            ],
          ),
          SizedBox(height: 5),
          Row(
            children: [
              
              Expanded(child: Text("Rendement cible:",style: TextStyle(fontSize: getProportionateScreenWidth(15),color: textcolor),)),
              SizedBox(width: 8),
              Text(redement!,style: TextStyle(fontSize: getProportionateScreenWidth(16),color: textcolor))
            ],
          ),
          Row(
            children: [
              Expanded(child: Text("Valeur liquidative:",style: TextStyle(fontSize: getProportionateScreenWidth(15),color: textcolor))),
              SizedBox(width: 8),
              Text(liquidative!,style: TextStyle(fontSize: getProportionateScreenWidth(16),color: textcolor))
            ],
          ),
          Row(
            children: [
              Expanded(child: Text("Performance jounalière",style: TextStyle(fontSize: getProportionateScreenWidth(15),color: textcolor))),
              SizedBox(width: 8),
              Text(performanceJ!,style: TextStyle(fontSize: getProportionateScreenWidth(16),color: textcolor))
            ],
          ),
          Row(
            children: [
              Expanded(child: Text("Performance à l'origine:",style: TextStyle(fontSize: getProportionateScreenWidth(15),color: textcolor))),
              SizedBox(width: 8),
              Text(performanceO!,style: TextStyle(fontSize: getProportionateScreenWidth(16),color: textcolor))
            ],
          ),
          SizedBox(height: 15),
          SecondaryButton(
            text: "Passer un ordre",
            backcolor: textcolor,
            textcolor: couleur,
            press: press,
          ),
          /*GestureDetector(
            onTap: () => Navigator.pushNamed(context, SignUpScreen.routeName),
            child: Text(
              "Souscrire",
              style: TextStyle(
                  fontSize: getProportionateScreenWidth(16),
                  color: kPrimaryColor),
            ),
          ),*/
        ]
      )
      
    );
  }
}
