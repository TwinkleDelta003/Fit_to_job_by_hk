import 'package:fit_to_job/Screens/CommonScreen/result_screen.dart';
import 'package:fit_to_job/Screens/Constant/imagePath.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'dart:async';
import 'dart:math';
import '../Constant/responsive.dart';
import '../Widgets/hepler.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({Key key}) : super(key: key);

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  int marks = 0;
  int i = 1;
  bool disableAnswer = false;
  // extra varibale to iterate
  int j = 1;
  int timer = 5;
  String showtimer = "5";
  bool canceltimer = false;
  var random_array;
  @override
  void initState() {
    starttimer();
    // genrandomarray();
    super.initState();
  }

  // overriding the setstate function to be called only if mounted
  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  void starttimer() async {
    const onesec = Duration(seconds: 1);
    Timer.periodic(onesec, (Timer t) {
      setState(() {
        if (timer < 1) {
          t.cancel();
          nextquestion();
        } else if (canceltimer == true) {
          t.cancel();
        } else {
          timer = timer - 1;
        }
        showtimer = timer.toString();
      });
    });
  }

  void nextquestion() {
    canceltimer = false;
    timer = 5;
    setState(() {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => const ResultScreen(),
      ));
      // if (j < 10) {
      //   i = random_array[j];
      //   j++;
      // } else {
        // Navigator.of(context).pushReplacement(MaterialPageRoute(
        //   builder: (context) => const ResultScreen(),
        // ));
      // }
      // btncolor["a"] = Colors.indigoAccent;
      // btncolor["b"] = Colors.indigoAccent;
      // btncolor["c"] = Colors.indigoAccent;
      // btncolor["d"] = Colors.indigoAccent;
      disableAnswer = false;
    });
    // starttimer();
  }

  // genrandomarray() {
  //   var distinctIds = [];
  //   var rand = Random();
  //   for (int i = 0;;) {
  //     distinctIds.add(rand.nextInt(10));
  //     random_array = distinctIds.toSet().toList();
  //     if (random_array.length < 10) {
  //       continue;
  //     } else {
  //       break;
  //     }
  //   }
  //   debugPrint(random_array);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF6FFFD),
      appBar: AppBar(
        backgroundColor: const Color(0xffF6FFFD),
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
            "Your Name",
            style: TextStyle(
                color: Color(0xff1AA19A),
                fontSize: 24,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: starttimer,
              child: const Text("data"),
            ),
            ListTile(
              leading: customAssetPath(imagePath: remain, size: 25),
              title: Text("Remaining Time:  $showtimer"),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 15.0),
              child: Text(
                "Question: 1/5       ",
                style: TextStyle(fontSize: 18, color: Color(0xff0011AC)),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: Text(
                "1. Who Should be Part of the implementation team?",
                style: TextStyle(
                    color: Color(0xff018F89),
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
              ),
            ),
            Column(
              children: [
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: SizeConfig.screenWidth,
                      height: MediaQuery.of(context).size.height / 8,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        color: Colors.white,
                        child: Row(
                          children: [
                            Column(
                              children: const [
                                SizedBox(height: 12),
                                Padding(
                                  padding: EdgeInsets.only(top: 3.0, right: 90),
                                  child: CircleAvatar(
                                      backgroundColor: Color(0xffD9D9D9),
                                      radius: 7),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 20.0),
                                  child: Text("State GM Excutive"),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    )),
              ],
            ),
            Column(
              children: [
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: SizeConfig.screenWidth,
                      height: MediaQuery.of(context).size.height / 8,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        color: Colors.white,
                        child: Row(
                          children: [
                            Column(
                              children: const [
                                SizedBox(height: 12),
                                Padding(
                                  padding: EdgeInsets.only(top: 3.0, right: 90),
                                  child: CircleAvatar(
                                      backgroundColor: Color(0xffD9D9D9),
                                      radius: 7),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 20.0),
                                  child: Text("State GM Excutive"),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    )),
              ],
            ),
            Column(
              children: [
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: SizeConfig.screenWidth,
                      height: MediaQuery.of(context).size.height / 8,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        color: Colors.white,
                        child: Row(
                          children: [
                            Column(
                              children: const [
                                SizedBox(height: 12),
                                Padding(
                                  padding: EdgeInsets.only(top: 3.0, right: 90),
                                  child: CircleAvatar(
                                      backgroundColor: Color(0xffD9D9D9),
                                      radius: 7),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 20.0),
                                  child: Text("State GM Excutive"),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    )),
              ],
            ),
            Column(
              children: [
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: SizeConfig.screenWidth,
                      height: MediaQuery.of(context).size.height / 8,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        color: Colors.white,
                        child: Row(
                          children: [
                            Column(
                              children: const [
                                SizedBox(height: 12),
                                Padding(
                                  padding: EdgeInsets.only(top: 3.0, right: 90),
                                  child: CircleAvatar(
                                      backgroundColor: Color(0xffD9D9D9),
                                      radius: 7),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 20.0),
                                  child: Text("State GM Excutive"),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    )),
                Padding(
                  padding: const EdgeInsets.only(left: 35.0),
                  child: Row(
                    children: [
                      Helper().customMaterialButton3(
                        bName: "Next",
                        context: context,
                        fSize: 24,
                        fweight: FontWeight.w500,
                        press: () {
                          // errorLens();
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const ResultScreen()));
                        },
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Helper().customMaterialButton4(
                        bName: "Skip",
                        context: context,
                        fSize: 24,
                        fweight: FontWeight.w500,
                        press: () {
                          // errorLens();
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => const RuleScreen()));
                        },
                      ),
                    ],
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
