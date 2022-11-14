import 'package:fit_to_job/Screens/CommonScreen/rules_screen.dart';
import 'package:fit_to_job/Screens/Constant/Colorpath.dart';
import 'package:fit_to_job/Screens/Constant/imagePath.dart';
import 'package:flutter/material.dart';

import '../Constant/responsive.dart';
import '../Widgets/hepler.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: Icon(
              Icons.logout,
              color: textColor,
              size: 30,
            ),
          )
        ],
        leading: Padding(
            padding: const EdgeInsets.all(10.0),
            child: customAssetPath(imagePath: logoImage)),
        title: const Padding(
          padding: EdgeInsets.only(right: 120.0),
          child: Text(
            "Online iExam",
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
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: SizedBox(
                height: MediaQuery.of(context).size.height / 7,
                width: MediaQuery.of(context).size.width,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  elevation: 10,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0, top: 10),
                        child: Row(
                          children: [
                            customAssetPath(imagePath: username, size: 30),
                            const SizedBox(
                              width: 10,
                            ),
                            const Text(
                              "User Name",
                              style: TextStyle(color: textColor, fontSize: 18),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0, top: 10),
                        child: Row(
                          children: [
                            customAssetPath(imagePath: jobprofile, size: 30),
                            const SizedBox(
                              width: 10,
                            ),
                            const Text(
                              "CNC Operator && Security Canteen",
                              style: TextStyle(color: textColor, fontSize: 18),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Container(
              height: 150,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(colors: [
                Color(0xffffffff),
                Color(0xff89CBC8),
                Color(0xff018F89),
              ], stops: [
                0.1,
                0.8,
                2.0
              ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
              alignment: Alignment.center,
              child: customAssetPath(imagePath: onlinetest, size: 130),
            ),
            Container(
              color: const Color(0xff018F89),
              height: SizeConfig.screenHeight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 18.0),
                    child: Text(
                      "Level Wise Test Series",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 18),
                    ),
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    color: Colors.white,
                    child: Row(
                      children: [
                        Column(
                          children: [
                            const SizedBox(height: 12),
                            Padding(
                              padding: const EdgeInsets.only(right: 150),
                              child: Row(
                                children: const [
                                  Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: CircleAvatar(
                                        backgroundColor: Color(0xff018F89),
                                        radius: 5),
                                  ),
                                  Text(
                                    "Purchase GRN Entry in PPC",
                                    style: TextStyle(
                                        color: Color(0xff018F89),
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                Column(
                                  children: [
                                    Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              2.3,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              8.2,
                                          child: Card(
                                            elevation: 6,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                            color: Colors.white,
                                            child: Row(
                                              children: [
                                                Column(
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  top: 8.0,
                                                                  left: 20),
                                                          child:
                                                              customAssetPath(
                                                                  imagePath:
                                                                      level,
                                                                  size: 30),
                                                        ),
                                                        const Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: 45.0),
                                                          child: Text(
                                                            "1",
                                                            style: TextStyle(
                                                                fontSize: 18,
                                                                color: Color(
                                                                    0xff9B1A48),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                    Row(
                                                      children: const [
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                            top: 5.0,
                                                            right: 15,
                                                          ),
                                                          child: Text("Level",
                                                              style: TextStyle(
                                                                  color: Color(
                                                                      0xff9B1A48),
                                                                  fontSize: 18,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600)),
                                                        )
                                                      ],
                                                    ),
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
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              2.3,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              8.2,
                                          child: Card(
                                            elevation: 6,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                            color: Colors.white,
                                            child: Row(
                                              children: [
                                                Column(
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  top: 5.0,
                                                                  left: 20),
                                                          child:
                                                              customAssetPath(
                                                                  imagePath:
                                                                      starttime,
                                                                  size: 30),
                                                        ),
                                                        const Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: 10.0),
                                                          child: Text(
                                                            "12:30 AM",
                                                            style: TextStyle(
                                                                fontSize: 18,
                                                                color: Color(
                                                                    0xff9B1A48),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                    Row(
                                                      children: const [
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                            top: 8.0,
                                                            right: 15,
                                                          ),
                                                          child: Text(
                                                              "Start Time",
                                                              style: TextStyle(
                                                                  color: Color(
                                                                      0xff9B1A48),
                                                                  fontSize: 18,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600)),
                                                        )
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        )),
                                  ],
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Column(
                                  children: [
                                    Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              2.3,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              8.2,
                                          child: Card(
                                            elevation: 6,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                            color: Colors.white,
                                            child: Row(
                                              children: [
                                                Column(
                                                  children: [
                                                    // const SizedBox(height: 5),
                                                    Row(
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  top: 5.0,
                                                                  left: 20),
                                                          child:
                                                              customAssetPath(
                                                                  imagePath:
                                                                      duration,
                                                                  size: 30),
                                                        ),
                                                        // const SizedBox(width: 30,),
                                                        const Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: 10.0),
                                                          child: Text(
                                                            "30 min",
                                                            style: TextStyle(
                                                                fontSize: 18,
                                                                color: Color(
                                                                    0xff9B1A48),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                    Row(
                                                      children: const [
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                            top: 8.0,
                                                            right: 15,
                                                          ),
                                                          child: Text(
                                                              "Duration",
                                                              style: TextStyle(
                                                                  color: Color(
                                                                      0xff9B1A48),
                                                                  fontSize: 18,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600)),
                                                        )
                                                      ],
                                                    ),
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
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              2.3,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              8.2,
                                          child: Card(
                                            elevation: 6,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                            color: Colors.white,
                                            child: Row(
                                              children: [
                                                Column(
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  top: 5.0,
                                                                  left: 20),
                                                          child:
                                                              customAssetPath(
                                                                  imagePath:
                                                                      question,
                                                                  size: 30),
                                                        ),
                                                        const Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: 40.0),
                                                          child: Text(
                                                            "5",
                                                            style: TextStyle(
                                                                fontSize: 22,
                                                                color: Color(
                                                                    0xff9B1A48),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                    const Divider(
                                                      thickness: 5,
                                                      color: Colors.black,
                                                      height: 10,
                                                    ),
                                                    Row(
                                                      children: const [
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  top: 8.0,
                                                                  // right: 10,
                                                                  left: 20),
                                                          child: Text(
                                                              "Total Question",
                                                              style: TextStyle(
                                                                  color: Color(
                                                                      0xff9B1A48),
                                                                  fontSize: 18,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600)),
                                                        )
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        )),
                                  ],
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 90.0,
                              ),
                              child: Helper().customMaterialButton2(
                                bName: "Start Test!!!",
                                context: context,
                                fSize: 24,
                                fweight: FontWeight.w500,
                                press: () {
                                  // errorLens();
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const RuleScreen()));
                                },
                              ),
                            ),
                            const SizedBox(
                              height: 7,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    color: Colors.white,
                    child: Row(
                      children: [
                        Column(
                          children: [
                            const SizedBox(height: 12),
                            Padding(
                              padding: const EdgeInsets.only(right: 150),
                              child: Row(
                                children: const [
                                  Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: CircleAvatar(
                                        backgroundColor: Color(0xff018F89),
                                        radius: 5),
                                  ),
                                  Text(
                                    "Purchase GRN Entry in PPC",
                                    style: TextStyle(
                                        color: Color(0xff018F89),
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                Column(
                                  children: [
                                    Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              2.3,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              8.2,
                                          child: Card(
                                            elevation: 6,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                            color: Colors.white,
                                            child: Row(
                                              children: [
                                                Column(
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  top: 8.0,
                                                                  left: 20),
                                                          child:
                                                              customAssetPath(
                                                                  imagePath:
                                                                      level,
                                                                  size: 35),
                                                        ),
                                                        const Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: 45.0),
                                                          child: Text(
                                                            "1",
                                                            style: TextStyle(
                                                                fontSize: 22,
                                                                color: Color(
                                                                    0xff9B1A48),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                    Row(
                                                      children: const [
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                            top: 5.0,
                                                            right: 15,
                                                          ),
                                                          child: Text("Level",
                                                              style: TextStyle(
                                                                  color: Color(
                                                                      0xff9B1A48),
                                                                  fontSize: 18,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600)),
                                                        )
                                                      ],
                                                    ),
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
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              2.3,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              8.2,
                                          child: Card(
                                            elevation: 6,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                            color: Colors.white,
                                            child: Row(
                                              children: [
                                                Column(
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  top: 5.0,
                                                                  left: 20),
                                                          child:
                                                              customAssetPath(
                                                                  imagePath:
                                                                      starttime,
                                                                  size: 35),
                                                        ),
                                                        const Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: 10.0),
                                                          child: Text(
                                                            "12:30 AM",
                                                            style: TextStyle(
                                                                fontSize: 22,
                                                                color: Color(
                                                                    0xff9B1A48),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                    Row(
                                                      children: const [
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                            top: 8.0,
                                                            right: 15,
                                                          ),
                                                          child: Text(
                                                              "Start Time",
                                                              style: TextStyle(
                                                                  color: Color(
                                                                      0xff9B1A48),
                                                                  fontSize: 18,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600)),
                                                        )
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        )),
                                  ],
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Column(
                                  children: [
                                    Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              2.3,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              8.2,
                                          child: Card(
                                            elevation: 6,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                            color: Colors.white,
                                            child: Row(
                                              children: [
                                                Column(
                                                  children: [
                                                    // const SizedBox(height: 5),
                                                    Row(
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  top: 5.0,
                                                                  left: 20),
                                                          child:
                                                              customAssetPath(
                                                                  imagePath:
                                                                      duration,
                                                                  size: 35),
                                                        ),
                                                        // const SizedBox(width: 30,),
                                                        const Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: 10.0),
                                                          child: Text(
                                                            "30 min",
                                                            style: TextStyle(
                                                                fontSize: 22,
                                                                color: Color(
                                                                    0xff9B1A48),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                    Row(
                                                      children: const [
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                            top: 8.0,
                                                            right: 15,
                                                          ),
                                                          child: Text(
                                                              "Duration",
                                                              style: TextStyle(
                                                                  color: Color(
                                                                      0xff9B1A48),
                                                                  fontSize: 18,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600)),
                                                        )
                                                      ],
                                                    ),
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
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              2.3,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              8.2,
                                          child: Card(
                                            elevation: 6,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                            color: Colors.white,
                                            child: Row(
                                              children: [
                                                Column(
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  top: 5.0,
                                                                  left: 20),
                                                          child:
                                                              customAssetPath(
                                                                  imagePath:
                                                                      question,
                                                                  size: 35),
                                                        ),
                                                        const Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: 40.0),
                                                          child: Text(
                                                            "5",
                                                            style: TextStyle(
                                                                fontSize: 22,
                                                                color: Color(
                                                                    0xff9B1A48),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                    Row(
                                                      children: const [
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  top: 8.0,
                                                                  // right: 10,
                                                                  left: 20),
                                                          child: Text(
                                                              "Total Question",
                                                              style: TextStyle(
                                                                  color: Color(
                                                                      0xff9B1A48),
                                                                  fontSize: 18,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600)),
                                                        )
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        )),
                                  ],
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 90.0,
                              ),
                              child: Helper().customMaterialButton2(
                                bName: "Start Test!!!",
                                context: context,
                                fSize: 24,
                                fweight: FontWeight.w500,
                                press: () {
                                  // errorLens();
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const HomeScreen()));
                                },
                              ),
                            ),
                            const SizedBox(
                              height: 7,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
