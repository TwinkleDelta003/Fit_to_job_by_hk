import 'package:fit_to_job/Screens/Constant/Colorpath.dart';
import 'package:flutter/material.dart';

snackBar(BuildContext context, String text) {
  final snackBar = SnackBar(
    behavior: SnackBarBehavior.floating,
    content: Text(
      text,
      style: TextStyle(
          fontWeight: FontWeight.w500, fontSize: 12, color: Colors.white),
    ),
    //width: 10,
    elevation: 6.0,
    duration: const Duration(seconds: 3),
    backgroundColor:textColor,
    action: SnackBarAction(
      label: 'Dismiss',
      textColor: Colors.white,
      onPressed: () {},
    ),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

snackBar1(BuildContext context, String text) {
  final snackBar = SnackBar(
    behavior: SnackBarBehavior.floating,
    content: Text(
      text,
      style: TextStyle(
          fontWeight: FontWeight.w500, fontSize: 12, color: Colors.white),
    ),
    //width: 10,
    elevation: 6.0,
    duration: const Duration(seconds: 10),
    backgroundColor: textColor,
    action: SnackBarAction(
      label: 'Dismiss',
      textColor: Colors.white,
      onPressed: () {},
    ),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
