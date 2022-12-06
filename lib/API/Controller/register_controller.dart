import 'package:fit_to_job/LocalStorage/SaveCredential.dart';

import '../../Screens/Authentication/login_screen.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../Screens/Constant/apiPath.dart';
import '../../Screens/Widgets/hepler.dart';

Future registerAPI(
    {String aadharCardNo,
    String firstName,
    String middleName,
    String lastName,
    String mobileNo,
    String city,
    String taluka,
    String district,
    String state,
    String address,
    BuildContext context}) async {
  final response = await http.post(Uri.parse(registerAPIURL), body: {
    "aadharCardNo": aadharCardNo,
    "firstName": firstName,
    "middleName": middleName,
    "lastName": lastName,
    "mobileNo": mobileNo,
    "city": city,
    "taluka": taluka,
    "district": district,
    "state": state,
    "address": address,
  });
  var data = json.decode(response.body);
  if (data['status'] == "200") {
    ScaffoldMessenger.of(context).showSnackBar(customSnackbar(
        label: "Login Now",
        lColor: Colors.white,
        time: const Duration(seconds: 8),
        press: () => Navigator.push(context,
            MaterialPageRoute(builder: (context) => const LoginScreen())),
        msg: "User Registered Successfully",
        chooseColor: Colors.green));
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const LoginScreen()));

    debugPrint("Register Succesfully");
    debugPrint(data['result']);
  } else {
      ScaffoldMessenger.of(context).showSnackBar(customSnackbar(
        label: "Login Now",
        lColor: Colors.white,
        time: const Duration(seconds: 8),
        press: () => Navigator.push(context,
            MaterialPageRoute(builder: (context) => const LoginScreen())),
        msg: "User Already Exist",
        chooseColor: Colors.red));
    debugPrint("Not register");
  }
}

// OTP Verification
//111111111111
//6355260464 
