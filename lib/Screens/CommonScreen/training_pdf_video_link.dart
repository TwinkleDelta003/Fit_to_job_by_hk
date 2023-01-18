import 'package:fit_to_job/Screens/CommonScreen/training_chapter_pdf_screen.dart';
import 'package:fit_to_job/Screens/CommonScreen/training_chapter_ref_links_screen.dart';
import 'package:fit_to_job/Screens/CommonScreen/training_chapter_video_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Constant/Colorpath.dart';
import '../Constant/imagePath.dart';
import '../Widgets/hepler.dart';

class TrainingPDFVideoLink extends StatefulWidget {
  const TrainingPDFVideoLink({Key key}) : super(key: key);

  @override
  _TrainingPDFVideoLinkState createState() => _TrainingPDFVideoLinkState();
}

class _TrainingPDFVideoLinkState extends State<TrainingPDFVideoLink> {
  var bundleData = Get.arguments;
  String chapterId = "";

  @override
  void initState() {
    chapterId = bundleData[0];
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
          padding: EdgeInsets.only(right: 60.0),
          child: Text(
            "PDF,Videos & Link Show",
            style: TextStyle(
                color: Color(0xff1AA19A),
                fontSize: 22,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: _pdfLayoutUI(),
                  flex: 1,
                ),
                SizedBox(
                  width: 5,
                ),
                Expanded(
                  child: _videoLayoutUI(),
                  flex: 1,
                ),
                SizedBox(
                  width: 10,
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: _linkLayoutUI(),
                  flex: 1,
                ),
                SizedBox(
                  width: 5,
                ),
                Expanded(
                  child: Visibility(
                    visible: false,
                    child: _linkLayoutUI(),
                  ),
                  flex: 1,
                ),
                SizedBox(
                  width: 10,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _pdfLayoutUI() {
    return Container(
      //height: 200,
      //padding: const EdgeInsets.symmetric(vertical: 2,horizontal: 2),
      child: Column(
        children: <Widget>[
          InkWell(
            onTap: () async {
              Get.to(() => const TrainingChapterPDFScreen(),
                  arguments: [chapterId]);
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
                            bName: bundleData[1],
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
                            imagePath: pdfs,
                            size: 75,
                            //fit: BoxFit.fitHeight, // I thought this would fill up my Container but it doesn't
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text("PDFs",
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

  Widget _videoLayoutUI() {
    return Container(
      //height: 200,
      //padding: const EdgeInsets.symmetric(vertical: 2),
      child: Column(
        children: <Widget>[
          InkWell(
            onTap: () async {
              Get.to(() => const TrainingChapterVideoScreen(),
                  arguments: [chapterId]);
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
                            bName: bundleData[2],
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
                            imagePath: videos,
                            size: 75,
                            //fit: BoxFit.fitHeight, // I thought this would fill up my Container but it doesn't
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text("Videos",
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

  Widget _linkLayoutUI() {
    return Container(
      //height: 200,
      //padding: const EdgeInsets.symmetric(vertical: 2,horizontal: 2),
      child: Column(
        children: <Widget>[
          InkWell(
            onTap: () async {
              Get.to(() => const TrainingChapterRefLinksScreen(),
                  arguments: [chapterId]);
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
                        /*Align(
                          alignment: Alignment.topRight,
                          child: Helper().customCount(
                            bName: "0",
                            context: context,
                            //height: 15,
                            fweight: FontWeight.bold,
                          ),
                        ),*/
                        const SizedBox(
                          height: 30,
                        ),
                        Center(
                          child: customAssetPath(
                            imagePath: links2,
                            size: 75,
                            //fit: BoxFit.fitHeight, // I thought this would fill up my Container but it doesn't
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text("Reference Links",
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
