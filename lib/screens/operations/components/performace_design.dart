
import 'package:flutter/material.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/size_config.dart';

class PerformaceDesign extends StatelessWidget {
const PerformaceDesign({
    Key? key,
    this.cle,
    this.valeur,
    this.date,
    this.press,
  }) : super(key: key);
  final  String? cle,valeur,date;
  final Function? press;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children:[
                  Text(cle!,style: TextStyle(fontSize: getProportionateScreenWidth(15),color: pPrimaryColor), textAlign: TextAlign.start,),
                  Text(date!,style: TextStyle(fontSize: getProportionateScreenWidth(10)), textAlign: TextAlign.start,)
                ] ),
              SizedBox(width: 5),
              Text(valeur!,style: TextStyle(fontSize: getProportionateScreenWidth(15)))
            ],
          ),
      ],
    ); 
  }
}