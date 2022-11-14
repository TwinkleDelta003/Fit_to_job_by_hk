import 'package:fit_to_job/Screens/CommonScreen/test_screen.dart';
import 'package:fit_to_job/Screens/Constant/imagePath.dart';
import 'package:flutter/material.dart';

import '../Constant/Colorpath.dart';
import '../Widgets/hepler.dart';

class RuleScreen extends StatefulWidget {
  const RuleScreen({Key key}) : super(key: key);

  @override
  State<RuleScreen> createState() => RuleScreenState();
}

class RuleScreenState extends State<RuleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(60.0),
                bottomRight: Radius.circular(60.0),
              )),
              height: MediaQuery.of(context).size.height / 2.7,
              child: Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height / 4.5,
                    decoration: const BoxDecoration(
                        color: Color(0xff018F89),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30.0),
                          bottomRight: Radius.circular(30.0),
                        )),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 40.0, right: 50, left: 50),
                    child: Text(
                      "User Name",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Positioned(
                      top: 70,
                      left: 10,
                      right: 10,
                      child: customAssetPath(imagePath: rules, size: 220)),
                ],
              ),
            ),
            ListTile(
              leading: customAssetPath(imagePath: rule, size: 30),
              title: const Text(
                "Rules of Exam",
                style: TextStyle(
                    color: textColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
            ),
                const Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: Text(
                "1. Candidate can participate from anywhere in Examination. By using any suitable device which have internet connectivity like  computer,laptop, mobile, table etc.",textAlign: TextAlign.justify,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
              ),
            ),
            const SizedBox(height: 50,),
            Center(
              child: Helper().customMaterialButton2(
                bName: "Continue",
                context: context,
                fSize: 24,
                fweight: FontWeight.w500,
                press: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const TestScreen()));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
