import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  saveLangauge({Locale local}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('lang', local.languageCode);
  }


  saveRegister({
  String aadharCardNo,
  String firstName,
  String middleName,
  String lastName,
  String mobileNo,
  String city,
  String taluka,
  String district,
  String state,
  String address,
}) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('aadharCardNo', aadharCardNo);
  prefs.setString('firstName', firstName);
  prefs.setString('middleName', middleName);
  prefs.setString('lastName', lastName);
  prefs.setString('mobileNo', mobileNo);
  prefs.setString('city', city);
  prefs.setString('taluka', taluka);
  prefs.setString('district', district);
  prefs.setString('state', state);
  prefs.setString('address', address);
}


 saveLogin({
    String aadharCardNo,
    String mobileNo,
  }) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('aadharCardNo', aadharCardNo);
    prefs.setString('mobileNo', mobileNo);
  }

saveVerify({
String aadharCardNo,
String firstName,
String lastName,
String middleName,
String mobileNo,
String city,
String taluka,
String district,
String state,
String address,
String otp,
String fcmId,
}) async {
SharedPreferences prefs = await SharedPreferences.getInstance();
prefs.setString('aadharCardNo', aadharCardNo);
prefs.setString('firstName', firstName);
prefs.setString('lastName', lastName);
prefs.setString('middleName', middleName);
prefs.setString('mobileNo', mobileNo);
prefs.setString('city', city);
prefs.setString('taluka', taluka);
prefs.setString('district', district);
prefs.setString('state', state);
prefs.setString('address', address);
prefs.setString('otp', otp);
prefs.setString('fcmId', fcmId);

}
}


