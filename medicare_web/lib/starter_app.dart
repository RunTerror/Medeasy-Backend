import 'package:medicare_web/routes/routes_constants.dart';
import 'package:medicare_web/themes/themes.dart';
import 'routes/router.dart' as router;
import 'package:flutter/material.dart';

class StarterApp extends StatelessWidget {
  const StarterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Medicare',
      theme: lightTheme,
      initialRoute: RoutesConstants.splashScreenRoute,
      onGenerateRoute: router.generateRoute,
    );
  }
}
