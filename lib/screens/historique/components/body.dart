import 'package:flutter/material.dart';
import 'package:shop_app/models/opera.dart';
import 'package:shop_app/screens/historique/components/alaune_offers.dart';
import 'package:shop_app/screens/historique/operationlist.dart';
import 'package:shop_app/screens/home/components/special_offers.dart';

import '../../../../size_config.dart';

class Body extends StatelessWidget {
  final List<Operation> operationlis= operations;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            OperationList(operations: operationlis,),
            SizedBox(height: getProportionateScreenHeight(20)),
            //SpecialOffers(),
           AlauneOffers()
          ],
        ),
      ),
    );
  }
}
 