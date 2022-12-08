import 'dart:io';

import 'package:fit_to_job/Screens/Constant/Colorpath.dart';
import 'package:fit_to_job/Screens/Constant/imagePath.dart';
import 'package:fit_to_job/Screens/Constant/responsive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';

import '../Widgets/hepler.dart';

class InterviewScreen extends StatefulWidget {
  const InterviewScreen({Key key}) : super(key: key);

  @override
  State<InterviewScreen> createState() => InterviewScreenState();
}

class InterviewScreenState extends State<InterviewScreen> {
  final TextEditingController _nameCltr = TextEditingController();
  final TextEditingController _addressCltr = TextEditingController();
  final TextEditingController _postCltr = TextEditingController();
  final TextEditingController _cityCltr = TextEditingController();
  final TextEditingController _districtCltr = TextEditingController();
  final TextEditingController _pincodeCltr = TextEditingController();
  final TextEditingController _emailCltr = TextEditingController();
  final TextEditingController _fnameCltr = TextEditingController();
  final TextEditingController _fOccupassionCltr = TextEditingController();
  final TextEditingController _feduCltr = TextEditingController();
  final TextEditingController _fpermobileCltr = TextEditingController();
  File _pImage;
  File _sImage;

  String gender;
  final picker = ImagePicker();
  Future uploadProductImage() async {
    var pickedImage =
        await picker.pickImage(source: ImageSource.camera, imageQuality: 50);
    setState(() {
      _pImage = File(pickedImage.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          leading: Image.asset("assets/images/research.png", height: 20),
          title: const Text(
            "Interview Form",
            style: TextStyle(
                fontWeight: FontWeight.w700, color: textColor, fontSize: 24),
          )),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Helper().customTextField(
                controller: _nameCltr,
                isEnabled: true,
                obscureText: false,
                context: context,
                hintText: "Full Name (Same as Aadhar Card)",
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(5.0),
              child: Text(
                "Present Address",
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: textColor,
                    fontSize: 18),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: SizeConfig.screenHeight,
                width: MediaQuery.of(context).size.width,
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  elevation: 4,
                  child: Column(
                    children: [
                      Helper().customTextField(
                        controller: _addressCltr,
                        isEnabled: true,
                        obscureText: false,
                        context: context,
                        hintText: "Address",
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Helper().customTextField(
                        controller: _postCltr,
                        isEnabled: true,
                        obscureText: false,
                        context: context,
                        hintText: "Post",
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Helper().customTextField(
                        controller: _cityCltr,
                        isEnabled: true,
                        obscureText: false,
                        context: context,
                        hintText: "Village/City",
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Helper().customTextField(
                        controller: _districtCltr,
                        isEnabled: true,
                        obscureText: false,
                        context: context,
                        hintText: "District",
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Helper().customTextField(
                        controller: _pincodeCltr,
                        isEnabled: true,
                        obscureText: false,
                        context: context,
                        hintText: "Pin code",
                      ),
                      const SizedBox(
                        height: 5,
                      )
                    ],
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(5.0),
              child: Text(
                "Perment Address",
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: textColor,
                    fontSize: 18),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: SizeConfig.screenHeight,
                width: MediaQuery.of(context).size.width,
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  elevation: 4,
                  child: Column(
                    children: [
                      Helper().customTextField(
                        controller: _addressCltr,
                        isEnabled: true,
                        obscureText: false,
                        context: context,
                        hintText: "Address",
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Helper().customTextField(
                        controller: _postCltr,
                        isEnabled: true,
                        obscureText: false,
                        context: context,
                        hintText: "Post",
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Helper().customTextField(
                        controller: _cityCltr,
                        isEnabled: true,
                        obscureText: false,
                        context: context,
                        hintText: "Village/City",
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Helper().customTextField(
                        controller: _districtCltr,
                        isEnabled: true,
                        obscureText: false,
                        context: context,
                        hintText: "District",
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Helper().customTextField(
                        controller: _pincodeCltr,
                        isEnabled: true,
                        obscureText: false,
                        context: context,
                        hintText: "Pin code",
                      ),
                      const SizedBox(
                        height: 5,
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: SizeConfig.screenHeight,
                width: MediaQuery.of(context).size.width,
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  elevation: 4,
                  child: Column(
                    children: [
                      Helper().customTextField(
                        controller: _addressCltr,
                        isEnabled: true,
                        obscureText: false,
                        context: context,
                        hintText: "Date of Birth (As Per adharCard)",
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Helper().customTextField(
                        controller: _postCltr,
                        isEnabled: true,
                        obscureText: false,
                        context: context,
                        hintText: "Blood Group:",
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Helper().customTextField(
                        controller: _cityCltr,
                        isEnabled: true,
                        obscureText: false,
                        context: context,
                        hintText: "AadharCard No.",
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Helper().customTextField(
                        controller: _districtCltr,
                        isEnabled: true,
                        obscureText: false,
                        context: context,
                        hintText: "Pan Card No.",
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Helper().customTextField(
                        controller: _pincodeCltr,
                        isEnabled: true,
                        obscureText: false,
                        context: context,
                        hintText: "Election Card No.",
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Helper().customTextField(
                        controller: _emailCltr,
                        type: TextInputType.emailAddress,
                        obscureText: false,
                        context: context,
                        hintText: "Enter Email",
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(right: 250.0),
                        child: Text("Category", style: TextStyle(fontSize: 18)),
                      ),
                      Column(
                        children: [
                          Row(
                            children: [
                              Flexible(
                                flex: 1,
                                child: Row(
                                  children: [
                                    Radio(
                                      value: "male",
                                      groupValue: gender,
                                      onChanged: (value) {
                                        setState(() {
                                          gender = value.toString();
                                        });
                                      },
                                    ),
                                    const Text(
                                      "General",
                                      style: TextStyle(fontSize: 13),
                                    )
                                  ],
                                ),
                              ),
                              Flexible(
                                flex: 1,
                                child: Row(
                                  children: [
                                    Radio(
                                      value: "female",
                                      groupValue: gender,
                                      onChanged: (value) {
                                        setState(() {
                                          gender = value.toString();
                                        });
                                      },
                                    ),
                                    const Text("S.C")
                                  ],
                                ),
                              ),
                              Flexible(
                                flex: 1,
                                child: Row(
                                  children: [
                                    Radio(
                                      value: "other",
                                      groupValue: gender,
                                      onChanged: (value) {
                                        setState(() {
                                          gender = value.toString();
                                        });
                                      },
                                    ),
                                    const Text("S.T")
                                  ],
                                ),
                              ),
                              Flexible(
                                flex: 1,
                                child: Row(
                                  children: [
                                    Radio(
                                      value: "other1",
                                      groupValue: gender,
                                      onChanged: (value) {
                                        setState(() {
                                          gender = value.toString();
                                        });
                                      },
                                    ),
                                    const Text("O.B.C")
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(5.0),
              child: Text(
                "Family Detail (Same as Ratio Card)",
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: textColor,
                    fontSize: 18),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: SizeConfig.screenHeight,
                width: MediaQuery.of(context).size.width,
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  elevation: 4,
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(right: 220.0),
                        child: Text(
                          "Father Details",
                          style: TextStyle(color: textColor, fontSize: 18),
                        ),
                      ),
                      Helper().customTextField(
                        controller: _fnameCltr,
                        isEnabled: true,
                        obscureText: false,
                        context: context,
                        hintText: "Name",
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Helper().customTextField(
                        controller: _fOccupassionCltr,
                        isEnabled: true,
                        obscureText: false,
                        context: context,
                        hintText: "Occupation",
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Helper().customTextField(
                        controller: _feduCltr,
                        isEnabled: true,
                        obscureText: false,
                        context: context,
                        hintText: "Education",
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Helper().customTextField(
                        controller: _fpermobileCltr,
                        isEnabled: true,
                        obscureText: false,
                        context: context,
                        hintText: "Permanent Mobile Number",
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: SizeConfig.screenHeight,
                width: MediaQuery.of(context).size.width,
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  elevation: 4,
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(right: 220.0),
                        child: Text(
                          "Mother Details",
                          style: TextStyle(color: textColor, fontSize: 18),
                        ),
                      ),
                      Helper().customTextField(
                        // controller: _mnameCltr,
                        isEnabled: true,
                        obscureText: false,
                        context: context,
                        hintText: "Name",
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Helper().customTextField(
                        // controller: _mOccupassionCltr,
                        isEnabled: true,
                        obscureText: false,
                        context: context,
                        hintText: "Occupation",
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Helper().customTextField(
                        // controller: _meduCltr,
                        isEnabled: true,
                        obscureText: false,
                        context: context,
                        hintText: "Education",
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Helper().customTextField(
                        // controller: _mpermobileCltr,
                        isEnabled: true,
                        obscureText: false,
                        context: context,
                        hintText: "Permanent Mobile Number",
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: SizeConfig.screenHeight,
                width: MediaQuery.of(context).size.width,
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  elevation: 4,
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(right: 220.0),
                        child: Text(
                          "Wife Details",
                          style: TextStyle(color: textColor, fontSize: 18),
                        ),
                      ),
                      Helper().customTextField(
                        // controller: _wnameCltr,
                        isEnabled: true,
                        obscureText: false,
                        context: context,
                        hintText: "Name",
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Helper().customTextField(
                        // controller: _wOccupassionCltr,
                        isEnabled: true,
                        obscureText: false,
                        context: context,
                        hintText: "Occupation",
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Helper().customTextField(
                        // controller: _weduCltr,
                        isEnabled: true,
                        obscureText: false,
                        context: context,
                        hintText: "Education",
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Helper().customTextField(
                        // controller: _wpermobileCltr,
                        isEnabled: true,
                        obscureText: false,
                        context: context,
                        hintText: "Permanent Mobile Number",
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: SizeConfig.screenHeight,
                width: MediaQuery.of(context).size.width,
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  elevation: 4,
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(right: 220.0),
                        child: Text(
                          "Brother Details",
                          style: TextStyle(color: textColor, fontSize: 18),
                        ),
                      ),
                      Helper().customTextField(
                        // controller: _wnameCltr,
                        isEnabled: true,
                        obscureText: false,
                        context: context,
                        hintText: "Name",
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Helper().customTextField(
                        // controller: _wOccupassionCltr,
                        isEnabled: true,
                        obscureText: false,
                        context: context,
                        hintText: "Occupation",
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Helper().customTextField(
                        // controller: _weduCltr,
                        isEnabled: true,
                        obscureText: false,
                        context: context,
                        hintText: "Education",
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Helper().customTextField(
                        // controller: _wpermobileCltr,
                        isEnabled: true,
                        obscureText: false,
                        context: context,
                        hintText: "Permanent Mobile Number",
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: SizeConfig.screenHeight,
                width: MediaQuery.of(context).size.width,
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  elevation: 4,
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(right: 220.0),
                        child: Text(
                          "nominee Details",
                          style: TextStyle(color: textColor, fontSize: 18),
                        ),
                      ),
                      Helper().customTextField(
                        // controller: _wnameCltr,
                        isEnabled: true,
                        obscureText: false,
                        context: context,
                        hintText: "Name",
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Helper().customTextField(
                        // controller: _wOccupassionCltr,
                        isEnabled: true,
                        obscureText: false,
                        context: context,
                        hintText: "Occupation",
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Helper().customTextField(
                        // controller: _weduCltr,
                        isEnabled: true,
                        obscureText: false,
                        context: context,
                        hintText: "Education",
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Helper().customTextField(
                        // controller: _wpermobileCltr,
                        isEnabled: true,
                        obscureText: false,
                        context: context,
                        hintText: "Permanent Mobile Number",
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(5.0),
              child: Text(
                "Educational Details (Not any Graduation below)",
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: textColor,
                    fontSize: 18),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: SizeConfig.screenHeight,
                width: MediaQuery.of(context).size.width,
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  elevation: 4,
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(right: 220.0),
                        child: Text(
                          "standard 10",
                          style: TextStyle(color: textColor, fontSize: 18),
                        ),
                      ),
                      Helper().customTextField(
                        isEnabled: true,
                        obscureText: false,
                        context: context,
                        hintText: "Subject",
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Helper().customTextField(
                        isEnabled: true,
                        obscureText: false,
                        context: context,
                        hintText: "Passing Year ",
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Helper().customTextField(
                        isEnabled: true,
                        obscureText: false,
                        context: context,
                        hintText: "Grade Or Percentage",
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: SizeConfig.screenHeight,
                width: MediaQuery.of(context).size.width,
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  elevation: 4,
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(right: 220.0),
                        child: Text(
                          "standard 12",
                          style: TextStyle(color: textColor, fontSize: 18),
                        ),
                      ),
                      Helper().customTextField(
                        isEnabled: true,
                        obscureText: false,
                        context: context,
                        hintText: "Subject",
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Helper().customTextField(
                        isEnabled: true,
                        obscureText: false,
                        context: context,
                        hintText: "Passing Year ",
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Helper().customTextField(
                        isEnabled: true,
                        obscureText: false,
                        context: context,
                        hintText: "Grade Or Percentage",
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: SizeConfig.screenHeight,
                width: MediaQuery.of(context).size.width,
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  elevation: 4,
                  child: Column(
                    children: [
                      const Text(
                        "Graduation Or Diploma (BA, B.Com, B.Sc etc)",
                        style: TextStyle(color: textColor, fontSize: 18),
                      ),
                      Helper().customTextField(
                        isEnabled: true,
                        obscureText: false,
                        context: context,
                        hintText: "Subject",
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Helper().customTextField(
                        isEnabled: true,
                        obscureText: false,
                        context: context,
                        hintText: "Passing Year ",
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Helper().customTextField(
                        isEnabled: true,
                        obscureText: false,
                        context: context,
                        hintText: "Grade Or Percentage",
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: SizeConfig.screenHeight,
                width: MediaQuery.of(context).size.width,
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  elevation: 4,
                  child: Column(
                    children: [
                      const Text(
                        "Post Graduate Or Degree (MA, M.Com, M.Sc etc)",
                        style: TextStyle(color: textColor, fontSize: 18),
                      ),
                      Helper().customTextField(
                        isEnabled: true,
                        obscureText: false,
                        context: context,
                        hintText: "Subject",
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Helper().customTextField(
                        isEnabled: true,
                        obscureText: false,
                        context: context,
                        hintText: "Passing Year ",
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Helper().customTextField(
                        isEnabled: true,
                        obscureText: false,
                        context: context,
                        hintText: "Grade Or Percentage",
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: SizeConfig.screenHeight,
                width: MediaQuery.of(context).size.width,
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  elevation: 4,
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(right: 220.0),
                        child: Text(
                          "ITI or Other",
                          style: TextStyle(color: textColor, fontSize: 18),
                        ),
                      ),
                      Helper().customTextField(
                        isEnabled: true,
                        obscureText: false,
                        context: context,
                        hintText: "Subject",
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Helper().customTextField(
                        isEnabled: true,
                        obscureText: false,
                        context: context,
                        hintText: "Passing Year ",
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Helper().customTextField(
                        isEnabled: true,
                        obscureText: false,
                        context: context,
                        hintText: "Grade Or Percentage",
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(5.0),
              child: Text(
                "Other Educational Details",
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: textColor,
                    fontSize: 18),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: SizeConfig.screenHeight,
                width: MediaQuery.of(context).size.width,
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  elevation: 4,
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(right: 180.0),
                        child: Text(
                          "Certificate Course",
                          style: TextStyle(color: textColor, fontSize: 18),
                        ),
                      ),
                      Helper().customTextField(
                        isEnabled: true,
                        obscureText: false,
                        context: context,
                        hintText: "Name",
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Helper().customTextField(
                        isEnabled: true,
                        obscureText: false,
                        context: context,
                        hintText: "Year",
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: SizeConfig.screenHeight,
                width: MediaQuery.of(context).size.width,
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  elevation: 4,
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(right: 180.0),
                        child: Text(
                          "Training Or WorkShop",
                          style: TextStyle(color: textColor, fontSize: 18),
                        ),
                      ),
                      Helper().customTextField(
                        isEnabled: true,
                        obscureText: false,
                        context: context,
                        hintText: "Name",
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Helper().customTextField(
                        isEnabled: true,
                        obscureText: false,
                        context: context,
                        hintText: "Year",
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: SizeConfig.screenHeight,
                width: MediaQuery.of(context).size.width,
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  elevation: 4,
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(right: 180.0),
                        child: Text(
                          "Received Medal or prize",
                          style: TextStyle(color: textColor, fontSize: 18),
                        ),
                      ),
                      Helper().customTextField(
                        isEnabled: true,
                        obscureText: false,
                        context: context,
                        hintText: "Name",
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Helper().customTextField(
                        isEnabled: true,
                        obscureText: false,
                        context: context,
                        hintText: "Year",
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(5.0),
              child: Text(
                "Before company Details Information & Experience"
                "(Last Company First Mention)",
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: textColor,
                    fontSize: 18),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: SizeConfig.screenHeight,
                width: MediaQuery.of(context).size.width,
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  elevation: 4,
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(right: 200.0),
                        child: Text(
                          "First Company",
                          style: TextStyle(color: textColor, fontSize: 18),
                        ),
                      ),
                      Helper().customTextField(
                        isEnabled: true,
                        obscureText: false,
                        context: context,
                        hintText: "Company Name & Address ",
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Helper().customTextField(
                        isEnabled: true,
                        obscureText: false,
                        context: context,
                        hintText: "Designation",
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Helper().customTextField(
                        isEnabled: true,
                        obscureText: false,
                        context: context,
                        hintText: "Experience (Total Year)",
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Helper().customTextField(
                        isEnabled: true,
                        obscureText: false,
                        context: context,
                        hintText: "Detail Of salary Last Drawn",
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: SizeConfig.screenHeight,
                width: MediaQuery.of(context).size.width,
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  elevation: 4,
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(right: 200.0),
                        child: Text(
                          "Second Company",
                          style: TextStyle(color: textColor, fontSize: 18),
                        ),
                      ),
                      Helper().customTextField(
                        isEnabled: true,
                        obscureText: false,
                        context: context,
                        hintText: "Company Name & Address ",
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Helper().customTextField(
                        isEnabled: true,
                        obscureText: false,
                        context: context,
                        hintText: "Designation",
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Helper().customTextField(
                        isEnabled: true,
                        obscureText: false,
                        context: context,
                        hintText: "Experience (Total Year)",
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Helper().customTextField(
                        isEnabled: true,
                        obscureText: false,
                        context: context,
                        hintText: "Detail Of salary Last Drawn",
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: SizeConfig.screenHeight,
                width: MediaQuery.of(context).size.width,
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  elevation: 4,
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(right: 200.0),
                        child: Text(
                          "Third Company",
                          style: TextStyle(color: textColor, fontSize: 18),
                        ),
                      ),
                      Helper().customTextField(
                        isEnabled: true,
                        obscureText: false,
                        context: context,
                        hintText: "Company Name & Address ",
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Helper().customTextField(
                        isEnabled: true,
                        obscureText: false,
                        context: context,
                        hintText: "Designation",
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Helper().customTextField(
                        isEnabled: true,
                        obscureText: false,
                        context: context,
                        hintText: "Experience (Total Year)",
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Helper().customTextField(
                        isEnabled: true,
                        obscureText: false,
                        context: context,
                        hintText: "Detail Of salary Last Drawn",
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 50.0),
              child: Helper().customTextField(
                isEnabled: true,
                obscureText: false,
                context: context,
                hintText: "No Experience Details",
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(5.0),
              child: Text(
                "Before Document Uploaded This Form Attached "
                "(Attached Document Tick Mark)",
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: textColor,
                    fontSize: 18),
              ),
            ),
            Row(
              children: [
              Padding(
                padding: const EdgeInsets.only(right:25.0,left:25),
                child: InkWell(
                onTap: () {
                  var uploadProductImage2 = uploadProductImage;
                  uploadProductImage2().whenComplete(() => Get.dialog(AlertDialog(
                        title: Text("Your Image".tr),
                        content: Container(
                          child: _pImage.existsSync()
                              ? Image.file(_pImage)
                              : const Text("No Image"),
                        ),
                        actions: [
                          TextButton(
                              onPressed: () => Get.back(),
                              child: const Text(
                                "Cancel",
                                style: TextStyle(fontSize: 16),
                              )),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 2,
                            child: Helper().customMaterialButton(
                                bName: "Submit",
                                fSize: 20,
                                context: context,
                                press: () {
                                  print(_pImage.path);
                                  // uploadImage();

                                  Get.back();
                                }),
                          )
                        ],
                      )));
                },
                child: Card(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                    ),
                    height: MediaQuery.of(context).size.width / 2,
                    width: MediaQuery.of(context).size.width / 2.7,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _pImage == null
                              ? Text("")
                              : Container(
                                  height: 150, child: Image.file(_pImage)),
                          Helper().customText(
                            fWeight: FontWeight.bold,
                            text: _pImage == null ? "Upload Product Image" : "",
                          ),
                          customAssetPath(imagePath: adharCard, size: 30)
                        ],
                      ),
                    ),
                  ),
                ),
            ),
              ),
            Padding(
              padding: const EdgeInsets.only(right:25.0,),
              child: InkWell(
                onTap: () {
                  var uploadProductImage2 = uploadProductImage;
                  uploadProductImage2().whenComplete(() => Get.dialog(AlertDialog(
                        title: Text("Your Image".tr),
                        content: Container(
                          child: _pImage.existsSync()
                              ? Image.file(_pImage)
                              : const Text("No Image"),
                        ),
                        actions: [
                          TextButton(
                              onPressed: () => Get.back(),
                              child: const Text(
                                "Cancel",
                                style: TextStyle(fontSize: 16),
                              )),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 2,
                            child: Helper().customMaterialButton(
                                bName: "Submit",
                                fSize: 20,
                                context: context,
                                press: () {
                                  print(_pImage.path);

                                  Get.back();
                                }),
                          )
                        ],
                      )));
                },
                child: Card(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                    ),
                    height: MediaQuery.of(context).size.width / 2,
                    width: MediaQuery.of(context).size.width / 2.7,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _pImage == null
                              ? Text("")
                              : Container(
                                  height: 150, child: Image.file(_pImage)),
                          Helper().customText(
                            fWeight: FontWeight.bold,
                            text: _pImage == null ? "Upload Product Image" : "",
                          ),
                          customAssetPath(imagePath: adharCard, size: 30)
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
              ],
            ),
            
            
          ],
        ),
      ),
    );
  }
}
