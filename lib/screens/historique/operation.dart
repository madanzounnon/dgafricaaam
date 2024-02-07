import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/models/opera.dart';
import 'package:shop_app/size_config.dart';

class Operations extends StatelessWidget{
 const Operations({
    Key? key,
    required this.operation,
  }) : super(key: key);
  
  final Operation operation;
   
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
      },
      child: Container(
        padding: EdgeInsets.only(left: 16,right: 16,top: 5,bottom: 5),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  CircleAvatar(
                    backgroundColor: pPrimaryColor,
                    maxRadius: 30,
                    child:  IconButton(
                      icon: FaIcon(operation.icon,size: getProportionateScreenWidth(30),color: Colors.white),
                      /*SvgPicture.asset(iconurl!,
                      width:120,
                      height:120,
                      color: kPrimaryColor,
                    ),*/
                    iconSize:50,
                    onPressed: () {  },
                  ),
                  ),
                  SizedBox(width: 16,),
                  Expanded(
                    child: Container(
                      color: Colors.transparent,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(operation.motif, style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                        //  SizedBox(height: 6,),
                          Text(operation.fond.toUpperCase(),style: TextStyle(fontSize: 13,color: Colors.grey.shade600),),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Text(operation.date,style: TextStyle(fontSize: 12,fontWeight: operation.typeoperation?FontWeight.bold:FontWeight.normal),),
          ],
        ),
      ),
    );
  }
}