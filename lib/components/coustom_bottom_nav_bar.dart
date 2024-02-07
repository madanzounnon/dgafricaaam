import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_app/screens/compte/account_page.dart';
import 'package:shop_app/screens/home/components/icon_btn_with_counter.dart';
import 'package:shop_app/screens/home/home_screen.dart';
import 'package:shop_app/screens/historique/historique_screen.dart';
import 'package:shop_app/screens/portefeuille/portefeuille_screen.dart';
import 'package:shop_app/screens/operations/operation_screen.dart';
import 'package:shop_app/size_config.dart';

import '../constants.dart';
import '../enums.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    Key? key,
    required this.selectedMenu,
  }) : super(key: key);

  final MenuState selectedMenu;

  @override
  Widget build(BuildContext context) {
    final Color inActiveIconColor = Color(0xFFB6B6B6);
    return Container(
      padding: EdgeInsets.symmetric(vertical: 6),
      height: getProportionateScreenHeight(62),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -15),
            blurRadius: 20,
            color: Color.fromARGB(255, 85, 85, 85).withOpacity(0.15),
            spreadRadius:30 
          ),
        ],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: SafeArea(
          top: false,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [ 
                   Expanded(child: IconButton(
                    icon: SvgPicture.asset(
                    "assets/icons/Shop Icon.svg",
                    color: MenuState.home == selectedMenu
                        ? pPrimaryColor
                        : inActiveIconColor,
                   ),
                    onPressed: () =>
                        Navigator.pushNamed(context, HomeScreen.routeName),
                    )),
                   Text('Accueil',style:TextStyle(fontSize:10,color: MenuState.home == selectedMenu ? pPrimaryColor: inActiveIconColor))
                   ,
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [ 
                   Expanded(child:IconButton(
                    icon: SvgPicture.asset("assets/icons/money-bill-transfer-solid.svg",
                    color: MenuState.operations == selectedMenu
                          ? pPrimaryColor
                          : inActiveIconColor,),
                    onPressed: () => Navigator.pushNamed(context, OperationScreen.routeName),
                    ),
                  ),
                   Text('Opération',style:TextStyle(fontSize:10,color: MenuState.operations == selectedMenu ? pPrimaryColor: inActiveIconColor))
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [ 
                   Expanded(child: IconBtnWithCounter(
                   // svgSrc: "assets/icons/wallet-solid.svg",
                    active: MenuState.portefeuille == selectedMenu,
                    press: () => Navigator.pushNamed(context, PortefeuilleScreen.routeName),
                    ),
                  ),
                  //Text('Portefeuille',style:TextStyle(color: MenuState.ordre == selectedMenu ? pPrimaryColor: inActiveIconColor))
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [ 
                   Expanded(child:IconButton(
                icon: SvgPicture.asset(
                  "assets/icons/chart-simple-solid.svg",
                   color: MenuState.historique == selectedMenu
                      ? pPrimaryColor
                      : inActiveIconColor,),
                onPressed: () => Navigator.pushNamed(context, HistoriqueScreen.routeName),
                ),),
                   Text('Historique',style:TextStyle(fontSize:10, color: MenuState.historique == selectedMenu ? pPrimaryColor: inActiveIconColor))
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [ 
                   Expanded(child:IconButton(
                      icon: SvgPicture.asset(
                        "assets/icons/User Icon.svg",
                        color: MenuState.profile == selectedMenu
                            ? pPrimaryColor
                            : inActiveIconColor,
                      ),
                      onPressed: () =>
                          Navigator.pushNamed(context, AccountPage.routeName),
                    )
                  ),
                   Text("Compte",style:TextStyle(fontSize:10,color: MenuState.profile == selectedMenu ? pPrimaryColor: inActiveIconColor))
                ],
              ),
            ], 
          )),
    );
  }
}
