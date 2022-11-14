import 'dart:convert';

import 'package:fit_to_job/Screens/Constant/apiPath.dart';
import 'package:fit_to_job/Screens/Constant/imagePath.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../LocalStorage/SaveCredential.dart';
import '../../Screens/CommonScreen/job_profile.dart';
import '../../Screens/Widgets/hepler.dart';
import '../Model/login_model.dart';
import '../Model/verifyotp_model.dart';

//Send OTP
Future<loginModel> loginAPI({
  String aadharCardNo,
  String mobileNo,
  BuildContext context,
}) async {
  final response = await http.post(Uri.parse(loginAPIURL),
      body: {"aadharCardNo": aadharCardNo, "mobileNo": mobileNo});
  var data = jsonDecode(response.body);
  if (data['status'] == "200") {
    ScaffoldMessenger.of(context).showSnackBar(customSnackbar(
        label: "",
        lColor: Colors.white,
        time: const Duration(seconds: 3),
        press: () {},
        msg: data['message'],
        chooseColor: Colors.green));
    LocalStorage().saveLogin(
      aadharCardNo: aadharCardNo,
      mobileNo: mobileNo,
    );
    debugPrint("User OTP Send Succesfully");
    return loginModel.fromJson(data);
  } else {
    ScaffoldMessenger.of(context).showSnackBar(customSnackbar(
        label: "",
        lColor: Colors.white,
        time: const Duration(seconds: 3),
        press: () {},
        msg: data['message'],
        chooseColor: Colors.green));
    debugPrint("Please check Credential");
  }
}

Future<VerifyotpModel> verifyOTP({String mobileNo, String OTP, context}) async {
  final response = await http
      .post(Uri.parse(verifyAPIURL), body: {"MobileNo": mobileNo, "otp": OTP});
  var data = json.decode(response.body);
  if (response.statusCode == 200) {
    ScaffoldMessenger.of(context).showSnackBar(customSnackbar(
        label: "",
        time: const Duration(seconds: 5),
        press: () {},
        msg: "OTP Verified",
        chooseColor: Colors.green));
    LocalStorage().saveVerify(
      mobileNo: mobileNo,
      otp: OTP,
      aadharCardNo: VerifyotpModel.fromJson(data).result[0].aadharCardNo,
      firstName: VerifyotpModel.fromJson(data).result[0].firstName,
      address: VerifyotpModel.fromJson(data).result[0].address,
      city: VerifyotpModel.fromJson(data).result[0].city,
      district: VerifyotpModel.fromJson(data).result[0].district,
      // fcmId: VerifyotpModel.fromJson(data).result[0].firstName,
      lastName: VerifyotpModel.fromJson(data).result[0].lastName,
      middleName: VerifyotpModel.fromJson(data).result[0].middleName,
      state: VerifyotpModel.fromJson(data).result[0].state,
      taluka: VerifyotpModel.fromJson(data).result[0].taluka,
    );
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const Jobprofile()));
    return VerifyotpModel.fromJson(data);
  } else {
    ScaffoldMessenger.of(context).showSnackBar(customSnackbar(
        label: "",
        lColor: Colors.white,
        time: const Duration(seconds: 1),
        press: () {},
        msg: "Invalid OTP",
        chooseColor: Colors.red));
    debugPrint("Invalid OTP");
    return VerifyotpModel.fromJson(data);
  }
}
