import 'package:fit_to_job/Screens/Authentication/login_screen.dart';
import 'package:fit_to_job/Screens/Constant/imagePath.dart';
import 'package:fit_to_job/Screens/Widgets/hepler.dart';
import 'package:flutter/material.dart';

import '../../API/Controller/register_Controller.dart';

class Registrationscreen extends StatefulWidget {
  const Registrationscreen({Key key}) : super(key: key);

  @override
  State<Registrationscreen> createState() => RegistrationscreenState();
}

class RegistrationscreenState extends State<Registrationscreen> {
  final TextEditingController _aadharCltr = TextEditingController();
  final TextEditingController _fnameCltr = TextEditingController();
  final TextEditingController _snameCltr = TextEditingController();
  final TextEditingController _surnameCltr = TextEditingController();
  final TextEditingController _mobileCltr = TextEditingController();
  final TextEditingController _cityCltr = TextEditingController();
  final TextEditingController _talukaCltr = TextEditingController();
  final TextEditingController _districtCltr = TextEditingController();
  final TextEditingController _stateCltr = TextEditingController();
  final TextEditingController _addressCltr = TextEditingController();
  String fcmId;

  @override
  void initState() {
    super.initState();
  }

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
                  text: "Online iExam Registration ",
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
                prefix: customAssetPath(imagePath: aadharcard, size: 10),
                obscureText: false,
                context: context,
                hintText: "Aadhar Card No.",
              ),
              const SizedBox(
                height: 10,
              ),
              Helper().customTextField(
                controller: _fnameCltr,
                isEnabled: true,
                prefix: customAssetPath(imagePath: user),
                obscureText: false,
                context: context,
                hintText: "Enter Your Name",
              ),
              const SizedBox(
                height: 10,
              ),
              Helper().customTextField(
                controller: _snameCltr,
                isEnabled: true,
                prefix: customAssetPath(imagePath: dad,size: 30),
                obscureText: false,
                context: context,
                hintText: "father Name",
              ),
              const SizedBox(
                height: 10,
              ),
              Helper().customTextField(
                controller: _surnameCltr,
                isEnabled: true,
                prefix: customAssetPath(imagePath: user),
                obscureText: false,
                context: context,
                hintText: "Surname",
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
                height: 10,
              ),
              Helper().customTextField(
                controller: _cityCltr,
                isEnabled: true,
                prefix: Image.asset(village, height: 40),
                obscureText: false,
                context: context,
                hintText: "Village/City",
              ),
              const SizedBox(
                height: 10,
              ),
              Helper().customTextField(
                controller: _talukaCltr,
                isEnabled: true,
                prefix: customAssetPath(imagePath: taluka),
                obscureText: false,
                context: context,
                hintText: "Taluka",
              ),
              const SizedBox(
                height: 10,
              ),
              Helper().customTextField(
                controller: _districtCltr,
                isEnabled: true,
                prefix: customAssetPath(imagePath: district),
                obscureText: false,
                context: context,
                hintText: "District",
              ),
              const SizedBox(
                height: 10,
              ),
              Helper().customTextField(
                controller: _stateCltr,
                isEnabled: true,
                prefix: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.location_city,
                      color: Color(0xff1aa19a),
                    )),
                obscureText: false,
                context: context,
                hintText: "State",
              ),
              const SizedBox(
                height: 10,
              ),
              Helper().customTextField(
                controller: _addressCltr,
                isEnabled: true,
                prefix: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.location_history,
                      color: Color(0xff1aa19a),
                    )),
                obscureText: false,
                context: context,
                hintText: "Address",
              ),
              const SizedBox(
                height: 50,
              ),
              Helper().customMaterialButton(
                bName: "Register",
                context: context,
                fSize: 26,
                fweight: FontWeight.bold,
                press: () {
                  errorLens();
                },
              ),
              const SizedBox(
                height: 10,
              ),
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
                            const Text("Already have an account?"),
                            const SizedBox(
                              width: 10,
                            ),
                            InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const LoginScreen()));
                                },
                                child: const Center(
                                    child: Text(
                                  "Login",
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
    } else if (_fnameCltr.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(customSnackbar(
          label: "",
          time: const Duration(seconds: 5),
          press: () {},
          msg: "Enter Your Name",
          chooseColor: Colors.red));
    } else if (_snameCltr.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(customSnackbar(
          label: "",
          time: const Duration(seconds: 5),
          press: () {},
          msg: "Enter Your Father Name",
          chooseColor: Colors.red));
    } else if (_surnameCltr.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(customSnackbar(
          label: "",
          time: const Duration(seconds: 5),
          press: () {},
          msg: "Enter Your Surname",
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
    } else if (_cityCltr.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(customSnackbar(
          label: "",
          time: const Duration(seconds: 5),
          press: () {},
          msg: "Enter City Name",
          chooseColor: Colors.red));
    } else if (_talukaCltr.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(customSnackbar(
          label: "",
          time: const Duration(seconds: 5),
          press: () {},
          msg: "Enter Taluka Name",
          chooseColor: Colors.red));
    } else if (_districtCltr.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(customSnackbar(
          label: "",
          time: const Duration(seconds: 5),
          press: () {},
          msg: "Enter District Name",
          chooseColor: Colors.red));
    } else if (_stateCltr.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(customSnackbar(
          label: "",
          time: const Duration(seconds: 5),
          press: () {},
          msg: "Enter State Name",
          chooseColor: Colors.red));
    } else if (_addressCltr.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(customSnackbar(
          label: "",
          time: const Duration(seconds: 5),
          press: () {},
          msg: "Enter Address ",
          chooseColor: Colors.red));
    } else {
      registerAPI(
          aadharCardNo: _aadharCltr.text,
          firstName: _fnameCltr.text,
          middleName: _snameCltr.text,
          lastName: _surnameCltr.text,
          mobileNo: _mobileCltr.text,
          city: _cityCltr.text,
          taluka: _talukaCltr.text,
          district: _districtCltr.text,
          state: _stateCltr.text,
          address: _addressCltr.text,
          // fcmId: fcmId,
          context: context);
    }
  }
}
