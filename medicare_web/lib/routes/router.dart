import 'package:flutter/material.dart';
import 'package:medicare_web/pages/error/no_internet_page.dart';
import 'package:medicare_web/pages/landing_page.dart';
import 'package:medicare_web/pages/new_patients_pages/final_page.dart';
import 'package:medicare_web/pages/new_patients_pages/gen_ques_page.dart';
import 'package:medicare_web/pages/new_patients_pages/personal_details.dart';
import 'package:medicare_web/pages/new_patients_pages/symptoms_page.dart';
import 'package:medicare_web/pages/splash_page.dart';
import 'package:medicare_web/pages/undefinited_page.dart';
import 'package:medicare_web/routes/routes_constants.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  final arguments = settings.arguments;
  switch (settings.name) {
    case RoutesConstants.splashScreenRoute:
      return MaterialPageRoute(
        settings: settings,
        builder: (context) => const SplashPage(),
      );
    case RoutesConstants.landingRoute:
      return MaterialPageRoute(
        settings: settings,
        builder: (context) => const LandingPage(),
      );
    case RoutesConstants.noInternetRoute:
      return MaterialPageRoute(
        settings: settings,
        builder: (context) => const NoInternetPage(),
      );
    case RoutesConstants.personalDetails:
      return MaterialPageRoute(
        settings: settings,
        builder: (context) => const PersonalDetailsPage(),
      );
    case RoutesConstants.symptomsRoute:
      return MaterialPageRoute(
        settings: settings,
        builder: (context) => const SymptomsPage(),
      );
    case RoutesConstants.finalpageRoute:
      return MaterialPageRoute(
        settings: settings,
        builder: (context) => const FinalPage(),
      );
    case RoutesConstants.genQuesRoute:
      // if (arguments is String) {
      return MaterialPageRoute(
        settings: settings,
        builder: (context) => const GenQuesPage(),
      );
    // } else {
    //   return MaterialPageRoute(
    //     settings: settings,
    //     builder: (context) => UndefinitedPage(name: settings.name),
    //   );
    // }
    default:
      return MaterialPageRoute(
        settings: settings,
        builder: (context) => UndefinitedPage(name: settings.name),
      );
  }
}

// class GenQuesPageArguments {
//   final String question;

//   GenQuesPageArguments(this.question);
// }
