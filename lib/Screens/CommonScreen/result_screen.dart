import 'package:fit_to_job/Screens/CommonScreen/uploaddoc_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Widgets/hepler.dart';
import 'test_screen.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({Key key}) : super(key: key);

  @override
  State<ResultScreen> createState() => ResultScreenState();
}

class ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 237, 255, 251),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color.fromARGB(255, 237, 255, 251),
        leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Color(0xff018F89),
            ),
            onPressed: () => Get.back()),
        title: const Padding(
          padding: EdgeInsets.only(right: 120.0),
          child: Text(
            "Your Name ",
            style: TextStyle(
                color: Color(0xff1AA19A),
                fontSize: 24,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                height: MediaQuery.of(context).size.height / 5,
                width: MediaQuery.of(context).size.height / 5,
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(100),
                    gradient: const LinearGradient(
                        colors: [
                          Color(0xff87F3E2),
                          Color.fromARGB(255, 1, 121, 115),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter)),
                child: const Center(
                  child: Text(
                    "PASS",
                    style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  //  Text(
                  //   "FAIL",
                  //   style: TextStyle(
                  //       fontSize: 32,
                  //       fontWeight: FontWeight.bold,
                  //       color: Colors.white),
                  // ),
                )),
            const SizedBox(
              height: 40,
            ),
            const Text(
              "Congratulation!!!",
              style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff127D00)),
            ),
            //  const Text(
            //   "OOPS!!!",
            //   style: TextStyle(
            //       fontSize: 28,
            //       fontWeight: FontWeight.bold,
            //       color: Color(0xff1A3770)),
            // ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0xff00716C),
                        blurRadius: 2.0,
                        spreadRadius: 0.0,
                        offset: Offset(2.0, 2.0),
                      )
                    ],
                  ),
                  height: MediaQuery.of(context).size.width / 1.5,
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 100.0),
                    child: Column(
                      children: const [
                        ListTile(
                          leading: CircleAvatar(
                            radius: 10,
                            backgroundColor: Color(0xff2FC850),
                          ),
                          title: Text(
                            "3",
                            style: TextStyle(
                                color: Color(0xff2FC850),
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            "Correct",
                            style: TextStyle(
                                color: Color(0xff2FC850),
                                fontSize: 18,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                        ListTile(
                          leading: CircleAvatar(
                            radius: 10,
                            backgroundColor: Color(0xffC8412F),
                          ),
                          title: Text(
                            "0",
                            style: TextStyle(
                                color: Color(0xffC8412F),
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            "Wrong",
                            style: TextStyle(
                                color: Color(0xffC8412F),
                                fontSize: 18,
                                fontWeight: FontWeight.w700),
                          ),
                        ), //2F91C8
                        ListTile(
                          leading: CircleAvatar(
                            radius: 10,
                            backgroundColor: Color(0xff2F91C8),
                          ),
                          title: Text(
                            "0",
                            style: TextStyle(
                                color: Color(0xff2F91C8),
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            "Unattempted",
                            style: TextStyle(
                                color: Color(0xff2F91C8),
                                fontSize: 18,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ],
                    ),
                  )),
            ),
            const SizedBox(
              height: 30,
            ),
            Helper().customMaterialButton2(
              bName: "Continue",
              context: context,
              fSize: 24,
              fweight: FontWeight.w500,
              press: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const UploadScreen()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
