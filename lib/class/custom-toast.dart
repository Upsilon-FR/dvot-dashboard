import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CustomToast{
  static void showSuccessToast({required String msg, required BuildContext context}){
    Fluttertoast.showToast(
      backgroundColor: Theme.of(context).primaryColor,
      webBgColor: "#0762C8",
      msg: msg,
      timeInSecForIosWeb: 5,
    );
  }

  static void showErrorToast({required String msg, required BuildContext context}){
    Fluttertoast.showToast(
      backgroundColor: Colors.red,
      webBgColor: "#F44336",
      msg: msg,
      timeInSecForIosWeb: 5,
    );
  }
}