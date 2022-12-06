// import 'package:fit_to_job/API/Model/assessment_model.dart';
// import 'package:fit_to_job/API/Model/home_model.dart';
// import 'package:fit_to_job/Screens/CommonScreen/question_screen.dart';
// import 'package:fit_to_job/Screens/CommonScreen/result_screen.dart';
// import 'package:fit_to_job/Screens/CommonScreen/uploaddoc_screen.dart';
// import 'package:fit_to_job/Screens/Constant/Colorpath.dart';
// import 'package:fit_to_job/Screens/Constant/imagePath.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import '../../API/Controller/home_controller.dart';
// import '../Constant/responsive.dart';
// import '../Widgets/hepler.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({Key key}) : super(key: key);

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   String testId = "";
//   String examScheduleId = "";
//   String subId = "";
//   String subName = "";
//   String totalExamTime = "";

//   String registrationId;
//   String firstName;
//   String designation;
//   String lastName;
//   getUserId() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     setState(() {
//       registrationId = prefs.getString('registrationId');
//       firstName = prefs.getString('firstName');
//       designation = prefs.getString('designation');
//       lastName = prefs.getString('lastName');
//     });
//   }

//   removeValues() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     prefs.remove('mobileNo');
//     prefs.remove('pass');
//     prefs.remove('designation');
//   }

//   @override
//   void initState() {
//     getUserId();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         centerTitle: true,
//         actions: [
//           Padding(
//             padding: const EdgeInsets.only(right: 8.0),
//             child: InkWell(
//                 onTap: () {
//                   showDialog(
//                     context: context,
//                     builder: (_) => CupertinoAlertDialog(
//                       content: Text('Are you sure want to logout?'.tr),
//                       actions: [
//                         CupertinoDialogAction(
//                             child: Text('Yes'.tr),
//                             onPressed: () {
//                               removeValues().then((value) {
//                                 Get.offAllNamed('/login');
//                               });
//                             }),
//                         CupertinoDialogAction(
//                             child: Text('No'.tr),
//                             onPressed: () =>    Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => const UploadScreen()))
//                             ),

//                       ],
//                     ),
//                   );
//                 },
//                 child: const Icon(
//                   Icons.logout,
//                   color: textColor,
//                   size: 30,
//                 )),
//           )

