import 'package:flutter/material.dart';

import '../constants/global_variables.dart';
import '../theme/my_text_styles.dart';

class AppUtils {
  static Color getColorFromHex(String s) {
    final buffer = StringBuffer();
    if (s.length == 6 || s.length == 7) buffer.write('ff');
    buffer.write(s.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  static Color getColorFromHexAndOpacity(String s, double opacity) {
    final buffer = StringBuffer();
    if (s.length == 6 || s.length == 7) buffer.write('ff');
    buffer.write(s.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16)).withOpacity(opacity);
  }

  static showSnackBar(String text,
      {int duration = 1000,
      Color? color = Colors.black87,
      bool isTextBold = false,
      SnackBarAction? action,
      bool isAtTop = false,
      double? screenHeight}) {
    GlobalVariables.scaffoldMessengerKey.currentState!.showSnackBar(
      SnackBar(
          behavior: SnackBarBehavior.floating,
          content: isTextBold ? Text(text, style: MyTextStyles.sub2.copyWith(color: Colors.white)) : Text(text),
          duration: Duration(milliseconds: duration),
          action: action,
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          margin: isAtTop
              ? EdgeInsets.only(bottom: screenHeight! * 0.8, left: 20, right: 20)
              : const EdgeInsets.only(bottom: 20, right: 20, left: 20)),
    );
  }
}
