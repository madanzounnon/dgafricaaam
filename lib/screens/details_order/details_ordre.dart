import 'package:flutter/material.dart';
import 'package:shop_app/components/default_button.dart';
import 'package:shop_app/models/Ordre.dart';
import 'package:shop_app/screens/complete_profile/complete_profile_screen.dart';
import 'package:shop_app/screens/details/components/top_rounded_container.dart';
import 'package:shop_app/size_config.dart';
import 'components/body.dart';
import 'components/custom_app_bar.dart';

class DetailsOrdreScreen extends StatelessWidget {
  static String routeName = "/detailsordre";

  @override
  Widget build(BuildContext context) {
    final DetailsOrdreArguments agrs =
        ModalRoute.of(context)!.settings.arguments as DetailsOrdreArguments;
    return Scaffold(
      backgroundColor: Color(0xFFF5F6F9),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(AppBar().preferredSize.height),
        child: CustomAppBar(rating: 5),
      ),
      body: Body(ordre: agrs.ordre),
      bottomNavigationBar:  Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //ColorDots(product: product),
                    TopRoundedContainer(
                      color: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: SizeConfig.screenWidth * 0.15,
                          right: SizeConfig.screenWidth * 0.15,
                          bottom: getProportionateScreenWidth(20),
                          top: getProportionateScreenWidth(10),
                        ),
                        child: DefaultButton(
                          text: "Souscrire",
                           press: () {
                                Navigator.pushNamed(context, CompleteProfileScreen.routeName);
                            },
                        ),
                      ),
                    ),
                  ],
                ),
    );
  }
}

class DetailsOrdreArguments {
  final Ordre ordre;

  DetailsOrdreArguments({required this.ordre});
}
