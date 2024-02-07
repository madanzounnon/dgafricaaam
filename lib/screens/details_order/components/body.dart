import 'package:flutter/material.dart';
import 'package:shop_app/components/default_button.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/models/Ordre.dart';
import 'package:shop_app/screens/complete_profile/complete_profile_screen.dart';
import 'package:shop_app/size_config.dart';
import 'ordre_description.dart';
import 'top_rounded_container.dart';
import 'ordre_icon.dart';

class Body extends StatelessWidget {
  final Ordre ordre;

  const Body({Key? key, required this.ordre}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        OrdreIcon(ordre: ordre),
        TopRoundedContainer(
          color: Colors.white,
          child: Column(
            children: [
              SizedBox(height: 5),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
                child: Text(
                  ordre.fcp!,
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(20),
                  vertical: getProportionateScreenWidth(10),
                ),
                child: Column(
                  mainAxisAlignment : MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Expanded(child: Text("Rendement cible:",style: TextStyle(fontSize: getProportionateScreenWidth(15),color: kSecondaryColor),)),
                        SizedBox(width: 8),
                        Text(ordre.redement!,style: TextStyle(fontSize: getProportionateScreenWidth(16),color: kPrimaryColor))
                      ],
                    ),
                    Row(

                      children: [
                        Expanded(child: Text("Valeur liquidative:",style: TextStyle(fontSize: getProportionateScreenWidth(15),color: kSecondaryColor))),
                        SizedBox(width: 8),
                        Text(ordre.liquidative!,style: TextStyle(fontSize: getProportionateScreenWidth(16),color: kPrimaryColor))
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(child: Text("Performance jounalière",style: TextStyle(fontSize: getProportionateScreenWidth(15),color: kSecondaryColor))),
                        SizedBox(width: 8),
                        Text(ordre.performanceJ!,style: TextStyle(fontSize: getProportionateScreenWidth(16),color: kPrimaryColor))
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(child: Text("Performance à l'origine:",style: TextStyle(fontSize: getProportionateScreenWidth(15),color: kSecondaryColor))),
                        SizedBox(width: 8),
                        Text(ordre.performanceO!,style: TextStyle(fontSize: getProportionateScreenWidth(16),color: kPrimaryColor))
                      ],
                    ),
                  ]
                )
              ),
              OrdreDescription(
                ordre: ordre,
                pressOnSeeMore: () {},
              ),
              
            ],
          ),
        ),
      ],
    );
  }
}