//         ],
//         leading: Padding(
//             padding: const EdgeInsets.all(10.0),
//             child: customAssetPath(imagePath: logoImage)),
//         title: const Padding(
//           padding: EdgeInsets.only(right: 120.0),
//           child: Text(
//             "Online iExam",
//             style: TextStyle(
//                 color: Color(0xff1AA19A),
//                 fontSize: 24,
//                 fontWeight: FontWeight.bold),
//           ),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(10.0),
//               child: SizedBox(
//                 height: SizeConfig.screenHeight,
//                 width: MediaQuery.of(context).size.width,
//                 child: Card(
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10.0),
//                   ),
//                   elevation: 10,
//                   child: Column(
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.only(left: 20.0, top: 10),
//                         child: Row(
//                           children: [
//                             customAssetPath(imagePath: username, size: 30),
//                             const SizedBox(
//                               width: 10,
//                             ),
//                             Text(
//                               "$firstName $lastName",
//                               style: const TextStyle(
//                                   color: textColor, fontSize: 18),
//                             ),
//                             const SizedBox(height: 50),
//                           ],
//                         ),
//                       ),
//                       // Padding(
//                       //   padding: const EdgeInsets.only(left: 20.0, top: 10),
//                       //   child: Row(
//                       //     children: [
//                       //       customAssetPath(imagePath: jobprofile, size: 30),
//                       //       const SizedBox(
//                       //         width: 10,
//                       //       ),
//                       //       Text(
//                       //         designation.toString(),
//                       //         style: const TextStyle(
//                       //             color: textColor, fontSize: 18),
//                       //       )
//                       //     ],
//                       //   ),
//                       // )
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//             Container(
//               height: 150,
//               decoration: const BoxDecoration(
//                   gradient: LinearGradient(colors: [
//                 Color(0xffffffff),
//                 Color(0xff89CBC8),
//                 Color(0xff018F89),
//               ], stops: [
//                 0.1,
//                 0.8,
//                 2.0
//               ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
//               alignment: Alignment.center,
//               child: customAssetPath(imagePath: onlinetest, size: 130),
//             ),
//             Container(
//               color: const Color(0xff018F89),
//               height: SizeConfig.screenHeight,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const Padding(
//                     padding: EdgeInsets.only(left: 18.0),
//                     child: Text(
//                       "Level Wise Test Series",
//                       style: TextStyle(
//                           color: Colors.white,
//                           fontWeight: FontWeight.w600,
//                           fontSize: 18),
//                     ),
//                   ),
//                   _homeViewUI()
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _homeViewUI() {
//     return SizedBox(
//         height: MediaQuery.of(context).size.height / 2,
//         width: MediaQuery.of(context).size.width,
//         child: FutureBuilder(
//             future: testViewListAPI(
//                 date: DateTime.now().toString(),
//                 RegistrationId: registrationId.toString()),
//             builder: (context, snapshot) {
//               if (snapshot.data == null) {
//                 return Center(
//                     child: Center(
//                         child: snapshot.connectionState != ConnectionState.done
//                             ? const CircularProgressIndicator()
//                             : Helper().customText(
//                                 text: "No Data Found", fontSize: 20)));
//               } else {
//                 return SizedBox(
//                   height: MediaQuery.of(context).size.height / 2,
//                   width: MediaQuery.of(context).size.width,
//                   child: ListView.builder(
//                       itemCount: snapshot.data.result.length,
//                       itemBuilder: (context, index) {
//                         var list = snapshot.data.result[index];
//                         return _homeUISetup(model: HomeModel(result: [list]));
//                       }),
//                 );
//               }
//             }));
//   }

//   _modalBottomSheetAssessment() {
//     WidgetsBinding.instance.addPostFrameCallback((_) async {
//       await showModalBottomSheet(
//           isDismissible: false,
//           enableDrag: false,
//           isScrollControlled: false,
//           shape: const RoundedRectangleBorder(
//               borderRadius: BorderRadius.only(
//                   topRight: Radius.circular(10), topLeft: Radius.circular(10))),
//           context: context,
//           builder: (builder) {
//             return Container(
//                 height: MediaQuery.of(context).size.height / 2,
//                 width: MediaQuery.of(context).size.width,
//                 child: Container(
//                   child: FutureBuilder(
//                       future: assessmentListAPI(
//                           ExamScheduleId: examScheduleId,
//                           TestId: testId,
//                           RegistrationId:
//                               "4B422338-2218-4AF8-911E-75228CF761B3"),
//                       builder: (context, snapshot) {
//                         if (snapshot.data == null) {
//                           return Center(
//                               child: Center(
//                                   child: snapshot.connectionState !=
//                                           ConnectionState.done
//                                       ? const CircularProgressIndicator()
//                                       : Helper().customText(
//                                           text: "No Data Found",
//                                           fontSize: 20)));
//                         } else {
//                           return Container(
//                             height: MediaQuery.of(context).size.height / 2,
//                             width: MediaQuery.of(context).size.width,
//                             child: ListView.builder(
//                                 itemCount: snapshot.data.result.length,
//                                 itemBuilder: (context, index) {
//                                   var list = snapshot.data.result[index];
//                                   return Container(
//                                     child: _assessmentUI(
//                                         model: AssessmentModel(result: [list])),
//                                   );
//                                 }),
//                           );
//                         }
//                       }),
//                 ));
//           });
//     });
//   }

//   Widget _homeUISetup({HomeModel model}) {
//     testId = model.result[0].testId;
//     examScheduleId = model.result[0].examscheduleId;
//     subId = model.result[0].subId;
//     subName = model.result[0].subName;

//     return Container(
//       padding: const EdgeInsets.symmetric(vertical: 2),
//       child: Column(
//         children: <Widget>[
//           InkWell(
//             onTap: () async {
//               _modalBottomSheetAssessment();
//               //_assessmentViewUI();
//             },
//             child: Card(
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(5.0),
//               ),
//               color: Colors.white,
//               //color: Color(0xffE1E0FF),
//               elevation: 2,
//               child: ListTile(
//                 title: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const SizedBox(
//                       height: 5,
//                     ),
//                     Row(
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: CircleAvatar(
//                             backgroundColor: Colors.white,
//                             //backgroundImage: AssetImage("assets/images/ic_assessment.png"),
//                             child: Center(
//                                 child: customAssetPath(imagePath: selectjob)),
//                           ),
//                         ),
//                         Column(
//                           children: [
//                             Text(model.result[0].subName,
//                                 style: const TextStyle(
//                                     fontSize: 18,
//                                     color: Color(0xff9B1A48),
//                                     fontWeight: FontWeight.bold)),
//                             const SizedBox(
//                               height: 5,
//                             ),
//                             Text(model.result[0].testName,
//                                 style: const TextStyle(
//                                     fontSize: 18,
//                                     color: Color(0xff9B1A48),
//                                     fontWeight: FontWeight.normal)),
//                             const SizedBox(
//                               height: 5,
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                     Row(
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.only(top: 5.0, left: 20),
//                           child:
//                               customAssetPath(imagePath: starttime, size: 30),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.only(left: 10.0),
//                           child: Text(
//                             "${model.result[0].examFromTime} to ${model.result[0].examToTime}",
//                             style: const TextStyle(
//                                 fontSize: 18,
//                                 color: Color(0xff9B1A48),
//                                 fontWeight: FontWeight.bold),
//                           ),
//                         )
//                       ],
//                     ),
//                     const SizedBox(
//                       height: 5,
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }

//   _modalBottomSheetPolicy() {
//     return showModalBottomSheet(
//         isDismissible: false,
//         enableDrag: false,
//         isScrollControlled: false,
//         shape: const RoundedRectangleBorder(
//             borderRadius: BorderRadius.only(
//                 topRight: Radius.circular(10), topLeft: Radius.circular(10))),
//         context: context,
//         builder: (builder) {
//           return SingleChildScrollView(
//             child: Column(
//               children: [
//                 Container(
//                   margin: const EdgeInsets.only(top: 10),
//                   alignment: Alignment.center,
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(10),
//                       color: const Color(0xff1AA19A)),
//                   width: 100,
//                   height: 10,
//                 ),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 const Text("Rules",
//                     style: TextStyle(
//                         fontSize: 25,
//                         color: Color(0xff1AA19A),
//                         fontWeight: FontWeight.bold)),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 const Divider(
//                   color: Colors.black,
//                 ),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 _firstPolicy(),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 _secondPolicy(),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 _thirdPolicy(),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 _fourthPolicy(),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 _fifthPolicy(),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 _policyButton(),
//                 const SizedBox(
//                   height: 10,
//                 ),
//               ],
//             ),
//           );
//         });
//   }

//   Widget _firstPolicy() {
//     return Row(
//       children: [
//         const SizedBox(
//           width: 10,
//         ),
//         Container(
//           alignment: Alignment.center,
//           decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(10), color: Colors.grey),
//           width: 10,
//           height: 10,
//         ),
//         const SizedBox(
//           width: 10,
//         ),
//         const Text("Candidate can participate from anywhere in \nexamination",
//             softWrap: false,
//             overflow: TextOverflow.visible,
//             maxLines: 2,
//             style: TextStyle(
//                 fontSize: 18,
//                 color: Colors.grey,
//                 fontWeight: FontWeight.normal)),
//         const SizedBox(
//           width: 10,
//         ),
//       ],
//     );
//   }

//   Widget _secondPolicy() {
//     return Row(
//       children: [
//         const SizedBox(
//           width: 10,
//         ),
//         Container(
//           alignment: Alignment.center,
//           decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(10), color: Colors.grey),
//           width: 10,
//           height: 10,
//         ),
//         const SizedBox(
//           width: 10,
//         ),
//         const Text(
//             "By using any capable device \nwhich have internet connectivity \nlike computer, laptop, mobile, \ntablet etc.",
//             softWrap: false,
//             overflow: TextOverflow.visible,
//             maxLines: 3,
//             style: TextStyle(
//                 fontSize: 18,
//                 color: Colors.grey,
//                 fontWeight: FontWeight.normal)),
//         const SizedBox(
//           width: 10,
//         ),
//       ],
//     );
//   }

//   Widget _thirdPolicy() {
//     return Row(
//       children: [
//         const SizedBox(
//           width: 10,
//         ),
//         Container(
//           alignment: Alignment.center,
//           decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(10), color: Colors.grey),
//           width: 10,
//           height: 10,
//         ),
//         const SizedBox(
//           width: 10,
//         ),
//         const Text("પરીક્ષા સમયમર્યાદામાં પૂર્ણ થવી આવશ્યક છે.",
//             softWrap: false,
//             overflow: TextOverflow.visible,
//             maxLines: 2,
//             style: TextStyle(
//                 fontSize: 18,
//                 color: Colors.grey,
//                 fontWeight: FontWeight.normal)),
//         const SizedBox(
//           width: 10,
//         ),
//       ],
//     );
//   }

//   Widget _fourthPolicy() {
//     return Row(
//       children: [
//         const SizedBox(
//           width: 10,
//         ),
//         Container(
//           alignment: Alignment.center,
//           decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(10), color: Colors.grey),
//           width: 10,
//           height: 10,
//         ),
//         const SizedBox(
//           width: 10,
//         ),
//         const Text(
//             "એકવાર તમે આ પરીક્ષા શરૂ કરો ત્યારે સમય પ્રારંભ \nકરવામાં આવશે.",
//             softWrap: false,
//             overflow: TextOverflow.visible,
//             maxLines: 2,
//             style: TextStyle(
//                 fontSize: 18,
//                 color: Colors.grey,
//                 fontWeight: FontWeight.normal)),
//         const SizedBox(
//           width: 10,
//         ),
//       ],
//     );
//   }

//   Widget _fifthPolicy() {
//     return Row(
//       children: [
//         const SizedBox(
//           width: 10,
//         ),
//         Container(
//           alignment: Alignment.center,
//           decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(10), color: Colors.grey),
//           width: 10,
//           height: 10,
//         ),
//         const SizedBox(
//           width: 10,
//         ),
//         const Text(
//             "એક પ્રશ્નનો જવાબ પરીક્ષા દરમિયાન ફક્ત \nએક જ વાર પસંદ કરી શકાય છે.",
//             softWrap: false,
//             overflow: TextOverflow.visible,
//             maxLines: 2,
//             style: TextStyle(
//                 fontSize: 18,
//                 color: Colors.grey,
//                 fontWeight: FontWeight.normal)),
//         const SizedBox(
//           width: 10,
//         ),
//       ],
//     );
//   }

//   Widget _policyButton() {
//     return Row(
//       children: [
//         const SizedBox(
//           width: 10,
//         ),
//         Expanded(
//           flex: 1,
//           child: Helper().customMaterialButton(
//             bName: "Dismiss",
//             context: context,
//             fSize: 20,
//             fweight: FontWeight.bold,
//             press: () {
//               Navigator.pop(context);
//             },
//           ),
//         ),
//         const SizedBox(
//           width: 10,
//         ),
//         Expanded(
//           flex: 1,
//           child: Helper().customMaterialButton(
//             bName: "Agree & Start",
//             context: context,
//             fSize: 20,
//             fweight: FontWeight.bold,
//             press: () {
//               Navigator.pop(context);
//               Get.to(() => const QuestionScreen(), arguments: [
//                 testId,
//                 examScheduleId,
//                 subId,
//                 subName,
//                 totalExamTime
//               ]);
//               //Navigator.pop(context);
//               /*Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                       builder: (context) => const QuestionScreen()));*/
//             },
//           ),
//         ),
//         const SizedBox(
//           width: 10,
//         ),
//       ],
//     );
//   }

//   _assessmentUI({AssessmentModel model}) {
//     totalExamTime = model.result[0].duration;

//     return SingleChildScrollView(
//       child: Column(
//         children: [
//           Container(
//             margin: const EdgeInsets.only(top: 10),
//             alignment: Alignment.center,
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(10),
//                 color: const Color(0xff1AA19A)),
//             width: 100,
//             height: 10,
//           ),
//           const SizedBox(
//             height: 10,
//           ),
//           const Text("Assessment",
//               style: TextStyle(
//                   fontSize: 25,
//                   color: Color(0xff1AA19A),
//                   fontWeight: FontWeight.bold)),
//           const SizedBox(
//             height: 10,
//           ),
//           const Divider(
//             color: Colors.black,
//           ),
//           const SizedBox(
//             height: 10,
//           ),
//           Container(
//             margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
//             alignment: Alignment.center,
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(10),
//                 color: const Color(0xff1AA19A)),
//             height: 75,
//             child: Row(
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: CircleAvatar(
//                     backgroundColor: Colors.white,
//                     //backgroundImage: AssetImage("assets/images/ic_assessment.png"),
//                     child: Center(child: customAssetPath(imagePath: selectjob)),
//                   ),
//                 ),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text(model.result[0].schoolName,
//                         style: const TextStyle(
//                             fontSize: 18,
//                             color: Colors.white,
//                             fontWeight: FontWeight.bold)),
//                     const SizedBox(
//                       height: 5,
//                     ),
//                     Text(firstName.toString(),
//                         style: const TextStyle(
//                             fontSize: 15,
//                             color: Colors.white,
//                             fontWeight: FontWeight.normal)),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//           Container(
//             margin: const EdgeInsets.only(left: 12, right: 12),
//             //alignment: Alignment.center,
//             child: Row(
//               children: [
//                 const Expanded(
//                   flex: 1,
//                   child: Text("Duration   :",
//                       style: TextStyle(
//                           fontSize: 18,
//                           color: Color(0xff1AA19A),
//                           fontWeight: FontWeight.normal)),
//                 ),
//                 Expanded(
//                   flex: 1,
//                   child: Text("${model.result[0].duration}Min",
//                       style: const TextStyle(
//                           fontSize: 15,
//                           color: Colors.black,
//                           fontWeight: FontWeight.normal)),
//                 )
//               ],
//             ),
//           ),
//           const Divider(
//             color: Colors.grey,
//           ),
//           model.result[0].isResultAvailable == "false"
//               ? Helper().customMaterialButton5(
//                   bName: "View Result",
//                   context: context,
//                   fSize: 26,
//                   fweight: FontWeight.bold,
//                   press: () {
//                     Get.to(() => const ResultScreen(), arguments: [
//                       testId,
//                       examScheduleId,
//                       subId,
//                       subName,
//                       totalExamTime
//                     ]);
//                   },
//                 )
//               : Container(),

//           const Text("Your assessment already started !!",
//               textAlign: TextAlign.left,
//               style: TextStyle(
//                   fontSize: 15,
//                   color: Colors.red,
//                   fontWeight: FontWeight.normal)),
//           const Divider(
//             color: Colors.grey,
//           ),
//           const Text("Questions",
//               textAlign: TextAlign.left,
//               style: TextStyle(
//                   fontSize: 18,
//                   color: Color(0xff1AA19A),
//                   fontWeight: FontWeight.normal)),
//           const SizedBox(
//             height: 10,
//           ),
//           Row(
//             children: [
//               Expanded(
//                 flex: 1,
//                 child: Column(
//                   children: [
//                     SizedBox(
//                       height: 60,
//                       child: CircleAvatar(
//                         backgroundColor: Colors.green,
//                         child: Center(
//                           child: Text(
//                             model.result[0].answeredQn,
//                             style: const TextStyle(
//                                 fontSize: 18,
//                                 color: Colors.white,
//                                 fontWeight: FontWeight.normal),
//                           ),
//                         ),
//                       ),
//                     ),
//                     const Text("Answered",
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                             fontSize: 18,
//                             color: Color(0xff1AA19A),
//                             fontWeight: FontWeight.normal)),
//                   ],
//                 ),
//               ),
//               const Center(
//                 child: Text("+",
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                         fontSize: 20,
//                         color: Colors.black,
//                         fontWeight: FontWeight.bold)),
//               ),
//               Expanded(
//                   flex: 1,
//                   child: Column(
//                     children: [
//                       SizedBox(
//                         height: 60,
//                         child: CircleAvatar(
//                           backgroundColor: Colors.yellow,
//                           child: Center(
//                             child: Text(
//                               model.result[0].skippedQn,
//                               style: const TextStyle(
//                                   fontSize: 18,
//                                   color: Colors.black,
//                                   fontWeight: FontWeight.normal),
//                             ),
//                           ),
//                         ),
//                       ),
//                       const Text("Skipped",
//                           textAlign: TextAlign.center,
//                           style: TextStyle(
//                               fontSize: 18,
//                               color: Color(0xff1AA19A),
//                               fontWeight: FontWeight.normal)),
//                     ],
//                   )),
//               const Center(
//                 child: Text("+",
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                         fontSize: 20,
//                         color: Colors.black,
//                         fontWeight: FontWeight.bold)),
//               ),
//               Expanded(
//                   flex: 1,
//                   child: Column(
//                     children: [
//                       SizedBox(
//                         height: 60,
//                         child: CircleAvatar(
//                           backgroundColor: Colors.red,
//                           child: Center(
//                             child: Text(
//                               model.result[0].pendingQn,
//                               style: const TextStyle(
//                                   fontSize: 18,
//                                   color: Colors.white,
//                                   fontWeight: FontWeight.normal),
//                             ),
//                           ),
//                         ),
//                       ),
//                       const Text("Pending",
//                           textAlign: TextAlign.center,
//                           style: TextStyle(
//                               fontSize: 18,
//                               color: Color(0xff1AA19A),
//                               fontWeight: FontWeight.normal)),
//                     ],
//                   )),
//               const Center(
//                 child: Text("=",
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                         fontSize: 20,
//                         color: Colors.black,
//                         fontWeight: FontWeight.bold)),
//               ),
//               Expanded(
//                   flex: 1,
//                   child: Column(
//                     children: [
//                       SizedBox(
//                         height: 60,
//                         child: CircleAvatar(
//                           backgroundColor: const Color(0xff1AA19A),
//                           child: Center(
//                             child: Text(
//                               model.result[0].totalQn,
//                               style: const TextStyle(
//                                   fontSize: 18,
//                                   color: Colors.white,
//                                   fontWeight: FontWeight.normal),
//                             ),
//                           ),
//                         ),
//                       ),
//                       const Text("Total",
//                           textAlign: TextAlign.center,
//                           style: TextStyle(
//                               fontSize: 18,
//                               color: Color(0xff1AA19A),
//                               fontWeight: FontWeight.normal)),
//                     ],
//                   )),
//             ],
//           ),
//           //_questionsTotal(),
//           const SizedBox(
//             height: 10,
//           ),
//           _assessmentButton(),
//           const SizedBox(
//             height: 10,
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _assessmentButton() {
//     return Row(
//       children: [
//         const SizedBox(
//           width: 10,
//         ),
//         Expanded(
//           flex: 1,
//           child: Helper().customMaterialButton(
//             bName: "Dismiss",
//             context: context,
//             fSize: 20,
//             fweight: FontWeight.bold,
//             press: () {
//               //errorLens1();
//               Navigator.pop(context);
//             },
//           ),
//         ),
//         const SizedBox(
//           width: 10,
//         ),
//         Expanded(
//           flex: 1,
//           child: Helper().customMaterialButton(
//             bName: "Next",
//             context: context,
//             fSize: 20,
//             fweight: FontWeight.bold,
//             press: () {
//               Navigator.pop(context);
//               _modalBottomSheetPolicy();
//             },
//           ),
//         ),
//         const SizedBox(
//           width: 10,
//         ),
//       ],
//     );
//   }
// }

import 'package:fit_to_job/API/Controller/question_controller.dart';
import 'package:fit_to_job/API/Model/assessment_model.dart';
import 'package:fit_to_job/API/Model/home_model.dart';
import 'package:fit_to_job/Screens/CommonScreen/question_screen.dart';
import 'package:fit_to_job/Screens/CommonScreen/result_screen.dart';
import 'package:fit_to_job/Screens/Constant/Colorpath.dart';
import 'package:fit_to_job/Screens/Constant/imagePath.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../API/Controller/home_controller.dart';
import '../Constant/responsive.dart';
import '../Widgets/hepler.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  removeValues() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('mobileNo');
    prefs.remove('pass');
  }

  String registrationId;
  String firstName;
  String designation;
  getUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      registrationId = prefs.getString('registrationId');
      firstName = prefs.getString('firstName');
      designation = prefs.getString('designation');
    });
  }

  String testId = "";
  String examScheduleId = "";
  String subId = "";
  String subName = "";
  String totalExamTime = "";

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
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: InkWell(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (_) => CupertinoAlertDialog(
                      content: Text('Are you sure want to logout?'.tr),
                      actions: [
                        CupertinoDialogAction(
                            child: Text('Yes'.tr),
                            onPressed: () {
                              removeValues().then((value) async {
                                Get.offAllNamed('/login');
                                  SharedPreferences prefs =
                                    await SharedPreferences.getInstance();
                                prefs.remove('designation');
                               
                              });
                            
                            }),
                        CupertinoDialogAction(
                            child: Text('No'.tr), onPressed: () => Get.back()),
                      ],
                    ),
                  );
                },
                child: const Icon(
                  Icons.logout,
                  color: textColor,
                  size: 30,
                )),
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
        child: RefreshIndicator(
          triggerMode: RefreshIndicatorTriggerMode.onEdge,
          onRefresh: () async {
            await Future.delayed(const Duration(seconds: 2));
            setState(() {
              testViewListAPI(
                  RegistrationId: registrationId.toString(),
                  date: DateTime.now().toString());
            });
          },
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
                              Text(
                                firstName.toString(),
                                style: const TextStyle(
                                    color: textColor,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700),
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
                              Text(
                              designation.toString(),
                                style: const TextStyle(
                                    color: textColor,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700),
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
                    Row(
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
                        SizedBox(
                            width: MediaQuery.of(context).size.width / 2.5),
                        InkWell(
                          onTap: () async {
                            await Future.delayed(const Duration(seconds: 2));
                            setState(() {
                              testViewListAPI(
                                  RegistrationId: registrationId.toString(),
                                  date: DateTime.now().toString());
                            });
                          },
                          // () {
                          //   testViewListAPI(
                          //       RegistrationId: registrationId.toString(),
                          //       date: DateTime.now().toString());
                          // },
                          child: const Icon(Icons.refresh, color: Colors.white),
                        )
                      ],
                    ),
                    _homeViewUI()
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _homeViewUI() {
    return SizedBox(
        height: MediaQuery.of(context).size.height / 2,
        width: MediaQuery.of(context).size.width,
        child: FutureBuilder(
            future: testViewListAPI(
                date: DateTime.now().toString(),
                RegistrationId: registrationId.toString()),
            builder: (context, snapshot) {
              if (snapshot.data == null) {
                return Center(
                    child: snapshot.connectionState != ConnectionState.done
                        ? const CircularProgressIndicator()
                        : Helper()
                            .customText(text: "No Data Found", fontSize: 20));
              } else {
                return SizedBox(
                  height: MediaQuery.of(context).size.height / 2,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                      itemCount: snapshot.data.result.length,
                      itemBuilder: (context, index) {
                        var list = snapshot.data.result[index];
                        return _homeUISetup(model: HomeModel(result: [list]));
                      }),
                );
              }
            }));
  }

  _modalBottomSheetAssessment(HomeModel model) {
    testId = model.result[0].testId;
    examScheduleId = model.result[0].examscheduleId;
    subId = model.result[0].subId;
    subName = model.result[0].subName;
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await showModalBottomSheet(
          isDismissible: false,
          enableDrag: false,
          isScrollControlled: false,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10), topLeft: Radius.circular(10))),
          context: context,
          builder: (builder) {
            return SizedBox(
                height: MediaQuery.of(context).size.height / 2,
                width: MediaQuery.of(context).size.width,
                child: FutureBuilder<AssessmentModel>(
                    future: assessmentListAPI(
                        ExamScheduleId: examScheduleId,
                        TestId: testId,
                        RegistrationId: registrationId.toString()),
                    builder: (context, snapshot) {
                      if (snapshot.data == null) {
                        return Center(
                            child: Center(
                                child: snapshot.connectionState !=
                                        ConnectionState.done
                                    ? const CircularProgressIndicator()
                                    : Helper().customText(
                                        text: "No Dat Found", fontSize: 20)));
                      } else {
                        return SizedBox(
                          height: MediaQuery.of(context).size.height / 2,
                          width: MediaQuery.of(context).size.width,
                          child: ListView.builder(
                              itemCount: snapshot.data.result.length,
                              itemBuilder: (context, index) {
                                var list = snapshot.data.result[index];
                                return Column(
                                  children: [
                                    Container(
                                      child: _assessmentUI(
                                          model:
                                              AssessmentModel(result: [list])),
                                    ),
                                  ],
                                );
                              }),
                        );
                      }
                    }));
          });
    });
  }

  Widget _homeUISetup({HomeModel model}) {
    // testId = model.result[0].testId;
    // examScheduleId = model.result[0].examscheduleId;
    // subId = model.result[0].subId;
    // subName = model.result[0].subName;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Column(
        children: <Widget>[
          InkWell(
            onTap: () async {
              _modalBottomSheetAssessment(model);
              //_assessmentViewUI();
            },
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
              color: Colors.white,
              elevation: 2,
              child: ListTile(
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            child: Center(
                              child:
                                  Image.asset("assets/images/select_job.png"),
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            Text(model.result[0].subName,
                                style: const TextStyle(
                                    fontSize: 18,
                                    color: Color(0xff9B1A48),
                                    fontWeight: FontWeight.bold)),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(model.result[0].testName,
                                style: const TextStyle(
                                    fontSize: 18,
                                    color: Color(0xff9B1A48),
                                    fontWeight: FontWeight.normal)),
                            const SizedBox(
                              height: 5,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 5.0, left: 20),
                          child:
                              customAssetPath(imagePath: starttime, size: 30),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Text(
                            "${model.result[0].examFromTime} to ${model.result[0].examToTime}",
                            style: const TextStyle(
                                fontSize: 18,
                                color: Color(0xff9B1A48),
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  _modalBottomSheetPolicy() {
    return showModalBottomSheet(
        isDismissible: false,
        enableDrag: false,
        isScrollControlled: false,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(10), topLeft: Radius.circular(10))),
        context: context,
        builder: (builder) {
          return SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xff1AA19A)),
                  width: 100,
                  height: 10,
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text("Rules",
                    style: TextStyle(
                        fontSize: 25,
                        color: Color(0xff1AA19A),
                        fontWeight: FontWeight.bold)),
                const SizedBox(
                  height: 10,
                ),
                const Divider(
                  color: Colors.black,
                ),
                const SizedBox(
                  height: 10,
                ),
                _firstPolicy(),
                const SizedBox(
                  height: 10,
                ),
                _secondPolicy(),
                const SizedBox(
                  height: 10,
                ),
                _thirdPolicy(),
                const SizedBox(
                  height: 10,
                ),
                _fourthPolicy(),
                const SizedBox(
                  height: 10,
                ),
                _fifthPolicy(),
                const SizedBox(
                  height: 10,
                ),
                _policyButton(),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          );
        });
  }

  Widget _firstPolicy() {
    return Row(
      children: [
        const SizedBox(
          width: 10,
        ),
        Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: Colors.grey),
          width: 10,
          height: 10,
        ),
        const SizedBox(
          width: 10,
        ),
        const Text("Candidate can participate from anywhere in \nexamination",
            softWrap: false,
            overflow: TextOverflow.visible,
            maxLines: 2,
            style: TextStyle(
                fontSize: 18,
                color: Colors.grey,
                fontWeight: FontWeight.normal)),
        const SizedBox(
          width: 10,
        ),
      ],
    );
  }

  Widget _secondPolicy() {
    return Row(
      children: [
        const SizedBox(
          width: 10,
        ),
        Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: Colors.grey),
          width: 10,
          height: 10,
        ),
        const SizedBox(
          width: 10,
        ),
        const Text(
            "By using any capable device \nwhich have internet connectivity \nlike computer, laptop, mobile, \ntablet etc.",
            softWrap: false,
            overflow: TextOverflow.visible,
            maxLines: 3,
            style: TextStyle(
                fontSize: 18,
                color: Colors.grey,
                fontWeight: FontWeight.normal)),
        const SizedBox(
          width: 10,
        ),
      ],
    );
  }

  Widget _thirdPolicy() {
    return Row(
      children: [
        const SizedBox(
          width: 10,
        ),
        Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: Colors.grey),
          width: 10,
          height: 10,
        ),
        const SizedBox(
          width: 10,
        ),
        const Text("પરીક્ષા સમયમર્યાદામાં પૂર્ણ થવી આવશ્યક છે.",
            softWrap: false,
            overflow: TextOverflow.visible,
            maxLines: 2,
            style: TextStyle(
                fontSize: 18,
                color: Colors.grey,
                fontWeight: FontWeight.normal)),
        const SizedBox(
          width: 10,
        ),
      ],
    );
  }

  Widget _fourthPolicy() {
    return Row(
      children: [
        const SizedBox(
          width: 10,
        ),
        Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: Colors.grey),
          width: 10,
          height: 10,
        ),
        const SizedBox(
          width: 10,
        ),
        const Text(
            "એકવાર તમે આ પરીક્ષા શરૂ કરો ત્યારે સમય પ્રારંભ \nકરવામાં આવશે.",
            softWrap: false,
            overflow: TextOverflow.visible,
            maxLines: 2,
            style: TextStyle(
                fontSize: 18,
                color: Colors.grey,
                fontWeight: FontWeight.normal)),
        const SizedBox(
          width: 10,
        ),
      ],
    );
  }

  Widget _fifthPolicy() {
    return Row(
      children: [
        const SizedBox(
          width: 10,
        ),
        Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: Colors.grey),
          width: 10,
          height: 10,
        ),
        const SizedBox(
          width: 10,
        ),
        const Text(
            "એક પ્રશ્નનો જવાબ પરીક્ષા દરમિયાન ફક્ત \nએક જ વાર પસંદ કરી શકાય છે.",
            softWrap: false,
            overflow: TextOverflow.visible,
            maxLines: 2,
            style: TextStyle(
                fontSize: 18,
                color: Colors.grey,
                fontWeight: FontWeight.normal)),
        const SizedBox(
          width: 10,
        ),
      ],
    );
  }

  Widget _policyButton() {
    return Row(
      children: [
        const SizedBox(
          width: 10,
        ),
        Expanded(
          flex: 1,
          child: Helper().customMaterialButton(
            bName: "Dismiss",
            context: context,
            fSize: 20,
            fweight: FontWeight.bold,
            press: () {
              //errorLens1();
              Navigator.pop(context);
            },
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          flex: 1,
          child: Helper().customMaterialButton(
            bName: "Agree & Start",
            context: context,
            fSize: 20,
            fweight: FontWeight.bold,
            press: () {
              Navigator.pop(context);
              Get.to(() => const QuestionScreen(), arguments: [
                testId,
                examScheduleId,
                subId,
                subName,
                totalExamTime,
                registrationId
              ]);
            },
          ),
        ),
        const SizedBox(
          width: 10,
        ),
      ],
    );
  }

// for Assessment pop up
  _assessmentUI({AssessmentModel model}) {
    totalExamTime = model.result[0].duration;

    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 10),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color(0xff1AA19A)),
            width: 100,
            height: 10,
          ),

          const SizedBox(
            height: 10,
          ),
          const Text("Assessment",
              style: TextStyle(
                  fontSize: 25,
                  color: Color(0xff1AA19A),
                  fontWeight: FontWeight.bold)),
          const SizedBox(
            height: 10,
          ),
          const Divider(
            color: Colors.black,
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color(0xff1AA19A)),
            height: 75,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Center(
                      child: Image.asset(
                        "assets/images/select_job.png",
                        height: 25,
                        alignment: Alignment.center,
                      ),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(model.result[0].schoolName,
                        style: const TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold)),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(firstName.toString(),
                        style: const TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w600)),
                  ],
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 12, right: 12),
            child: Row(
              children: [
                const Expanded(
                  flex: 1,
                  child: Text("Duration   :",
                      style: TextStyle(
                          fontSize: 18,
                          color: Color(0xff1AA19A),
                          fontWeight: FontWeight.normal)),
                ),
                Expanded(
                  flex: 1,
                  child: Text("${model.result[0].duration}Min",
                      style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.w500)),
                )
              ],
            ),
          ),
          const Divider(
            color: Colors.grey,
          ),
          model.result[0].isResultAvailable == "false"
              ? Helper().customMaterialButton5(
                  bName: "View Result",
                  context: context,
                  fSize: 26,
                  fweight: FontWeight.bold,
                  press: () {
                    Get.to(() => const ResultScreen(), arguments: [
                      testId,
                      examScheduleId,
                      subId,
                      subName,
                      totalExamTime
                    ]);
                  },
                )

              // InkWell(
              //     onTap: () {
              //       Get.toNamed('/resultscreen');

              //       Get.to(() => const ResultScreen(), arguments: [
              //         testId,
              //         examScheduleId,
              //         subId,
              //         subName,
              //         totalExamTime
              //       ]);
              //     },
              // child: const Text(
              //   "Check Result",
              //   style: TextStyle(
              //       color: textColor,
              //       fontWeight: FontWeight.w500,
              //       fontSize: 18),
              // ))
              : Container(),
          const Text("Your assessment already started !!",
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontSize: 15,
                  color: Colors.red,
                  fontWeight: FontWeight.normal)),
          const Divider(
            color: Colors.grey,
          ),
          const Text("Questions",
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontSize: 18,
                  color: Color(0xff1AA19A),
                  fontWeight: FontWeight.normal)),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    SizedBox(
                      height: 60,
                      child: CircleAvatar(
                        backgroundColor: Colors.green,
                        child: Center(
                          child: Text(
                            model.result[0].answeredQn,
                            style: const TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.normal),
                          ),
                        ),
                      ),
                    ),
                    const Text("Answered",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 18,
                            color: Color(0xff1AA19A),
                            fontWeight: FontWeight.normal)),
                  ],
                ),
              ),
              const Center(
                child: Text("+",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold)),
              ),
              Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 60,
                        child: CircleAvatar(
                          backgroundColor: Colors.yellow,
                          child: Center(
                            child: Text(
                              model.result[0].skippedQn,
                              style: const TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal),
                            ),
                          ),
                        ),
                      ),
                      const Text("Skipped",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 18,
                              color: Color(0xff1AA19A),
                              fontWeight: FontWeight.normal)),
                    ],
                  )),
              const Center(
                child: Text("+",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold)),
              ),
              Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 60,
                        child: CircleAvatar(
                          backgroundColor: Colors.red,
                          child: Center(
                            child: Text(
                              model.result[0].pendingQn,
                              style: const TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.normal),
                            ),
                          ),
                        ),
                      ),
                      const Text("Pending",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 18,
                              color: Color(0xff1AA19A),
                              fontWeight: FontWeight.normal)),
                    ],
                  )),
              const Center(
                child: Text("=",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold)),
              ),
              Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 60,
                        child: CircleAvatar(
                          backgroundColor: const Color(0xff1AA19A),
                          child: Center(
                            child: Text(
                              model.result[0].totalQn,
                              style: const TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.normal),
                            ),
                          ),
                        ),
                      ),
                      const Text("Total",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 18,
                              color: Color(0xff1AA19A),
                              fontWeight: FontWeight.normal)),
                    ],
                  )),
            ],
          ),
          //_questionsTotal(),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              const SizedBox(
                width: 10,
              ),
              Expanded(
                flex: 1,
                child: Helper().customMaterialButton(
                  bName: "Dismiss",
                  context: context,
                  fSize: 20,
                  fweight: FontWeight.bold,
                  press: () {
                    //errorLens1();
                    Navigator.pop(context);
                  },
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                flex: 1,
                child: Helper().customMaterialButton(
                  bName: "Next",
                  context: context,
                  fSize: 20,
                  fweight: FontWeight.bold,
                  press: () {
                    Navigator.pop(context);
                    _modalBottomSheetPolicy();
                  },
                ),
              ),
              const SizedBox(
                width: 10,
              ),
            ],
          ),
          // _assessmentButton(),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
