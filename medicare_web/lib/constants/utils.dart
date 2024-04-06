import 'package:flutter/material.dart';
import 'package:medicare_web/constants/style/style_constants.dart';

class Utils {
  void showSnackBar(BuildContext context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: StyleConstants.colorTitle, content: Text(text)));
  }
}
