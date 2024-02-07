import 'package:flutter/widgets.dart';
import 'package:shop_app/screens/cart/cart_screen.dart';
import 'package:shop_app/screens/complete_profile/complete_profile_screen.dart';
import 'package:shop_app/screens/compte/account_page.dart';
import 'package:shop_app/screens/contact/contact.dart';
import 'package:shop_app/screens/details/details_screen.dart';
import 'package:shop_app/screens/details_order/details_ordre.dart';
import 'package:shop_app/screens/entry_point.dart';
import 'package:shop_app/screens/first_souscription.dart';
import 'package:shop_app/screens/forgot_password/forgot_password_screen.dart';
import 'package:shop_app/screens/home/home_screen.dart';
import 'package:shop_app/screens/information_personnelle/information_personnelle.dart';
import 'package:shop_app/screens/login_success/login_success_screen.dart';
import 'package:shop_app/screens/historique/historique_screen.dart';
import 'package:shop_app/screens/moyen_paiement/moyen_paiement_screen.dart';
import 'package:shop_app/screens/ordre/ordres_screen.dart';
import 'package:shop_app/screens/otp/otp_screen.dart';
import 'package:shop_app/screens/portefeuille/portefeuille_screen.dart';
import 'package:shop_app/screens/portefeuille_details/portefeuille_detais_screen.dart';
import 'package:shop_app/screens/profile/profile_screen.dart';
import 'package:shop_app/screens/operations/operation_screen.dart';
import 'package:shop_app/screens/securite/code_pin.dart';
import 'package:shop_app/screens/securite/securite.dart';
import 'package:shop_app/screens/sign_in/sign_in_screen.dart';
import 'package:shop_app/screens/sign_in_and_sign_up/sign_in_and_sign_up_ecran.dart';
import 'package:shop_app/screens/sign_up/components/Souscrire.dart';
import 'package:shop_app/screens/splash/splash_screen.dart';
import 'package:shop_app/screens/splash_screen.dart';
import 'package:shop_app/screens/test/test.dart';
import 'package:shop_app/screens/transactions/transaction_screen.dart';
import 'screens/operations/rachat_souscrir_screen.dart';
import 'screens/sign_up/sign_up_screen.dart';

// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  Souscrire.routeName: (context) => Souscrire(),
  SplashScreen.routeName: (context) => SplashScreen(),
  SplashScreen1.routeName: (context) => SplashScreen1(
        title: 'AfriquaBource AM',
      ),
  SignInScreen.routeName: (context) => SignInScreen(),
  ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
  LoginSuccessScreen.routeName: (context) => LoginSuccessScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  CompleteProfileScreen.routeName: (context) => CompleteProfileScreen(),
  OtpScreen.routeName: (context) => OtpScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  DetailsScreen.routeName: (context) => DetailsScreen(),
  CartScreen.routeName: (context) => CartScreen(),
  ProfileScreen.routeName: (context) => ProfileScreen(),
  TransactioScreen.routeName: (context) => TransactioScreen(),
  HistoriqueScreen.routeName: (context) => HistoriqueScreen(),
  OrdresScreen.routeName: (context) => OrdresScreen(),
  DetailsOrdreScreen.routeName: (context) => DetailsOrdreScreen(),
  AccountPage.routeName: (context) => AccountPage(),
  OperationScreen.routeName: (context) => OperationScreen(),
  PortefeuilleScreen.routeName: (context) => PortefeuilleScreen(),
  StepperDemo.routeName: (context) => StepperDemo(),
  SignInAndSignUpScreen.routeName: (context) => SignInAndSignUpScreen(),
  PortefeuilleDetailsScreen.routeName: (context) => PortefeuilleDetailsScreen(),
  InformationPersonnelleScreen.routeName: (context) =>
      InformationPersonnelleScreen(),
  SecuritePage.routeName: (context) => SecuritePage(),
  CodePinScreen.routeName: (context) => CodePinScreen(),
  MoyenPaiementScreen.routeName: (context) => MoyenPaiementScreen(),
  ContactScreen.routeName: (context) => ContactScreen(),
  RachatSouscrireScreen.routeName: (context) => RachatSouscrireScreen(),
  EntryPoint.routeName: (context) => EntryPoint(),
  FirstSouscription.routeName: (context) => FirstSouscription()
  // CountryPage.routeName:(context) => CountryPage(),
};
