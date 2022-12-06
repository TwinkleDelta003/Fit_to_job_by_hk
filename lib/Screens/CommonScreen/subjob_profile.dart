import 'package:fit_to_job/Screens/Connection/Connection.dart';
import 'package:fit_to_job/Screens/Constant/Colorpath.dart';
import 'package:fit_to_job/Screens/Constant/imagePath.dart';
import 'package:fit_to_job/Screens/Constant/responsive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';
import '../../API/Controller/jobprofile_controller.dart';
import '../../API/Model/subjob_model.dart';
import '../Widgets/hepler.dart';

class SubJobProfile extends StatefulWidget {
  const SubJobProfile({Key key}) : super(key: key);

  @override
  State<SubJobProfile> createState() => SubJobProfileState();
}

class SubJobProfileState extends State<SubJobProfile> {
  final GetXNetworkManager _networkManager = Get.put(GetXNetworkManager());
  final List<String> _selectedValues = [];
  var data = Get.arguments;
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
  @override
  void initState() {
    getUserId();
    super.initState();
  }
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
              "Select Sub Job Profile",
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
              child: customAssetPath(imagePath: subjob, size: 130),
            ),
            Container(
              height: SizeConfig.screenHeight,
              color: const Color(0xff018F89),
              child: Column(
                children: [
                  FutureBuilder<SubjobProfileModel>(
                    future: getsubprofile(StaffCategory: data[0]),
                    builder: (context, snapshot) {
                      if (_networkManager.connectionType == 0) {
                        return const Center(
                          child: Text("No Internet connection"),
                        );
                      } else if (snapshot.data == null) {
                        return Column(children: <Widget>[
                          Shimmer.fromColors(
                              baseColor: Colors.grey[300],
                              highlightColor: Colors.grey[100],
                              child: GridView.count(
                                physics: const BouncingScrollPhysics(),
                                shrinkWrap: true,
                                crossAxisCount: 2,
                                children: <Widget>[
                                  Container(
                                    margin: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.grey[300],
                                      border: Border.all(
                                        color: Colors.grey,
                                        width: 1,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.grey[300],
                                      border: Border.all(
                                        color: Colors.grey,
                                        width: 1,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.grey[300],
                                      border: Border.all(
                                        color: Colors.grey,
                                        width: 1,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.grey[300],
                                      border: Border.all(
                                        color: Colors.grey,
                                        width: 1,
                                      ),
                                    ),
                                  ),
                                ],
                              ))
                        ]);
                      } else {
                        return GridView.builder(
                            padding: const EdgeInsets.all(10),
                            physics: const BouncingScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              childAspectRatio: 16 / 11,
                              crossAxisCount: 2,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                            ),
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: snapshot.data.result.length,
                            itemBuilder: (context, index) {
                              var list = snapshot.data.result[index];
                              return InkWell(
                                onTap: () {

                                  setState(() {
                                    if (_selectedValues
                                        .contains(list.designation)) {
                                      _selectedValues
                                          .remove(list.designation);
                                    } else {
                                      _selectedValues.add(list.designation);
                                    }
                                  });
                                },
                                child: jobUI(
                                    model: SubjobProfileModel(result: [list])),
                              );
                            });
                      }
                      // else if (snapshot.data == null) {
                      //   return Center(
                      //       child: Center(
                      //           child: snapshot.connectionState !=
                      //                   ConnectionState.done
                      //               ? const CircularProgressIndicator()
                      //               : Helper().customText(
                      //                   text: "No Data Available".tr,
                      //                   fontSize: 22,
                      //                   align: TextAlign.center)));
                      // }
                      // else {
                      //   return GridView.builder(
                      //       padding: const EdgeInsets.all(10),
                      //       physics: const BouncingScrollPhysics(),
                      //       gridDelegate:
                      //           const SliverGridDelegateWithFixedCrossAxisCount(
                      //         childAspectRatio: 16 / 11,
                      //         crossAxisCount: 2,
                      //         crossAxisSpacing: 10,
                      //         mainAxisSpacing: 10,
                      //       ),
                      //       scrollDirection: Axis.vertical,
                      //       shrinkWrap: true,
                      //       itemCount: snapshot.data.result.length,
                      //       itemBuilder: (context, index) {
                      //         var list = snapshot.data.result[index];
                      //         return InkWell(
                      //           onTap: () {
                      //             setState(() {
                      //               if (_selectedValues
                      //                   .contains(list.staffCategory)) {
                      //                 _selectedValues
                      //                     .remove(list.staffCategory);
                      //               } else {
                      //                 _selectedValues.add(list.staffCategory);
                      //               }
                      //             });
                      //           },
                      //           child: jobUI(
                      //               model: SubjobProfileModel(result: [list])),
                      //         );
                      //       });
                      // }
                    },
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
                      errorLens();
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => const HomeScreen()));
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget jobUI({SubjobProfileModel model}) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: _selectedValues.contains(model.result[0].designation)
              ? const Color.fromARGB(255, 156, 255, 250)
              : Colors.white,
          border: Border.all(
            color: textColor,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Icon(
              _selectedValues.contains(model.result[0].designation)
                  ? Icons.check_box
                  : Icons.check_box_outline_blank,
              color: _selectedValues.contains(model.result[0].designation)
                  ? textColor
                  : Colors.grey,
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Helper().customText1(
                text: model.result[0].designation,
                fontSize: 16,
                align: TextAlign.center,
                fWeight: FontWeight.bold,
                overflow: TextOverflow.fade),
          ),
        ],
      ),
    );
  }

  errorLens() {
    if (_selectedValues.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(customSnackbar(
          label: "",
          time: const Duration(seconds: 5),
          press: () {},
          msg: "Select Job Profile",
          chooseColor: Colors.red));
    }
    //  else if (_selectedValues.length > 1) {
    //   ScaffoldMessenger.of(context).showSnackBar(customSnackbar(
    //       label: "",
    //       time: const Duration(seconds: 5),
    //       press: () {},
    //       msg: "Select less than 1 value",
    //       chooseColor: Colors.red));
    // } 
    else {
      updateprofile(
           JobOfferingId:"af4b3936-f046-4ed1-8bc3-9d90a93e0bc6"
              .toString()
              .replaceAll("[", "")
              .replaceAll("]", ""),
              RegistrationId: registrationId,
          context: context);
    }
  }
}
