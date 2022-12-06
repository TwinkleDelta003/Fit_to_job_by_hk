import 'package:fit_to_job/API/Controller/login_Controller.dart';
import 'package:fit_to_job/Screens/Authentication/registration_screen.dart';
import 'package:fit_to_job/Screens/CommonScreen/job_profile.dart';
import 'package:fit_to_job/Screens/Constant/Colorpath.dart';
import 'package:fit_to_job/Screens/Constant/imagePath.dart';
import 'package:fit_to_job/Screens/Widgets/hepler.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

bool isDisable = false;

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _mobileCltr = TextEditingController();
  final TextEditingController _aadharCltr = TextEditingController();
  final TextEditingController _otpCltr = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 15,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 80,
              ),
              customAssetPath(imagePath: logoImage, size: 100),
              const SizedBox(
                height: 50,
              ),
              Helper().customText(
                  text: "Online iExam Login ",
                  fontSize: 24,
                  fWeight: FontWeight.bold),
              const SizedBox(
                height: 40,
              ),
              Helper().customTextField(
                controller: _aadharCltr,
                mLength: 12,
                type: TextInputType.number,
                isEnabled: true,
                prefix: customAssetPath(
                  imagePath: aadharcard,
                ),
                obscureText: false,
                context: context,
                hintText: "Aadhar Card No.",
              ),
              const SizedBox(
                height: 10,
              ),
              Helper().customTextField(
                controller: _mobileCltr,
                mLength: 10,
                isEnabled: true,
                type: TextInputType.number,
                prefix: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.phone_android,
                      color: Color(0xff1aa19a),
                    )),
                obscureText: false,
                context: context,
                hintText: "Mobile Number",
              ),
              const SizedBox(
                height: 50,
              ),
              Helper().customMaterialButton(
                bName: "Send OTP",
                context: context,
                fSize: 26,
                fweight: FontWeight.bold,
                press: () {
                  errorLens();
                },
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                "OTP Send on your registered Number:",
                style: TextStyle(color: textColor, fontSize: 18),
              ),
              const SizedBox(
                height: 20,
              ),
              Helper().customPinPut(
                controller: _otpCltr,
              ),
              const SizedBox(
                height: 20,
              ),
              Helper().customMaterialButton(
                bName: "Login",
                context: context,
                fSize: 26,
                fweight: FontWeight.bold,
                press: () {
                  // Navigator.push(
                  //         context,
                  //         MaterialPageRoute(
                  //             builder: (context) => const Jobprofile()));
                  errorLens1();
                },
              ),
              const SizedBox(height: 10,),
              Center(
                child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginScreen()));
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 90),
                      child: Center(
                        child: Row(
                          children: [
                            const Text("Don't have an account? "),
                            const SizedBox(
                              width: 10,
                            ),
                            InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const Registrationscreen()));
                                },
                                child: const Center(
                                    child: Text(
                                  "Register",
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400),
                                )))
                          ],
                        ),
                      ),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }

  errorLens() {
    if (_aadharCltr.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(customSnackbar(
          label: "",
          time: const Duration(seconds: 5),
          press: () {},
          msg: "Enter Aadhar Card Number ",
          chooseColor: Colors.red));
    } else if (_aadharCltr.text.length < 12) {
      ScaffoldMessenger.of(context).showSnackBar(customSnackbar(
          label: "",
          time: const Duration(seconds: 5),
          press: () {},
          msg: "Enter 12 digit Aadhar Card Number",
          chooseColor: Colors.red));
    } else if (_mobileCltr.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(customSnackbar(
          label: "",
          time: const Duration(seconds: 5),
          press: () {},
          msg: "Enter Your Mobile Number",
          chooseColor: Colors.red));
    } else if (_mobileCltr.text.length < 10) {
      ScaffoldMessenger.of(context).showSnackBar(customSnackbar(
          label: "",
          time: const Duration(seconds: 5),
          press: () {},
          msg: "Enter 10 Digit mobile Number",
          chooseColor: Colors.red));
    } else {
      loginAPI(
          aadharCardNo: _aadharCltr.text,
          mobileNo: _mobileCltr.text,
          context: context);
    }
  }

  errorLens1() {
    if (_otpCltr.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(customSnackbar(
          label: "",
          time: const Duration(seconds: 5),
          press: () {},
          msg: "Enter OTP",
          chooseColor: Colors.red));
    } else {
      verifyOTP(
          mobileNo: _mobileCltr.text, OTP: _otpCltr.text, context: context);
    }
  }
}
