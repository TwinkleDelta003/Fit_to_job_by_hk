import 'package:fit_to_job/API/Model/chapter_pdf_model.dart';
import 'package:fit_to_job/API/Model/subject_model.dart';
import 'package:fit_to_job/Screens/CommonScreen/pdf_viewer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../API/Controller/training_controller.dart';
import '../Constant/Colorpath.dart';
import '../Constant/imagePath.dart';
import '../Widgets/hepler.dart';

class TrainingChapterPDFScreen extends StatefulWidget {
  const TrainingChapterPDFScreen({Key key}) : super(key: key);

  @override
  _TrainingChapterPDFScreenState createState() =>
      _TrainingChapterPDFScreenState();
}

class _TrainingChapterPDFScreenState extends State<TrainingChapterPDFScreen> {
  var bundleData = Get.arguments;

  String registrationId;
  String firstName;
  String designation;
  String jobOfferingId;

  String chapterId = "";
  String fileLink = "";

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
            "PDF List",
            style: TextStyle(
                color: Color(0xff1AA19A),
                fontSize: 24,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: _pdfViewUI(),
    );
  }

  Widget _pdfViewUI() {
    return SizedBox(
        //height: MediaQuery.of(context).size.height / 2,
        //width: MediaQuery.of(context).size.width,
        child: FutureBuilder(
            future: chapterPDFListAPI(chapterId: bundleData[0]),
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
                        return _pdfUISetup(
                            model: ChapterPDFModel(result: [list]));
                      }),
                );
              }
            }));
  }

  Widget _pdfUISetup({ChapterPDFModel model}) {
    //chapterId = model.result[0].subId;
    //chapterId = model.result[0].chapterId;
    fileLink = model.result[0].fileLink
        .replaceAll("u0026", "&")
        .replaceAll("u0027", "'");

    return Container(
      //height: 200,
      //padding: const EdgeInsets.symmetric(vertical: 2),
      margin: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
      child: Column(
        children: <Widget>[
          InkWell(
            onTap: () async {
              Get.to(() => PDFViewerScreen(), arguments: [fileLink]);
              print(fileLink);
              print(bundleData[0]);
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
                    Column(
                      children: [
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            customAssetPath(imagePath: pdfs, size: 50),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(model.result[0].fileName,
                                style: const TextStyle(
                                    fontSize: 18,
                                    color: Color(0xff9B1A48),
                                    fontWeight: FontWeight.bold)),
                          ],
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
