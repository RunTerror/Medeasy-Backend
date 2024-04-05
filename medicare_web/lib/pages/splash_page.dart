import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:medicare_web/constants/style/style_constants.dart';
import 'package:medicare_web/routes/routes_constants.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  Future<void> loadCall() async {
    await Future.delayed(const Duration(seconds: 3), () {});
    redirectPage();
  }

  Future<bool> checkInternetConnection() async {
    final dio = Dio();
    try {
      final result = await dio.get('www.google.com');
      if (result.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } on SocketException catch (_) {
      return false;
    }
  }

  Future<void> redirectPage() async {
    bool hasConnection = await checkInternetConnection();
    if (!hasConnection) {
      if (context.mounted) {
        Navigator.of(context).popAndPushNamed(RoutesConstants.noInternetRoute);
      }
    } else {
      if (context.mounted) {
        Navigator.of(context).popAndPushNamed(RoutesConstants.symptomsRoute);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => loadCall());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 0,
      ),
      backgroundColor: StyleConstants.scaffoldBackgroundColor,
      body: Center(
        child: Container(
          height: 200,
          width: 200,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/logo1.png"),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
