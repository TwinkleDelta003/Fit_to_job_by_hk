import 'package:fit_to_job/Screens/CommonScreen/home_screen.dart';
import 'package:fit_to_job/Screens/Constant/Colorpath.dart';
import 'package:fit_to_job/Screens/Constant/imagePath.dart';
import 'package:flutter/material.dart';
import '../Constant/responsive.dart';
import '../Widgets/hepler.dart';

class Jobprofile extends StatefulWidget {
  const Jobprofile({Key key}) : super(key: key);

  @override
  State<Jobprofile> createState() => _JobprofileState();
}

class _JobprofileState extends State<Jobprofile> {
  List<String> images = [
    "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg",
    "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        leading: Image.asset("assets/images/research.png", height: 20),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: const [
            Text(
              "Select Job Profile",
              style: TextStyle(
                  color: textColor, fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Text(
              "Which post you want to apply? ",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 16),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 30,
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
              child: customAssetPath(imagePath: selectjob, size: 130),
            ),
            Container(
              height: SizeConfig.screenHeight,
              color: const Color(0xff018F89),
              child: Column(
                children: [
                  Row(children: const [
                    SizedBox(
                      width: 20,
                    ),
                    CircleAvatar(
                      radius: 5,
                      backgroundColor: Color(0xffF5C400),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "Marketing Staff",
                      style: TextStyle(
                          fontSize: 24,
                          color: Color(0xffF5C400),
                          fontWeight: FontWeight.w500),
                    ),
                  ]),
                  Row(
                    children: [
                      Column(
                        children: [
                          Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width / 2.2,
                                height: MediaQuery.of(context).size.height / 6,
                                child: InkWell(
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    color: Colors.white,
                                    child: Row(
                                      children: [
                                        Column(
                                          children: [
                                            const SizedBox(height: 12),
                                            const Padding(
                                              padding: EdgeInsets.only(
                                                  top: 3.0, right: 90),
                                              child: CircleAvatar(
                                                  backgroundColor:
                                                      Color(0xffD9D9D9),
                                                  radius: 7),
                                            ),
                                            Row(
                                              children: [
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                const SizedBox(
                                                  width: 25,
                                                ),
                                                customAssetPath(
                                                    imagePath: stateGM)
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            const Padding(
                                              padding:
                                                  EdgeInsets.only(left: 20.0),
                                              child: Text("State GM Excutive"),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
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
                                width: MediaQuery.of(context).size.width / 2.2,
                                height: MediaQuery.of(context).size.height / 6,
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  color: Colors.white,
                                  child: Row(
                                    children: [
                                      Column(
                                        children: [
                                          const SizedBox(height: 12),
                                          const Padding(
                                            padding: EdgeInsets.only(
                                                top: 3.0, right: 90),
                                            child: CircleAvatar(
                                                backgroundColor:
                                                    Color(0xffD9D9D9),
                                                radius: 7),
                                          ),
                                          Row(
                                            children: [
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              const SizedBox(
                                                width: 25,
                                              ),
                                              customAssetPath(
                                                  imagePath: stateGM)
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          const Padding(
                                            padding:
                                                EdgeInsets.only(left: 20.0),
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
                    ],
                  ),
                  Row(children: const [
                    SizedBox(
                      width: 20,
                    ),
                    CircleAvatar(
                      radius: 5,
                      backgroundColor: Color(0xffF5C400),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "Utility Staff",
                      style: TextStyle(
                          fontSize: 24,
                          color: Color(0xffF5C400),
                          fontWeight: FontWeight.w500),
                    ),
                  ]),
                  Row(
                    children: [
                      Column(
                        children: [
                          Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width / 2.2,
                                height: MediaQuery.of(context).size.height / 6,
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  color: Colors.white,
                                  child: Row(
                                    children: [
                                      Column(
                                        children: [
                                          const SizedBox(height: 12),
                                          const Padding(
                                            padding: EdgeInsets.only(
                                                top: 3.0, right: 90),
                                            child: CircleAvatar(
                                                backgroundColor:
                                                    Color(0xffD9D9D9),
                                                radius: 7),
                                          ),
                                          Row(
                                            children: [
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              const SizedBox(
                                                width: 25,
                                              ),
                                              customAssetPath(
                                                  imagePath: stateGM)
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          const Padding(
                                            padding:
                                                EdgeInsets.only(left: 20.0),
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
                                width: MediaQuery.of(context).size.width / 2.2,
                                height: MediaQuery.of(context).size.height / 6,
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  color: Colors.white,
                                  child: Row(
                                    children: [
                                      Column(
                                        children: [
                                          const SizedBox(height: 12),
                                          const Padding(
                                            padding: EdgeInsets.only(
                                                top: 3.0, right: 90),
                                            child: CircleAvatar(
                                                backgroundColor:
                                                    Color(0xffD9D9D9),
                                                radius: 7),
                                          ),
                                          Row(
                                            children: [
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              const SizedBox(
                                                width: 25,
                                              ),
                                              customAssetPath(
                                                  imagePath: stateGM)
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          const Padding(
                                            padding:
                                                EdgeInsets.only(left: 20.0),
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
                    ],
                  ),
                  Row(children: const [
                    SizedBox(
                      width: 20,
                    ),
                    CircleAvatar(
                      radius: 5,
                      backgroundColor: Color(0xffF5C400),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "Utility Staff",
                      style: TextStyle(
                          fontSize: 24,
                          color: Color(0xffF5C400),
                          fontWeight: FontWeight.w500),
                    ),
                  ]),
                  Row(
                    children: [
                      Column(
                        children: [
                          Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width / 2.2,
                                height: MediaQuery.of(context).size.height / 6,
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  color: Colors.white,
                                  child: Row(
                                    children: [
                                      Column(
                                        children: [
                                          const SizedBox(height: 12),
                                          const Padding(
                                            padding: EdgeInsets.only(
                                                top: 3.0, right: 90),
                                            child: CircleAvatar(
                                                backgroundColor:
                                                    Color(0xffD9D9D9),
                                                radius: 7),
                                          ),
                                          Row(
                                            children: [
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              const SizedBox(
                                                width: 25,
                                              ),
                                              customAssetPath(
                                                  imagePath: stateGM)
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          const Padding(
                                            padding:
                                                EdgeInsets.only(left: 20.0),
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
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Helper().customMaterialButton1(
                    bName: "Continue",
                    context: context,
                    fSize: 26,
                    fweight: FontWeight.bold,
                    press: () {
                      // errorLens();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomeScreen()));
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  )
                  // GridView.builder(
                  //     padding: const EdgeInsets.all(10),
                  //     physics: const BouncingScrollPhysics(),
                  //     gridDelegate:
                  //         const SliverGridDelegateWithFixedCrossAxisCount(
                  //       childAspectRatio: 20 / 11,
                  //       crossAxisCount: 2,
                  //       crossAxisSpacing: 10,
                  //       mainAxisSpacing: 10,
                  //     ),
                  //     scrollDirection: Axis.vertical,
                  //     shrinkWrap: true,
                  //     itemCount: 2,
                  //     itemBuilder: (context, index) {
                  //       return Container(
                  //         color: Colors.white,
                  //         child: Column(
                  //           children:  [
                  //             const Text("data"),
                  //             customAssetPath(imagePath: selecticon,size: 50)
                  //           ],
                  //         ),
                  //       );
                  //       // return Image.network(images[index]);
                  //     })
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
