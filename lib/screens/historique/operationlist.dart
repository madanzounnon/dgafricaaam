import 'package:flutter/material.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/screens/historique/operation.dart';
import 'package:shop_app/size_config.dart';

import '../../models/opera.dart';

class OperationList extends StatefulWidget{
   const OperationList({
      Key? key,
      required this.operations
    }) : super(key: key);

    final List<Operation> operations;
    @override  
  _OperationListtState createState() => _OperationListtState();
}

class _OperationListtState extends State<OperationList> {
   
  late int lenghtop;
  @override
  void initState() {
    super.initState();
    lenghtop = 4;
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 5, right: 5),
        child: Column(
          children:[
          ListView.builder(
          itemCount: lenghtop,
          shrinkWrap: true,
          padding: EdgeInsets.only(top: 16),
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index){
            return Operations(operation: operations[index],);
          },
        ),
        GestureDetector(
          onTap: () =>  setState(() {
            if (lenghtop<5) {
              lenghtop= operations.length;
            }else{
              lenghtop=4;
            }
                
            }),
          child: Text((lenghtop < 5)?"Voir tout":"Reduire la liste",
            style: TextStyle(decoration: TextDecoration.underline,color: pPrimaryColor,fontSize:getProportionateScreenWidth(15)),
          ),
        ),
        SizedBox(height: getProportionateScreenHeight(10),),
      ]),
    );
  }
}