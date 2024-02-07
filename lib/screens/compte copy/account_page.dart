import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shop_app/components/coustom_bottom_nav_bar.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/enums.dart';
import 'package:shop_app/models/pub.dart';
import 'package:shop_app/screens/sign_up/components/Souscrire.dart';
import 'package:shop_app/size_config.dart';

class AccountPage extends StatefulWidget {
  @override
   static String routeName = "/compte";
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      backgroundColor: Colors.white,
      body: getBody(),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.profile),
    );
  }
  Widget getBody() {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 0, right: 0, top: 0),
          child: 
          SizedBox(
            width: double.infinity,
            height: getProportionateScreenHeight(170),
              child:Stack(
                children:[
                  Container(
                   width: double.infinity,
                    height: getProportionateScreenHeight(170),
                    decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(300),
                        image: DecorationImage(
                           opacity: 0.02,
                            image: AssetImage("assets/images/usercarr.jpg"), fit: BoxFit.cover)),
                  ),
                   Container(
                   width: double.infinity,
                    height: getProportionateScreenHeight(120),
                    decoration: BoxDecoration(
                       // borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            image: AssetImage("assets/images/decoruser.png"), fit: BoxFit.cover)),
                  ),
                   Container(
                    width: double.infinity,
                    height: getProportionateScreenHeight(170),
                    decoration: BoxDecoration(
                       // color: pPrimaryColor,
                       // borderRadius: BorderRadius.circular(10),
                       //image: DecorationImage( image: AssetImage("assets/images/decoruser.png"), fit: BoxFit.cover)
                        ),
                    child:Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                          SizedBox(
                            height: 115,
                            width: 115,
                            child: Stack(
                              fit: StackFit.expand,
                              clipBehavior: Clip.none,
                              children: [
                                CircleAvatar(
                                  backgroundImage: AssetImage("assets/images/usercarr.jpg"),
                                ),
                                Positioned(
                                  right: 12,
                                  bottom: 0,
                                  child: SizedBox(
                                    height: 40,
                                    width: 90,
                                    child: TextButton(
                                      style: TextButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(50),
                                          side: BorderSide(color: Colors.white),
                                        ),
                                        primary: Colors.white,
                                        backgroundColor: Color.fromRGBO(204,221,245,1),
                                      ),
                                      onPressed: () {},
                                      child: Text('Modifier',style: TextStyle(color: pPrimaryColor),),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          /*Container(
                           margin: EdgeInsets.only(left: getProportionateScreenWidth(10),),
                            width: 110,
                            height: 110,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                image: DecorationImage( image: AssetImage("assets/images/usercarr.jpg"), fit: BoxFit.cover)
                            ),
                           // child:CircleAvatar(child: Image.asset("assets/images/usercarr.jpg", fit: BoxFit.cover),)
                          ),*/
                          SizedBox(
                            width: getProportionateScreenWidth(10),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "DJOSSOU Aimé",
                                style: TextStyle(color: Colors.black, fontSize: getProportionateScreenWidth(17), fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 2,
                              ),
                              Text(
                                "aimedjossou@gmail.com",
                                style:
                                    TextStyle(fontSize: 13, color: Colors.black.withOpacity(0.7)),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                             /* Container(
                                decoration: BoxDecoration(
                                    color: Colors.black, borderRadius: BorderRadius.circular(30)),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
                                  child: Center(
                                    child: Text(
                                      "MODIFIER",
                                      style: TextStyle(fontSize: 13, color: Colors.white),
                                    ),
                                  ),
                                ),
                              )*/
                          ],
                        )
                      ],
                    )
                  )
                ]
              )
            ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
          IconButton(onPressed: (){}, icon: Icon(FontAwesomeIcons.edit)),
        ],),

        // Padding(
        //   padding: const EdgeInsets.only(left: 20, right: 20),
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //     children: [
        //       Row(
        //         children: [
        //           Icon(
        //             FontAwesomeIcons.box,
        //             color: Colors.black,
        //           ),
        //           SizedBox(
        //             width: 10,
        //           ),
        //           Text(
        //             "Mes Transactions",
        //             style: TextStyle(fontSize: 15),
        //           )
        //         ],
        //       ),
        //       Row(
        //         children: [
        //           Icon(
        //             FontAwesomeIcons.cog,
        //             color: Colors.black,
        //           ),
        //           SizedBox(
        //             width: 10,
        //           ),
        //           Text(
        //             "paramètres",
        //             style: TextStyle(fontSize: 15),
        //           )
        //         ],
        //       ),
        //     ],
        //   ),
        // ),
        // SizedBox(
        //   height: 30,
        // ),
       
        SizedBox(
          height: getProportionateScreenHeight(10),
        ),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
              color: Color.fromRGBO(204,221,245,1), borderRadius: BorderRadius.only(topLeft:Radius.circular(30),topRight: Radius.circular(30)),
          ),
        child:
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 15,top: 20),
          child: Column(
            children: List.generate(accountList.length, (index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 03),
                child: Column(
                  children: [
                     TextButton(
                        style: TextButton.styleFrom(
                        primary: Colors.black,
                       /* padding: EdgeInsets.all(20),
                        shape:
                            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                        backgroundColor: Color(0xFFF5F6F9),*/
                      ),
                      onPressed: () =>Navigator.pushNamed(context, Souscrire.routeName),
                      child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          accountList[index],
                          style: TextStyle(fontSize: 16),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.black.withOpacity(0.5),
                          size: getProportionateScreenWidth(17),
                        )
                      ],
                    )),
                    
                   /* Divider(
                      color: Colors.grey.withOpacity(0.8),
                    )*/
                  ],
                ),
              );
            }),
          ),
        ))
      ],
    );
  }

AppBar buildAppBar(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: true,
      title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("Mon compte",style: TextStyle(fontSize: getProportionateScreenWidth(20),fontWeight: FontWeight.bold,color:pPrimaryColor),),
        Container(
          height: 30,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Color.fromARGB(255, 176, 249, 201),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Icon(Icons.add_circle,color: Color.fromARGB(255, 3, 185, 66) ,size: 32,),
             // SizedBox(width: 2,),
              Padding(
                padding: EdgeInsets.only(left: 2,right: 8,top: 2,bottom: 2),
                child:Text("Dépôt",style: TextStyle(color: pPrimaryColor, fontSize: 14,fontWeight: FontWeight.bold),),)
            ],
          ),
        ),
  ]));
  }
}
