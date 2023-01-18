import 'package:fit_to_job/API/Model/chapter_video_model.dart';
import 'package:fit_to_job/Screens/CommonScreen/youtube_player.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../API/Controller/training_controller.dart';
import '../Constant/Colorpath.dart';
import '../Constant/imagePath.dart';
import '../Widgets/hepler.dart';

class TrainingChapterVideoScreen extends StatefulWidget {
  const TrainingChapterVideoScreen({Key key}) : super(key: key);

  @override
  _TrainingChapterVideoScreenState createState() =>
      _TrainingChapterVideoScreenState();
}

class _TrainingChapterVideoScreenState
    extends State<TrainingChapterVideoScreen> {
  var bundleData = Get.arguments;

  String registrationId;
  String firstName;
  String designation;
  String jobOfferingId;

  String chapterId = "";
  String videoLink = "";
  String videoId = "";
  String chapterVideoId = "";

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
    print(bundleData[0]);
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
            "Video List",
            style: TextStyle(
                color: Color(0xff1AA19A),
                fontSize: 24,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: _videoViewUI(),
    );
  }

  Widget _videoViewUI() {
    return SizedBox(
        child: FutureBuilder(
            future: chapterVideoListAPI(chapterId: bundleData[0]),
            builder: (context, snapshot) {
              if (snapshot.data == null) {
                return Center(
                    child: snapshot.connectionState != ConnectionState.done
                        ? const CircularProgressIndicator()
                        : Helper()
                            .customText(text: "No Data Found", fontSize: 20));
              } else {
                return SizedBox(
                  child: ListView.builder(
                      itemCount: snapshot.data.result.length,
                      itemBuilder: (context, index) {
                        var list = snapshot.data.result[index];
                        return _videoUISetup(
                            model: ChapterVideoModel(result: [list]));
                      }),
                );
              }
            }));
  }

  Widget _videoUISetup({ChapterVideoModel model}) {
    //chapterId = model.result[0].subId;
    //chapterId = model.result[0].chapterId;
    videoLink = model.result[0].videoLink;
    videoId = model.result[0].videoID;
    chapterVideoId = model.result[0].chapterVideoId;

    return Container(
      margin: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
      child: Column(
        children: <Widget>[
          InkWell(
            onTap: () async {
              // if (videoLink.contains("https://vimeo.com/")) {
              //   Get.to(() => const VimeoPlayerScreen(),
              //       arguments: [videoLink, videoId, chapterVideoId]);
              // } else if (videoLink.contains("https://youtube.com/")) {
              //   Get.to(() => const YoutubePlayerScreen(),
              //       arguments: [videoLink, videoId, chapterVideoId]);
              // }

              Get.to(() =>  YoutubePlayerScreen(),
                  arguments: [videoLink, videoId, chapterVideoId]);
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
                            customAssetPath(imagePath: videos, size: 50),
                            const SizedBox(
                              width: 10,
                            ),
                            Column(
                              children: [
                                Text(model.result[0].videoName,
                                    style: const TextStyle(
                                        fontSize: 18,
                                        color: Color(0xff9B1A48),
                                        fontWeight: FontWeight.bold)),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(model.result[0].remarks,
                                    style: const TextStyle(
                                        fontSize: 18,
                                        color: Color(0xff9B1A48),
                                        fontWeight: FontWeight.normal)),
                              ],
                            )
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
