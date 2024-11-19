import 'package:flutter/foundation.dart';

class Log {
  ///Directly print message to console
  Log(String message) {
    if (kDebugMode) {
      print(message);
    }
  }

  ///Print message to console with tag
  static void d(String tag, String? message) {
    if (kDebugMode) {
      print('''
      -------------------------------------------------------------------
      'DEBUG' :  "$tag" ->
      "$message"
      -------------------------------------------------------------------
      ''');
    }
  }

  static void e(String? message) {
    if (kDebugMode) {
      print('''
      -------------------------------------------------------------------
      'ERROR' : "$message"
      -------------------------------------------------------------------
      ''');
    }
  }

  static void i(String? message) {
    if (kDebugMode) {
      print('''
      -------------------------------------------------------------------
      'INFO' : "$message"
      -------------------------------------------------------------------
      ''');
    }
  }

  static void w(String? message) {
    if (kDebugMode) {
      print('''
      -------------------------------------------------------------------
      'WARNING' : "$message"
      -------------------------------------------------------------------
      ''');
    }
  }

  static void wtf(String? message) {
    if (kDebugMode) {
      print('''
      -------------------------------------------------------------------
      'WTF' : "$message"
      -------------------------------------------------------------------
      ''');
    }
  }

  ///Wrap message to print in console
  static void printWrapped(String? text) {
    final pattern = RegExp('.{1,800}');
    pattern.allMatches(text ?? "").forEach((match) {
      if (kDebugMode) {
        print(match.group(0));
      }
    });
  }
}
