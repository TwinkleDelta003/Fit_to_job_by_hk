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
    backgroundColor: Color(0xff2A2866),
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
    backgroundColor: Color(0xff2A2866),
    action: SnackBarAction(
      label: 'Dismiss',
      textColor: Colors.white,
      onPressed: () {},
    ),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
