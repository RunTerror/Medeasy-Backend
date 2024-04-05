import 'package:flutter/material.dart';
import 'package:medicare_web/routes/routes_constants.dart';

class NoInternetPage extends StatelessWidget {
  const NoInternetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "No Internet",
              style: TextStyle(
                fontSize: 20,
                color: Colors.red,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
            const Icon(
              Icons.error,
              color: Colors.red,
              size: 40,
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              child: const Text(
                "Retry",
              ),
              onPressed: () {
                Navigator.of(context)
                    .popAndPushNamed(RoutesConstants.splashScreenRoute);
              },
            ),
          ],
        ),
      ),
    );
  }
}
