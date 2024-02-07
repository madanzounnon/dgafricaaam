import 'package:flutter/material.dart';
import 'package:shop_app/models/Fcp.dart';
import 'package:shop_app/screens/portefeuille_details/components/portef_item_d.dart';
import 'package:shop_app/screens/portefeuille_details/portefeuille_detais_screen.dart';
import 'package:shop_app/size_config.dart';

class Body extends StatelessWidget {
  final Fcp fcp;
  const Body({Key? key, required this.fcp}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: getProportionateScreenHeight(10),horizontal: getProportionateScreenWidth(20)),
      child: Column(
         children: List.generate(fcp.fcpdetails.length, (index) {
                return PortefeuilletemD(
                  date: fcp.fcpdetails[index].date,
                  nbrpart: fcp.fcpdetails[index].nbrpart,
                  cump: fcp.fcpdetails[index].cump,
                  pmvalpcg: fcp.fcpdetails[index].pmvalpcg,
                  pmvltl: fcp.fcpdetails[index].pmvltl,
                  vlv: fcp.fcpdetails[index].vlv,
                  vlj: fcp.fcpdetails[index].vlj,
                  pmvl: fcp.fcpdetails[index].pmvl,
                );
              }),
        //children: 
         /* PortefeuilletemD(
            date:'Lundi 01 jan 2023',
            nomfond: "AAM Capital SÛR",
            naturefond: 'Monétaire',
            nbrepart: "670",
            cump: '7 280',
            valeurtotal: "817 250",
            valeur:'8 500',
            cumpcumpcump: '1220',
            pmvaleur:'16,75%',
            press: () =>  Navigator.pushNamed(
            context,PortefeuilleDetailsScreen.routeName),
          ),
          SizedBox(height: getProportionateScreenHeight(20),),
           PortefeuilletemD(
            date:'Jeudi 08 jan 2023',
            nomfond: "AAM Obligatif",
            naturefond: 'Obligataire',
            nbrepart: "670",
            cump: '7 280',
            valeurtotal: "817 250",
            valeur:'8 500',
            cumpcumpcump: '1220',
            pmvaleur:'16,75%',
            press: () =>  Navigator.pushNamed(
            context,PortefeuilleDetailsScreen.routeName),
          ),
          SizedBox(height: getProportionateScreenHeight(20),),
           PortefeuilletemD(
            date:'Mardi 03 Fev 2023',
            nomfond: "Epargne Action",
            naturefond: 'Diversifié',
            nbrepart: "670",
            cump: '7 280',
            valeurtotal: "817 250",
            valeur:'8 500',
            cumpcumpcump: '1220',
            pmvaleur:'16,75%',
            press: () =>  Navigator.pushNamed(
            context,PortefeuilleDetailsScreen.routeName),
          ),
          SizedBox(height: getProportionateScreenHeight(20),),
           PortefeuilletemD(
            date:'Ventredi 10 Fev 2023',
            nomfond: "Epargne Action",
            naturefond: 'Actions',
            nbrepart: "670",
            cump: '7 280',
            valeurtotal: "817 250",
            valeur:'8 500',
            cumpcumpcump: '1220',
            pmvaleur:'16,75%',
            press: () => Navigator.pushNamed(
            context,PortefeuilleDetailsScreen.routeName),
          ),
        ],*/
      ),
    );
  }
}
