import 'package:flutter/material.dart';
import 'package:shop_app/components/coustom_bottom_nav_bar.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/enums.dart';
import 'package:shop_app/size_config.dart';

import 'components/body.dart';

class PortefeuilleScreen extends StatelessWidget {
  static String routeName = "/portefeuille";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      /*AppBar(
        title: Text("recapturatif du Portefeuille",
            style: TextStyle(fontSize: getProportionateScreenWidth(25),fontWeight:FontWeight.bold, color: Colors.black),),
      ),*/
      body: Body(),
      //bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.portefeuille),
    );
  }
}

PreferredSizeWidget buildAppBar() {
  return AppBar(
    titleTextStyle: TextStyle(color: Colors.white),
    title: Row(
      children: [
        IconButton(
            icon: Icon(Icons.wallet_giftcard),
            onPressed: () => {},
            color: Colors.white),
        const SizedBox(width: 5),
        Text('Portefeuille ',
            style: TextStyle(
                color: Colors.white,
                fontSize: getProportionateScreenHeight(20))),
      ],
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(30),
        bottomRight: Radius.circular(30),
      ),
    ),
    /*actions: [
        Row(children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 8,right: 8,top: 2,bottom: 2),
          height: 30,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: pSuccessColor,
          ),
          child: Row(
            children: <Widget>[
              Icon(Icons.add,color: pPrimaryColor,size: 20,),
              SizedBox(width: 2,),
              Text("Dépôt",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,),),
            ],
          ),
        ),
        const SizedBox(width: 10)])
      ],*/

    automaticallyImplyLeading: true,
    centerTitle: true,
    backgroundColor: pPrimaryColor,
    bottom: PreferredSize(
        preferredSize: Size.fromHeight(180),
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenHeight(20)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Total de vos plus ou moins values",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: getProportionateScreenWidth(18)),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: getProportionateScreenHeight(3),
              ),
              Text("22.859.673 F",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: getProportionateScreenHeight(25),
                      fontWeight: FontWeight.bold)),
              SizedBox(
                height: getProportionateScreenHeight(10),
              ),
              /* SizedBox(
              width: 230,
              child: ElevatedButton(
                onPressed: () => 'Null',
                style: ButtonStyle(
                    backgroundColor:MaterialStateProperty.all(Colors.white)),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("859.673 FCFA",style:TextStyle(color:pPrimaryColor,
                        fontSize: getProportionateScreenHeight(25),
                        //decoration:TextDecoration.underline,
                        fontWeight: FontWeight.w800
                      )),
                    ],
                  ),
                ),
            )
          ),*/
              SizedBox(
                height: getProportionateScreenHeight(20),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding:
                        EdgeInsets.only(left: 8, right: 8, top: 2, bottom: 2),
                    height: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: pSuccessligthColor,
                    ),
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.add,
                          color: pPrimaryColor,
                          size: 20,
                        ),
                        SizedBox(
                          width: 2,
                        ),
                        Text(
                          "8,64 %",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        SizedBox(
                          width: getProportionateScreenHeight(20),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: getProportionateScreenHeight(10),
                  ),
                  Text(
                    "884 623 F",
                    style: TextStyle(
                        fontSize: getProportionateScreenWidth(20),
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ],
              ),
              SizedBox(
                height: getProportionateScreenHeight(20),
              ),
            ],
          ),
        )),
  );
}
