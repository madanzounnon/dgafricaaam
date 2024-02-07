import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/components/coustom_bottom_nav_bar.dart';
import 'package:shop_app/enums.dart';
import 'package:shop_app/size_config.dart';

import 'components/body.dart';

class OrdresScreen extends StatelessWidget {
  static String routeName = "/ordres";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PLACER UN ORDRE",
            style: TextStyle(fontSize: getProportionateScreenWidth(20),fontWeight:FontWeight.bold, color: Colors.black),),
      ),
      body: Body(),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.operations),
    );
  }
}
