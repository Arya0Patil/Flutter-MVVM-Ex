import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';

class utils {
  static toastMessage(String message) {
    Fluttertoast.showToast(msg: message);
  }

  // static void flushBarErrorMessages(String message, BuildContext context) {
  //   showFlushbar(
  //       context: context,
  //       flushbar: Flushbar(
  //         message: message,
  //         duration: Duration(seconds: 5),
  //       )..show(context));
  // }

  static snakBar(String message, BuildContext context) {
    return ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }
}
