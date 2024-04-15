


import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showFlutterToastSuccess(String message) {
  Fluttertoast.showToast(
    msg: message,
    backgroundColor: Colors.white,
    textColor: Colors.white,
  );
}

void showFlutterToastError(String message) {
  Fluttertoast.showToast(
    msg: message,
    backgroundColor: Colors.black54,
    textColor: Colors.white,
  );
}