import 'package:flutter/services.dart';
import 'package:medicare_web/providers/appwriteProvider.dart';
import 'package:medicare_web/starter_app.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Set only portrait orientation
  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
  );

  runApp(
    MultiProvider(
      providers: [
        //Add here the providers
        ChangeNotifierProvider(
          create: (context) => AppwriteProvider(),
        ),
      ],
      child: const StarterApp(),
    ),
  );
}
