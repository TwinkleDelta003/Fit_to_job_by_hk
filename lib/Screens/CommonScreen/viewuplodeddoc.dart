// import 'dart:convert';
// import 'package:fit_to_job/Screens/Constant/Colorpath.dart';
// import 'package:fit_to_job/Screens/Constant/responsive.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:video_player/video_player.dart';

// class ViewUploadDocs extends StatefulWidget {
//   @override
//   State<ViewUploadDocs> createState() => _ViewUploadDocsState();
// }

// class _ViewUploadDocsState extends State<ViewUploadDocs> {
//   Future<ViewDosModel> getDocsData({String url}) async {
//     final response = await http.post(
//         Uri.parse("http://110.227.253.77:90/DeltaFitToJob/API/" + url),
//         body: {"RegistrationId": "616cafea-80fc-4cde-8624-acbecb79d4ff"});
//     var data = jsonDecode(response.body);
//     if (data['status'] == "200") {
//       return ViewDosModel.fromJson(data);
//     } else {
//       return null;
//     }
//   }

//   String photo = '';
//   String video = '';
//   String resumeName = '';
//   String resumePath = '';

//   VideoPlayerController _controller;
//   Future<void> _video;

//   @override
//   void initState() {
//     _controller = VideoPlayerController.network(video);
//     video = controller.initialize();
//     getDocsData(url: "API_GetPhoto.aspx").then(
//       (value) => {
//         if (value.status == "200")
//           {
//             Text(
//               "data",
//             ),
//             // CustomProgressDialog.hideProgress(),
//             setState(() {
//               photo = value.result[0].photo;
//             })
//           },
//       },
//     );
//     getDocsData(url: "API_GetVideo.aspx").then(
//       (value) => {
//         if (value.status == "200")
//           {
//             // CustomProgressDialog.hideProgress(),
//             setState(() {
//               video = value.result[0].selfIntroVideoPath;
//             })
//           },
//       },
//     );
//     getDocsData(url: "API_GetResume.aspx").then(
//       (value) => {
//         if (value.status == "200")
//           {
//             // CustomProgressDialog.hideProgress(),
//             setState(() {
//               resumePath = value.result[0].resumePath;
//               resumeName = value.result[0].resumeName;
//             }),
//           },
//       },
//     );
//     getUserId();
//     super.initState();
//   }

//   String videoPath;
//   String firstName;
//   String lastName;
//   String registrationId;
//   String designation;
//   getUserId() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     setState(() {
//       videoPath = prefs.getString('videoFile');
//       lastName = prefs.getString('lastName');
//       firstName = prefs.getString('firstName');
//       registrationId = prefs.getString('registrationId');
//       designation = prefs.getString('designation');
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           //  leading: Icon(Icons.),
//           actions: [
//             IconButton(
//                 onPressed: () {},
//                 icon: Icon(
//                   Icons.save,
//                   color: textColor,
//                 ))
//           ],
//           title: InkWell(
//             onTap: () {
//               print(registrationId.toString());
//             },
//             child: Text(
//               "View Uploaded Docs",
//               style: TextStyle(color: textColor, fontWeight: FontWeight.bold),
//             ),
//           ),
//           elevation: 0,
//           backgroundColor: Colors.transparent,
//         ),
//         body: SingleChildScrollView(child: Container(child: docsUI())));
//   }

//   Widget docsUI() {
//     return Container(
//       height: SizeConfig.screenHeight,
//       child: Card(
//         child: Column(
//           children: <Widget>[
//             ListTile(
//               horizontalTitleGap: 10,
//               title: Text("Profile Photo",
//                   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
//               subtitle: Align(
//                   alignment: Alignment.centerLeft,
//                   child: CircleAvatar(
//                       radius: 90, backgroundImage: NetworkImage(photo))),
//             ),
//             SizedBox(height: 20),
//             ListTile(
//               horizontalTitleGap: 10,
//               title: Text("Resume",
//                   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
//               trailing: IconButton(
//                   onPressed: () {},
//                   icon: Icon(
//                     Icons.delete,
//                     color: textColor,
//                   )),
//               subtitle: Align(
//                 alignment: Alignment.centerLeft,
//                 child: Text(
//                   resumeName,
//                   style: TextStyle(
//                       fontWeight: FontWeight.bold, color: Colors.black),
//                 ),
//               ),
//             ),
//             ListTile(
//               trailing: IconButton(
//                   onPressed: () {
//                     if (_controller.value.isPlaying) {
//                       setState(() {
//                         _controller.pause();
//                       });
//                     } else {
//                       setState(() {
//                         _controller.play();
//                       });
//                     }
//                   },
//                   icon: Icon(_controller.value.isPlaying
//                       ? Icons.pause
//                       : Icons.play_arrow)),
//               horizontalTitleGap: 10,
//               title: Text("Video",
//                   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             videoUI()
//           ],
//         ),
//       ),
//     );
//   }

