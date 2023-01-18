import 'package:fit_to_job/API/Model/subject_model.dart';
import 'package:fit_to_job/Screens/CommonScreen/training_chapter_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../API/Controller/training_controller.dart';
import '../Constant/Colorpath.dart';
import '../Constant/imagePath.dart';
import '../Widgets/hepler.dart';

class TrainingSubjectScreen extends StatefulWidget {
  const TrainingSubjectScreen({Key key}) : super(key: key);

  @override
  _TrainingSubjectScreenState createState() => _TrainingSubjectScreenState();
}

class _TrainingSubjectScreenState extends State<TrainingSubjectScreen> {
  String registrationId;
  String firstName;
  String designation;
  String jobOfferingId;

  String chapterId = "";

  getUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      registrationId = prefs.getString('registrationId');
      firstName = prefs.getString('firstName');
      designation = prefs.getString('designation');
      jobOfferingId = prefs.getString('jobOfferingId');
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
      backgroundColor: splashBGColor,
      appBar: AppBar(
        backgroundColor: splashBGColor,
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
            "Subject Material",
            style: TextStyle(
                color: Color(0xff1AA19A),
                fontSize: 24,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: _subjectViewUI(),
    );
  }

  Widget _subjectViewUI() {
    return SizedBox(
        //height: MediaQuery.of(context).size.height / 2,
        //width: MediaQuery.of(context).size.width,
        child: FutureBuilder(
            future: subjectListAPI(RegistrationId: registrationId),
            builder: (context, snapshot) {
              if (snapshot.data == null) {
                return Center(
                    child: snapshot.connectionState != ConnectionState.done
                        ? const CircularProgressIndicator()
                        : Helper()
                            .customText(text: "No Data Found", fontSize: 20));
              } else {
                return SizedBox(
                  //height: MediaQuery.of(context).size.height / 2,
                  //width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                      itemCount: snapshot.data.result.length,
                      itemBuilder: (context, index) {
                        var list = snapshot.data.result[index];
                        return _subjectUISetup(
                            model: SubjectModel(result: [list]));
                      }),
                );
              }
            }));
  }

  Widget _subjectUISetup({SubjectModel model}) {
    chapterId = model.result[0].subId;

    return Container(
      //height: 200,
      //padding: const EdgeInsets.symmetric(vertical: 2),
      margin: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
      child: Column(
        children: <Widget>[
          InkWell(
            onTap: () async {
              Get.to(() => TrainingChapterScreen(), arguments: [chapterId]);
            },
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
              color: Colors.white,
              elevation: 5,
              child: ListTile(
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  //mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 10,
                              child: Text(model.result[0].name,
                                  style: const TextStyle(
                                      fontSize: 18,
                                      color: Color(0xff9B1A48),
                                      fontWeight: FontWeight.bold)),
                            ),
                            Expanded(
                              flex: 1,
                              child: Helper().customCount(
                                bName: model.result[0].count,
                                context: context,
                                //height: 15,
                                fweight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(model.result[0].remarks,
                              textAlign: TextAlign.left,
                              style: const TextStyle(
                                  fontSize: 18,
                                  color: Color(0xff9B1A48),
                                  fontWeight: FontWeight.normal)),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: customAssetPath(imagePath: stateGM, size: 50),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                      ],
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
}
