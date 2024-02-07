import 'package:flutter/material.dart';
import 'package:shop_app/screens/home/components/actualites.dart';
import 'package:shop_app/screens/home/components/carrousel.dart';
import 'package:shop_app/screens/home/components/chart.dart';
import 'package:shop_app/screens/home/components/section_title.dart';


import '../../../size_config.dart';
import 'discount_banner.dart';
import 'special_offers.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
           DiscountBanner(),
            SizedBox(height: getProportionateScreenHeight(20)),
            ChartClient(),
            //SizedBox(height: getProportionateScreenWidth(10)),
            //DiscountBanner(),
            SizedBox(height: getProportionateScreenHeight(10)),
           // Categories(),
           // PopularProducts(),
            //SizedBox(height: getProportionateScreenWidth(20)),
            SpecialOffers(),
            SizedBox(height: getProportionateScreenHeight(20)),
            Actualites()
            //SizedBox(height: getProportionateScreenHeight(10)),
            //Carouseelhome()
          
          ],
        ),
      ),
    );
  }
}
 