//   Widget videoUI() {
//     return FutureBuilder(
//       future: _video,
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.done) {
//           return Center(
//             child: AspectRatio(
//               aspectRatio: _controller.value.aspectRatio,
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: VideoPlayer(_controller),
//               ),
//             ),
//           );
//         } else {
//           return Center(
//             child: CircularProgressIndicator(),
//           );
//         }
//       },
//     );
//   }
// }

// class ViewDosModel {
//   String status;
//   String message;
//   List<Result> result;

//   ViewDosModel({this.status, this.message, this.result});

//   ViewDosModel.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     message = json['message'];
//     if (json['result'] != null) {
//       result = <Result>[];
//       json['result'].forEach((v) {
//         result.add(new Result.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['status'] = this.status;
//     data['message'] = this.message;
//     if (this.result != null) {
//       data['result'] = this.result.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class Result {
//   String registrationId;
//   String selfIntroVideoPath;
//   String photo;
//   String resumePath;
//   String resumeName;

//   Result({this.registrationId, this.selfIntroVideoPath});

//   Result.fromJson(Map<String, dynamic> json) {
//     registrationId = json['RegistrationId'];
//     selfIntroVideoPath = json['SelfIntroVideoPath'];
//     photo = json['PhotoPath'];
//     resumeName = json['ResumeName'];
//     resumePath = json['UplaodResume'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['RegistrationId'] = this.registrationId;
//     data['SelfIntroVideoPath'] = this.selfIntroVideoPath;
//     data['PhotoPath'] = this.photo;
//     data['ResumeName'] = this.resumeName;
//     data['UplaodResume'] = this.resumePath;
//     return data;
//   }
// }

import 'dart:convert';

import 'package:fit_to_job/Screens/Constant/Colorpath.dart';
import 'package:fit_to_job/Screens/Constant/responsive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:video_player/video_player.dart';

class ViewUploadDocs extends StatefulWidget {
  @override
  State<ViewUploadDocs> createState() => _ViewUploadDocsState();
}

class _ViewUploadDocsState extends State<ViewUploadDocs> {
  String registrationId;
  getUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    registrationId = prefs.getString('registrationId');
  }

  Future<ViewDosModel> getDocsData({String url}) async {
    final response = await http.post(
        Uri.parse("http://110.227.253.77:90/DeltaFitToJob/API/" + url),
        body: {"RegistrationId": data1[0]});
    var data = jsonDecode(response.body);
    if (data['status'] == "200") {
      return ViewDosModel.fromJson(data);
    } else {
      return null;
    }
  }

  static var data1 = Get.arguments;
  String photo = '';
  String video = '';
  String resumeName = '';
  String resumePath = '';

  VideoPlayerController _controller;
  Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    getUserId();
    print("Registration " + data1[0].toString());
    _controller = VideoPlayerController.network(video);
    _initializeVideoPlayerFuture = _controller.initialize();
    getDocsData(url: "API_GetPhoto.aspx").then(
      (value) => {
        if (value.status == "200")
          {
            // CustomProgressDialog.hideProgress(),
            setState(() {
              photo = value.result[0].photo;
            })
          },
      },
    );
    getDocsData(url: "API_GetVideo.aspx").then(
      (value) => {
        if (value.status == "200")
          {
            // CustomProgressDialog.hideProgress(),
            setState(() {
              video = value.result[0].selfIntroVideoPath;
            })
          },
      },
    );
    getDocsData(url: "API_GetResume.aspx").then(
      (value) => {
        if (value.status == "200")
          {
            // CustomProgressDialog.hideProgress(),
            setState(() {
              resumePath = value.result[0].resumePath;
              resumeName = value.result[0].resumeName;
            }),
          },
      },
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
               onPressed: () => Get.back(),
              icon: Icon(
                Icons.arrow_back_ios,
                color: textColor,
              )),
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.save,
                  color: textColor,
                ))
          ],
          title: InkWell(
            onTap: (() {
              print(registrationId);
            }),
            child: Text(
              "View Uploaded Docs",
              style: TextStyle(color: textColor, fontWeight: FontWeight.bold),
            ),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: SingleChildScrollView(child: Container(child: docsUI())));
  }

  Widget docsUI() {
    return Container(
      height: SizeConfig.screenHeight,
      child: Card(
        child: Column(
          children: <Widget>[
            ListTile(
              horizontalTitleGap: 10,
              title: Text("Profile Photo",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              subtitle: Align(
                  alignment: Alignment.centerLeft,
                  child: CircleAvatar(
                      radius: 90, backgroundImage: NetworkImage(photo))),
            ),
            SizedBox(height: 20),
            ListTile(
              horizontalTitleGap: 10,
              title: Text("Resume",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              trailing: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.delete,
                    color: textColor,
                  )),
              subtitle: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  resumeName,
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black),
                ),
              ),
            ),
            ListTile(
              trailing: IconButton(
                  onPressed: () {
                    if (_controller.value.isPlaying) {
                      setState(() {
                        _controller.pause();
                      });
                    } else {
                      setState(() {
                        _controller.play();
                      });
                    }
                  },
                  icon: Icon(_controller.value.isPlaying
                      ? Icons.pause
                      : Icons.play_arrow)),
              horizontalTitleGap: 10,
              title: Text("Video",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            ),
            SizedBox(
              height: 20,
            ),
            videoUI()
          ],
        ),
      ),
    );
  }

  Widget videoUI() {
    return FutureBuilder(
      future: _initializeVideoPlayerFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            child: VideoPlayer(_controller),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

class ViewDosModel {
  String status;
  String message;
  List<Result> result;

  ViewDosModel({this.status, this.message, this.result});

  ViewDosModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['result'] != null) {
      result = <Result>[];
      json['result'].forEach((v) {
        result.add(new Result.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.result != null) {
      data['result'] = this.result.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Result {
  String registrationId;
  String selfIntroVideoPath;
  String photo;
  String resumePath;
  String resumeName;

  Result({this.registrationId, this.selfIntroVideoPath});

  Result.fromJson(Map<String, dynamic> json) {
    registrationId = json['RegistrationId'];
    selfIntroVideoPath = json['SelfIntroVideoPath'];
    photo = json['PhotoPath'];
    resumeName = json['ResumeName'];
    resumePath = json['UplaodResume'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['RegistrationId'] = this.registrationId;
    data['SelfIntroVideoPath'] = this.selfIntroVideoPath;
    data['PhotoPath'] = this.photo;
    data['ResumeName'] = this.resumeName;
    data['UplaodResume'] = this.resumePath;
    return data;
  }
}
