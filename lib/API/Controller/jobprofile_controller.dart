import 'dart:convert';
import 'package:fit_to_job/LocalStorage/SaveCredential.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../Screens/Constant/apiPath.dart';
import '../Model/jobprofile_model.dart';
import '../Model/profile_model.dart';
import '../Model/subjob_model.dart';

//Job Profile
Future<JobprofileModel> getjobprofile() async {
  final response = await http.get(Uri.parse(jobprofileAPIURL));
  var data = jsonDecode(response.body.toString());
  if (response.statusCode == 200) {
    return JobprofileModel.fromJson(data);
  } else {
    return JobprofileModel.fromJson(data);
  }
}

//SubJobProfile

Future<SubjobProfileModel> getsubprofile(
    {String StaffCategory, BuildContext context}) async {
  final response = await http.post(Uri.parse(subprofileAPIURL),
      body: {"StaffCategory": StaffCategory});
  var data = json.decode(response.body);
  if (data['status'] == "200") {
    Get.offNamed('/subjobprofile', arguments: [StaffCategory.toString()]);
    return SubjobProfileModel.fromJson(data);
  } else {
    debugPrint("Something went Wrong");
    return SubjobProfileModel.fromJson(data);
  }
}

//Get profile

Future<profileModel> getprofile(
    {String Designation, BuildContext context}) async {
  final response = await http
      .post(Uri.parse(profileAPIURL), body: {"Designation": Designation});
  var data = json.decode(response.body);
  if (data['status'] == "200") {
    LocalStorage().saveProfile(
      Designation: Designation,
      designation: profileModel.fromJson(data).result[0].designation,
      deptName: profileModel.fromJson(data).result[0].deptName,
    );
    //  Get.offNamed('/uploadscreen', arguments: [StaffCategory]);
    Get.offNamed('/homescreen', arguments: [Designation]);
    return profileModel.fromJson(data);
  } else {
    debugPrint("Something went Wrong");
    return profileModel.fromJson(data);
  }
}

Future<profileModel> updateprofile(
    {String JobOfferingId, String RegistrationId, BuildContext context}) async {
  final response = await http
      .post(Uri.parse(updateprofileURL), body: {"Designation": JobOfferingId});
  var data = json.decode(response.body);
  if (data['status'] == "200") {
    LocalStorage().saveProfile(
      Designation: JobOfferingId,
      designation: profileModel.fromJson(data).result[0].designation,
      deptName: profileModel.fromJson(data).result[0].deptName,
    );
    //  Get.offNamed('/uploadscreen', arguments: [StaffCategory]);
    Get.offNamed('/homescreen', arguments: [JobOfferingId]);
    return profileModel.fromJson(data);
  } else {
    debugPrint("Something went Wrong");
    return profileModel.fromJson(data);
  }
}
