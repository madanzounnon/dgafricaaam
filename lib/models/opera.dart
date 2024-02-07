
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Operation {
  final int id;
  final String motif;
  final String date;
  final String fond;
  final IconData icon;
  final bool  typeoperation;
 
  const Operation({
    required this.id,
    required this.fond,
    required this.date,
    required this.typeoperation,
    required this.motif,
   required this.icon,
  });
}

  List<Operation> operations = [
    Operation(id:1,fond: "FOND OBLIGATIS", motif: "Souscription", icon: FontAwesomeIcons.moneyBillTransfer, date: "instant",typeoperation:false),
    Operation(id:2,fond: "FOND OBLIGATIS", motif: "Rachat", icon: FontAwesomeIcons.moneyBillTransfer, date: "hier",typeoperation:true),
    Operation(id:3,fond: "FOND OBLIGATIS", motif: "Souscription", icon: FontAwesomeIcons.moneyBillTransfer, date: "31 Mar",typeoperation:false),
    Operation(id:4,fond: "FOND OBLIGATIS", motif: "Dépôt", icon: FontAwesomeIcons.moneyBillTransfer, date: "28 Mar",typeoperation:false),
    Operation(id:5,fond:  "FOND OBLIGATIS", motif: "Rachat", icon: FontAwesomeIcons.moneyBillTransfer, date: "23 Mar",typeoperation:true),
    Operation(id:6,fond: "FOND OBLIGATIS", motif: "Dépôt", icon: FontAwesomeIcons.moneyBillTransfer, date: "17 Mar",typeoperation:true),
    Operation(id:7,fond:  "FOND OBLIGATIS", motif: "Souscription", icon: FontAwesomeIcons.moneyBillTransfer, date: "24 Fev",typeoperation:false),
    Operation(id:8,fond:  "FOND OBLIGATIS", motif: "Dépôt", icon: FontAwesomeIcons.moneyBillTransfer, date: "18 Fev",typeoperation:false),
    Operation(id:3,fond:  "FOND OBLIGATIS", motif: "Souscription", icon: FontAwesomeIcons.moneyBillTransfer, date: "31 Mar",typeoperation:false),
    Operation(id:4,fond: "FOND OBLIGATIS", motif: "Dépôt", icon: FontAwesomeIcons.moneyBillTransfer, date: "28 Mar",typeoperation:false),
    Operation(id:5,fond:  "FOND OBLIGATIS", motif: "Rachat", icon: FontAwesomeIcons.moneyBillTransfer, date: "23 Mar",typeoperation:true),
  ];

  class Operationdetail {
    final int id;
    final String nom;
    final String motif;
    final String codeisin;
    final String date;
    final String valeurLiquidative;
    final String valeurOrigine;
    final IconData icon;
    final String souscripteur;
    final String  typeoperation;
    final Performance performance;
    final Droits  droits;
    const Operationdetail({
      required this.id,
      required this.valeurLiquidative,
      required this.valeurOrigine,
      required this.date,
      required this.typeoperation,
      required this.motif,
      required this.codeisin,
      required this.souscripteur,
      required this.icon,
      required this.nom,
      required this.performance,
      required this.droits,
    });
}
class Performance {
    final String debannee;
    final String unannee;
    final String unesemaine;
    final String unmois;
    final String sixemois;
    final String troismois;
    final String troisannee;
  
    const Performance({
      required this.sixemois,
      required this.troismois,
      required this.unmois,
      required this.unannee,
      required this.unesemaine,
      required this.troisannee,
      required this.debannee, 
      
    });
}

