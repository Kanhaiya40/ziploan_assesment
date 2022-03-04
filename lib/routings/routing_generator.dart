import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ziploan/constants/string.dart';
import 'package:ziploan/routings/routing_constant.dart';
import 'package:ziploan/screens/gistn_input_screen.dart';
import 'package:ziploan/screens/gistn_loader_screen.dart';
import 'package:ziploan/screens/loan_offer_screen.dart';
import 'package:ziploan/screens/login_screen.dart';
import 'package:ziploan/screens/otp_screen.dart';
import 'package:ziploan/screens/pan_card_screen.dart';
import 'package:ziploan/screens/pan_loader_page.dart';
import 'package:ziploan/screens/splash_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case loginPage:
        return MaterialPageRoute(builder: (_) => const Login());
      case otpPage:
        return MaterialPageRoute(builder: (_) => const Otp());
      case splashPage:
        return MaterialPageRoute(builder: (_) => const Splash());
      case panCardPage:
        return MaterialPageRoute(builder: (_) => const Pan());
      case panCardLoaderPage:
        return MaterialPageRoute(builder: (_) => const PanLoader());
      case gistnInputPage:
        return MaterialPageRoute(builder: (_) => const GistInput());
      case gistLoaderPage:
        return MaterialPageRoute(builder: (_) => GistnLoader());
      case loanOfferPage:
        return MaterialPageRoute(builder: (_) => LoanOfferPage());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text(error),
        ),
        body: const Center(
          child: Text(error404),
        ),
      );
    });
  }
}
