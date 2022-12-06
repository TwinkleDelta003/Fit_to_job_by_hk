
import 'package:fit_to_job/Screens/CommonScreen/uploaddoc_screen.dart';
import 'package:fit_to_job/Screens/Constant/Colorpath.dart';
import 'package:fit_to_job/Screens/Constant/imagePath.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../API/Controller/jobprofile_controller.dart';
import '../../API/Model/jobprofile_model.dart';
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
  final List<String> _selectedValues = [];

  String complain;

  bool isDismissible = false;


  var data = Get.arguments;

 

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
                  FutureBuilder<JobprofileModel>(
                    future: getjobprofile(),
                    builder: (context, snapshot) {
                      // if (_networkManager.connectionType == 0) {
                      //   return Center(
                      //     child: Lottie.asset(noInternet),
                      //   ); su joiae jap kela
                      // } else 
                      if (snapshot.data == null) {
                        return Center(
                            child: Center(
                                child: snapshot.connectionState !=
                                        ConnectionState.done
                                    ? const CircularProgressIndicator()
                                    : Helper().customText(
                                        text: "No Data Available".tr,
                                        fontSize: 22,
                                        align: TextAlign.center)));
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
                                        .contains(list.staffCategory)) {
                                      _selectedValues
                                          .remove(list.staffCategory);
                                    } else {
                                      _selectedValues.add(list.staffCategory);
                                    }
                                    debugPrint(_selectedValues.toString());
                                  });
                                },
                                child: jobUI(
                                    model: JobprofileModel(result: [list])),
                              );
                            });
                      }
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Helper().customMaterialButton1(
                    bName: "continue",
                    context: context,
                    fSize: 26,
                    fweight: FontWeight.bold,
                    press: () {
                      errorLens();
                    
                     
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

  Widget jobUI({JobprofileModel model}) {
    return Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: _selectedValues.contains(model.result[0].staffCategory)
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
                _selectedValues.contains(model.result[0].staffCategory)
                    ? Icons.check_box
                    : Icons.check_box_outline_blank,
                color: _selectedValues.contains(model.result[0].staffCategory)
                    ? textColor
                    : Colors.grey,
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Helper().customText1(
                  text: model.result[0].staffCategory,
                  fontSize: 16,
                  align: TextAlign.center,
                  fWeight: FontWeight.bold,
                  overflow: TextOverflow.fade),
            ),
          ],
        ));
  }

  errorLens() {
    if (_selectedValues.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(customSnackbar(
          label: "",
          time: const Duration(seconds: 5),
          press: () {},
          msg: "Select Job Profile",
          chooseColor: Colors.red));
    } else {
      getsubprofile(
          StaffCategory: _selectedValues
              .toString()
              .replaceAll("[", "")
              .replaceAll("]", ""),
          context: context);
    }
  }
}