class Droits {
    final String droitEntreMax;
    final String droitSortirMax;
    final String fraisGestionMax;
    final String transmissionOrdre;
    const Droits({
      required this.droitEntreMax,
      required this.droitSortirMax,
      required this.fraisGestionMax,
      required this.transmissionOrdre,
      
    });
}

  List<Operationdetail> listoperationdetail = [
    Operationdetail(id:1,nom:"Epargne Action",valeurLiquidative: "30000F",valeurOrigine: "18%",codeisin:"0000000394",souscripteur:"931", motif: "Awesome Setup", icon: FontAwesomeIcons.moneyBillTransfer, date: "instant",typeoperation:"OCPCVM <<Action>>",
    performance:Performance(
      debannee:'-0.33%',
      unannee:'0.20%',
      unesemaine:'0.94%',
      unmois:'-6.63%',
      sixemois:'2.04%',
      troismois:'-3.07%',
      troisannee:'6.27%'
    ),
     droits:Droits(
      droitEntreMax:'02.00%',
      droitSortirMax:'02.00%',
      fraisGestionMax:'02.00%',
      transmissionOrdre:'J-1 avant 18h00',)
    ),

    Operationdetail(id:2,nom:"AAM Capital Sûr",valeurLiquidative: "500000F",valeurOrigine: "13%",codeisin:"0000000764",souscripteur:"812",motif: "That's Great", icon: FontAwesomeIcons.moneyBillTransfer, date: "hier",typeoperation:"OCPCVM <<Action>>",
    performance:Performance(
      debannee:'-0.33%',
      unannee:'0.20%',
      unesemaine:'0.94%',
      unmois:'-6.63%',
      sixemois:'2.04%',
      troismois:'-3.07%',
      troisannee:'6.27%'
    ),
     droits:Droits(
      droitEntreMax:'02.00%',
      droitSortirMax:'02.00%',
      fraisGestionMax:'02.00%',
      transmissionOrdre:'J-1 avant 18h00',)
    ),
    Operationdetail(id:3,nom:"OBLIGATIS",valeurLiquidative: "900000F",valeurOrigine: "14%",codeisin:"0000000569",souscripteur:"799", motif: "Hey where are you?", icon: FontAwesomeIcons.moneyBillTransfer, date: "31 Mar",typeoperation:"OCPCVM <<Action>>",
    performance:Performance(
      debannee:'-0.33%  ',
      unannee:'0.20%',
      unesemaine:'0.94%',
      unmois:'-6.63%',
      sixemois:'2.04%',
      troismois:'-3.07%',
      troisannee:'6.27%'
    ),
     droits:Droits(
      droitEntreMax:'02.00%',
      droitSortirMax:'02.00%',
      fraisGestionMax:'02.00%',
      transmissionOrdre:'J-1 avant 18h00',)
    ),
    Operationdetail(id:4,nom:"EPARGNE CROISSANCE",valeurLiquidative: "30000F",valeurOrigine: "17%",codeisin:"0000000994",souscripteur:"032",motif: "Busy! Call me in 20 mins", icon: FontAwesomeIcons.moneyBillTransfer, date: "28 Mar",typeoperation:"OCPCVM <<Action>>",
    performance:Performance(
      debannee:'-0.33%  ',
      unannee:'0.20%',
      unesemaine:'0.94%',
      unmois:'-6.63%',
      sixemois:'2.04%',
      troismois:'-3.07%',
      troisannee:'6.27%'
    ),
     droits:Droits(
      droitEntreMax:'02.00%',
      droitSortirMax:'02.00%',
      fraisGestionMax:'02.00%',
      transmissionOrdre:'J-1 avant 18h00',)
    ),
    Operationdetail(id:5,nom:"AAM Capital Sûr",valeurLiquidative: "40000F",valeurOrigine: "11%", codeisin:"0000000664",souscripteur:"1792",motif: "Thankyou, It's awesome", icon: FontAwesomeIcons.moneyBillTransfer, date: "23 Mar",typeoperation:"OCPCVM <<Action>>",
    performance:Performance(
      debannee:'-0.33%  ',
      unannee:'0.20%',
      unesemaine:'0.94%',
      unmois:'-6.63%',
      sixemois:'2.04%',
      troismois:'-3.07%',
      troisannee:'6.27%'
    ),
     droits:Droits(
      droitEntreMax:'02.00%',
      droitSortirMax:'02.00%',
      fraisGestionMax:'02.00%',
      transmissionOrdre:'J-1 avant 18h00',)
    ),
    Operationdetail(id:6,nom:"Epargne Action",valeurLiquidative: "70000F",valeurOrigine: "10%",codeisin:"0000000854",souscripteur:"638", motif: "will update you in evening", icon: FontAwesomeIcons.moneyBillTransfer, date: "17 Mar",typeoperation:"OCPCVM <<Action>>",
    performance:Performance(
      debannee:'-0.33%  ',
      unannee:'0.20%',
      unesemaine:'0.94%',
      unmois:'-6.63%',
      sixemois:'2.04%',
      troismois:'-3.07%',
      troisannee:'6.27%'
    ),
     droits:Droits(
      droitEntreMax:'02.00%',
      droitSortirMax:'02.00%',
      fraisGestionMax:'02.00%',
      transmissionOrdre:'J-1 avant 18h00',)
    ),
    Operationdetail(id:7,nom:"EPARGNE CROISSANCE",valeurLiquidative: "13000F",valeurOrigine: "14%",codeisin:"0000000164",souscripteur:"732", motif: "Can you please share the file?", icon: FontAwesomeIcons.moneyBillTransfer, date: "24 Fev",typeoperation:"OCPCVM <<Action>>",
    performance:Performance(
      debannee:'-0.33%  ',
      unannee:'0.20%',
      unesemaine:'0.94%',
      unmois:'-6.63%',
      sixemois:'2.04%',
      troismois:'-3.07%',
      troisannee:'6.27%'
    ),
     droits:Droits(
      droitEntreMax:'02.00%',
      droitSortirMax:'02.00%',
      fraisGestionMax:'02.00%',
      transmissionOrdre:'J-1 avant 18h00',)
    ),
    Operationdetail(id:8,nom:"OBLIGATIS",valeurLiquidative: "19000F",valeurOrigine: "16%",codeisin:"0000000924",souscripteur:"922", motif: "How are you?", icon: FontAwesomeIcons.moneyBillTransfer, date: "18 Fev",typeoperation:"OCPCVM <<Action>>",
    performance:Performance(
      debannee:'-0.33%  ',
      unannee:'0.20%',
      unesemaine:'0.94%',
      unmois:'-6.63%',
      sixemois:'2.04%',
      troismois:'-3.07%',
      troisannee:'6.27%'
    ),
     droits:Droits(
      droitEntreMax:'02.00%',
      droitSortirMax:'02.00%',
      fraisGestionMax:'02.00%',
      transmissionOrdre:'J-1 avant 18h00',)
    ),
  ];