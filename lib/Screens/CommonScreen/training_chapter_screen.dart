import 'package:fit_to_job/API/Model/chapter_model.dart';
import 'package:fit_to_job/Screens/CommonScreen/training_pdf_video_link.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../API/Controller/training_controller.dart';
import '../Constant/Colorpath.dart';
import '../Constant/imagePath.dart';
import '../Widgets/hepler.dart';

class TrainingChapterScreen extends StatefulWidget {
  const TrainingChapterScreen({Key key}) : super(key: key);

  @override
  _TrainingChapterScreenState createState() => _TrainingChapterScreenState();
}

class _TrainingChapterScreenState extends State<TrainingChapterScreen> {
  var bundleData = Get.arguments;

  String registrationId;
  String firstName;
  String designation;
  String jobOfferingId;

  String chapterId = "";
  String pdfCount = "";
  String videoCount = "";

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
            "Chapter Material",
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
            /*Helper().customCount1(
              bName: "FAZALUDDIN",
              context: context,
              //height: 15,
              fweight: FontWeight.bold,
            ),
            SizedBox(height: 10,),*/
            _chapterViewUI(),
          ],
        ),
      ),
    );
  }

  Widget _chapterViewUI() {
    return SizedBox(
        //height: MediaQuery.of(context).size.height / 2,
        //width: MediaQuery.of(context).size.width,
        child: FutureBuilder(
            future: chapterListAPI(chapterId: bundleData[0]),
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
                  child: GridView.builder(
                      padding: const EdgeInsets.all(10),
                      physics: const BouncingScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        //childAspectRatio: 16 / 11,
                        crossAxisCount: 2,
                        //crossAxisSpacing: 10,
                        //mainAxisSpacing: 10,
                      ),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: snapshot.data.result.length,
                      itemBuilder: (context, index) {
                        var list = snapshot.data.result[index];
                        return _chapterUISetup(
                            model: ChapterModel(result: [list]));
                      }),
                );
              }
            }));
  }

  Widget _chapterUISetup({ChapterModel model}) {
    //chapterId = model.result[0].subId;
    chapterId = model.result[0].chapterId;

    pdfCount = model.result[0].pDFCnt;
    videoCount = model.result[0].videoCnt;
    int finalCount = int.parse(pdfCount) + int.parse(videoCount);

    return Container(
      //height: 200,
      //padding: const EdgeInsets.symmetric(vertical: 2),
      child: Column(
        children: <Widget>[
          InkWell(
            onTap: () async {
              Get.to(() => const TrainingPDFVideoLink(),
                  arguments: [chapterId,pdfCount,videoCount]);
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
                        Align(
                          alignment: Alignment.topRight,
                          child: Helper().customCount(
                            bName: finalCount.toString(),
                            context: context,
                            //height: 15,
                            fweight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Center(
                          child: customAssetPath(
                            imagePath: books,
                            size: 75,
                            //fit: BoxFit.fitHeight, // I thought this would fill up my Container but it doesn't
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(model.result[0].chapterName,
                            style: const TextStyle(
                                fontSize: 18,
                                color: Color(0xff9B1A48),
                                fontWeight: FontWeight.bold)),
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
