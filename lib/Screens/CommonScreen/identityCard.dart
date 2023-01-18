import 'dart:convert';

import 'package:fit_to_job/API/Controller/jobprofile_controller.dart';
import 'package:fit_to_job/Screens/Constant/Colorpath.dart';
import 'package:fit_to_job/Screens/Constant/imagePath.dart';
import 'package:fit_to_job/Screens/Constant/responsive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../Widgets/hepler.dart';

class IDCard extends StatefulWidget {
  @override
  State<IDCard> createState() => _IDCardState();
}

class _IDCardState extends State<IDCard> {
 

  String registrationId;
  String firstName;
  String designation;
  String jobOfferingId;
  getUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      registrationId = prefs.getString('registrationId');
      firstName = prefs.getString('firstName');
      designation = prefs.getString('designation');
      jobOfferingId = prefs.getString('jobOfferingId');
    });
  }

  @override
  void initState() {
    getUserId();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          leading: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Color(0xff018F89),
              ),
              onPressed: () => Get.back()),
          title: const Padding(
            padding: EdgeInsets.only(right: 120.0),
            child: Text(
              "Identity Card",
              style: TextStyle(
                  color: Color(0xff1AA19A),
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
       
        body: Container(
          child: FutureBuilder(
              future: getIdData(registrationId : registrationId),
              builder: (context, snapshot) {
                if (snapshot.data == null) {
                  return Center(
                      child: Center(
                          child:
                              snapshot.connectionState != ConnectionState.done
                                  ? const CircularProgressIndicator()
                                  : Helper().customText(
                                      text: "No Data Found", fontSize: 20)));
                } else {
                  return ListView.builder(
                      itemCount: snapshot.data.result.length,
                      itemBuilder: (context, index) {
                        var list = snapshot.data.result[index];
                        return idUI(
                          model: IDModel(result: [list]),
                        );
                      });
                }
              }),
        ));
  }

  Widget idUI({IDModel model}) {
    return Container(
      height: SizeConfig.screenHeight,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border.all(color: textColor,width: 0.5),
              borderRadius: BorderRadius.circular(15),
              gradient: const LinearGradient(colors: [
                Color(0xffffffff),
                Color(0xff89CBC8),
                Color(0xff018F89)
              ], stops: [
                0.1,
                0.6,
                2.0
              ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
          alignment: Alignment.center,
          child: Align(
            alignment: Alignment.topLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Center(child: customAssetPath(imagePath: logoImage, size: 80)),
                const SizedBox(
                  height: 40,
                ),
                Text(
                  "Aadhar No.      ${model.result[0].aadharCardNo}",
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                    "Full Name :      ${model.result[0].firstName.toUpperCase()} ${model.result[0].middleName.toUpperCase()} ${model.result[0].lastName.toUpperCase()}",
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold)),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Department:      ${model.result[0].department == "" ? "-" :  model.result[0].department}",
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Designation:      ${model.result[0].designation == "" ? "-" : model.result[0].designation}",
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Mo. No.:              ${model.result[0].mobileNo}",
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Village/City:        ${model.result[0].city.toUpperCase()}",
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "District:                ${model.result[0].district.toUpperCase()}",
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "State:                   ${model.result[0].state.toUpperCase()}",
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Address:              ${model.result[0].address.toUpperCase()}",
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Company Name:      ${model.result[0].companyName.toUpperCase() == "" ? "-" : model.result[0].companyName.toUpperCase()}",
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Company Address:    ${model.result[0].companyName.toUpperCase() == "" ? "-" : model.result[0].companyName.toUpperCase()}",
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class IDModel {
  String status;
  String message;
  List<Result> result;

  IDModel({this.status, this.message, this.result});

  IDModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['result'] != null) {
      result = <Result>[];
      json['result'].forEach((v) {
        result.add(new Result.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.result != null) {
      data['result'] = this.result.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Result {
  String registrationId;
  String firstName;
  String middleName;
  String lastName;
  String mobileNo;
  String city;
  String taluka;
  String district;
  String state;
  String address;
  String aadharCardNo;
  String insertedOn;
  String lastUpdatedOn;
  String department;
  String designation;
  String companyName;
  String companyAddress;

  Result(
      {this.registrationId,
      this.firstName,
      this.middleName,
      this.lastName,
      this.mobileNo,
      this.city,
      this.taluka,
      this.district,
      this.state,
      this.address,
      this.aadharCardNo,
      this.insertedOn,
      this.lastUpdatedOn,
      this.department,
      this.designation,
      this.companyName,
      this.companyAddress});

  Result.fromJson(Map<String, dynamic> json) {
    registrationId = json['RegistrationId'];
    firstName = json['FirstName'];
    middleName = json['MiddleName'];
    lastName = json['LastName'];
    mobileNo = json['MobileNo'];
    city = json['City'];
    taluka = json['Taluka'];
    district = json['District'];
    state = json['State'];
    address = json['Address'];
    aadharCardNo = json['AadharCardNo'];
    insertedOn = json['InsertedOn'];
    lastUpdatedOn = json['LastUpdatedOn'];
    department = json['Department'];
    designation = json['Designation'];
    companyName = json['Company Name'];
    companyAddress = json['Company Address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['RegistrationId'] = this.registrationId;
    data['FirstName'] = this.firstName;
    data['MiddleName'] = this.middleName;
    data['LastName'] = this.lastName;
    data['MobileNo'] = this.mobileNo;
    data['City'] = this.city;
    data['Taluka'] = this.taluka;
    data['District'] = this.district;
    data['State'] = this.state;
    data['Address'] = this.address;
    data['AadharCardNo'] = this.aadharCardNo;
    data['InsertedOn'] = this.insertedOn;
    data['LastUpdatedOn'] = this.lastUpdatedOn;
    data['Department'] = this.department;
    data['Designation'] = this.designation;
    data['Company Name'] = this.companyName;
    data['Company Address'] = this.companyAddress;
    return data;
  }
}
