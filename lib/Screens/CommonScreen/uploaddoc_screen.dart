import 'dart:convert';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:fit_to_job/Screens/CommonScreen/uploaddone_screen.dart';
import 'package:fit_to_job/Screens/Constant/Colorpath.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Constant/imagePath.dart';
import '../Constant/responsive.dart';
import '../Widgets/hepler.dart';
import 'package:video_player/video_player.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:open_file/open_file.dart';

class UploadScreen extends StatefulWidget {
  const UploadScreen({Key key}) : super(key: key);

  @override
  State<UploadScreen> createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  String videoPath;
  String firstName;
  String lastName;
  String registrationId;
  String designation;
  getUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      videoPath = prefs.getString('videoFile');
      lastName = prefs.getString('lastName');
      firstName = prefs.getString('firstName');
      registrationId = prefs.getString('registrationId');
      designation = prefs.getString('designation');
    });
  }

  @override
  void initState() {
    getUserId();
    super.initState();
  }

  File _image;
  final ImagePicker _picker = ImagePicker();
  VideoPlayerController _controller;
  bool isCaptured = false;
  final picker = ImagePicker();

  Future clickPhoto() async {
    var pickedImage =
        await picker.pickImage(source: ImageSource.camera, imageQuality: 50);
    setState(() {
      _image = File(pickedImage.path);
    });
  }

  Future uploadImage() async {
    var url =
        "http://110.227.253.77:90/DeltaFitToJob/API/RegistrationVerifications.aspx";
    var request = http.MultipartRequest('POST', Uri.parse(url));
    request.fields['RegistrationId'] = "b1660f38-e7fc-405a-bd8b-e16c25479db7";

    var pic = await http.MultipartFile.fromPath("PhotoPath", _image.path);

    request.files.add(pic);
    var response = await request.send();

    var responsed = await http.Response.fromStream(response);
    final responseJson = json.decode(responsed.body);

    return responseJson;

    // debugPrint(responseJson);
    // debugPrint(registrationId);
  }

  Future<void> _playVideo(XFile file) async {
    if (file != null && mounted) {
      debugPrint("Loading Video");
      await _disposeVideoController();
      VideoPlayerController controller;
      /*if (kIsWeb) {
        controller = VideoPlayerController.network(file.path);
      } else {*/
      controller = VideoPlayerController.file(File(file.path));
      //}
      _controller = controller;

      //await controller.setVolume(volume);
      await controller.initialize();
      await controller.setLooping(true);
      await controller.play();
      setState(() {});
    } else {
      debugPrint("Loading Video error");
    }
  }

  Widget _previewVideo() {
    if (_controller == null) {
      return const Text(
        'You have not yet picked a video',
        textAlign: TextAlign.center,
      );
    }
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: AspectRatioVideo(_controller),
    );
  }

  Future uploadVideo() async {
    var url =
        "http://110.227.253.77:90/DeltaFitToJob/API/API_SelfIntroVideo.aspx";
    var request = http.MultipartRequest('POST', Uri.parse(url));
    request.fields['RegistrationId'] = "b1660f38-e7fc-405a-bd8b-e16c25479db7";

    var video = await http.MultipartFile.fromPath(
        "SelfIntroVideoPath", videoPath.toString());

    request.files.add(video);
    var response = await request.send();

    var responsed = await http.Response.fromStream(response);
    final responseJson = json.decode(responsed.body);

    if (responseJson['status'] == "209") {
      Helper().customSnackbar(
        bgColor: Colors.red,
        msgColor: Colors.white,
        message: responseJson['message'],
        duration: const Duration(seconds: 2),
        title: "Error",
        icon: const Icon(Icons.check),
      );
      debugPrint(responseJson);
    }
    return responseJson;
  }

  Future uploadFile() async {
    var url =
        "http://110.227.253.77:90/DeltaFitToJob/API/API_UploadResume.aspx";
    var request = http.MultipartRequest('POST', Uri.parse(url));
    request.fields['RegistrationId'] = "b1660f38-e7fc-405a-bd8b-e16c25479db7";
    var uploadfile = await http.MultipartFile.fromPath(
        "ResumeUpload", uploadFile.toString());
    request.files.add(uploadfile);
    var response = await request.send();
    var responsed = await http.Response.fromStream(response);
    final responseJson = json.decode(responsed.body);
    if (responseJson['status'] == "209") {
      Helper().customSnackbar(
        bgColor: Colors.red,
        msgColor: Colors.white,
        message: responseJson['message'],
        duration: const Duration(seconds: 2),
        title: "Error",
        icon: const Icon(Icons.check),
      );
      debugPrint(responseJson);
    }
  }

  Widget _previewResume() {
    if (_controller == null) {
      return const Text(
        'You have not yet picked a video',
        textAlign: TextAlign.center,
      );
    }
    return Padding(
      padding: const EdgeInsets.all(10.0),
      // child: _openFile(file),
    );
  }

// Pick File and Open
  // Future  _pickFile() async {
  //   final result = await FilePicker.platform.pickFiles(allowMultiple: true);
  //   if (result == null) return;
  //   final file = result.files.first;

  //   _openFile(file);
  // }
  // Get.dialog(AlertDialog(
  //   title: Text("Your Image".tr),
  //   content: _openFile(file),
  //   actions: [
  //     TextButton(
  //         onPressed: () => Get.back(),
  //         child: Text(
  //           "Cancel".tr,
  //           style: const TextStyle(fontSize: 16),
  //         )),
  //     SizedBox(
  //       // ignore: use_build_context_synchronously
  //       width: MediaQuery.of(context).size.width / 2,
  //       child: Helper().customMaterialButton(
  //           bName: "Submit",
  //           fSize: 20,
  //           context: context,
  //           press: () {
  //             Get.back();
  //           }),
  //     )
  //   ],
  // )

// For view as Preview file
  _openFile(PlatformFile file) {
    OpenFile.open(file.path);
  }

  // Future<File> pickFile() async {
  //   final result = await FilePicker.platform.pickFiles(
  //     type: FileType.custom,
  //     allowedExtensions: ['pdf'],
  //   );
  //   if (result == null) return null;
  //   return File(result.paths.first ?? '');
  // }

  // void openPdf(BuildContext context, File file, String url) =>
  //     Navigator.of(context).push(
  //       MaterialPageRoute(
  //         builder: (context) => PdfViewerPage(
  //           file: file,
  //           url: url,
  //         ),
  //       ),
  //     );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
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
            "Online iExam",
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
                              "$firstName $lastName",
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
              child: customAssetPath(imagePath: upload, size: 130),
            ),
            Container(
              color: const Color(0xff018F89),
              height: SizeConfig.screenHeight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, top: 10),
                    child: Row(
                      children: [
                        customAssetPath(imagePath: doc, size: 20),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          "Upload Required Documents",
                          style: TextStyle(
                              color: Color(0xffE1C34D),
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    color: Colors.white,
                    child: Column(
                      children: [
                        Row(
                          children: const [
                            Padding(
                              padding: EdgeInsets.all(20.0),
                              child: Text(
                                "Check for how to upload Self Introduction,\n"
                                "candidate Photo, and Resume",
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                    color: Color(0xff041349),
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0, left: 110),
                          child: Helper().customMaterialButton2(
                            bName: "Demo",
                            context: context,
                            fSize: 24,
                            fweight: FontWeight.w500,
                            press: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const VideoPlayerScreen()));
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    color: Colors.white,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Column(
                              children: [
                                Padding(
                                    padding: const EdgeInsets.all(14.0),
                                    child: InkWell(
                                      onTap: () {
                                        clickPhoto().whenComplete(() =>
                                            Get.dialog(AlertDialog(
                                              title: Text("Your Image".tr),
                                              content: Container(
                                                child: _image.existsSync()
                                                    ? Image.file(_image)
                                                    : const Text("No Image"),
                                              ),
                                              actions: [
                                                TextButton(
                                                    onPressed: () => Get.back(),
                                                    child: Text(
                                                      "Cancel".tr,
                                                      style: const TextStyle(
                                                          fontSize: 16),
                                                    )),
                                                SizedBox(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      2,
                                                  child: Helper()
                                                      .customMaterialButton(
                                                          bName: "Submit".tr,
                                                          fSize: 20,
                                                          context: context,
                                                          press: () {
                                                            debugPrint(
                                                                _image.path);
                                                            uploadImage();

                                                            Get.back();
                                                          }),
                                                )
                                              ],
                                            )));
                                      },
                                      child: Container(
                                        height:
                                            MediaQuery.of(context).size.height /
                                                8,
                                        width:
                                            MediaQuery.of(context).size.width /
                                                4,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        child: Card(
                                          color: const Color(0xff41BBFF),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: const [
                                              SizedBox(
                                                height: 20,
                                              ),
                                              Icon(
                                                Icons.camera,
                                                color: Color(0xffffffff),
                                                size: 35,
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                "Image",
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              )
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
                                    padding: const EdgeInsets.all(14.0),
                                    child: InkWell(
                                      onTap: () async {
                                        final XFile file =
                                            await _picker.pickVideo(
                                          source: ImageSource.camera,
                                        );
                                        setState(() {
                                          isCaptured = true;
                                        });
                                        _playVideo(file).whenComplete(() => {
                                              Get.dialog(AlertDialog(
                                                actions: [
                                                  TextButton(
                                                      onPressed: () {
                                                        Get.back();
                                                        _disposeVideoController();
                                                      },
                                                      child: Text(
                                                        "Cancel".tr,
                                                        style: const TextStyle(
                                                            fontSize: 16),
                                                      )),
                                                  SizedBox(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            2,
                                                    child: Helper()
                                                        .customMaterialButton(
                                                            bName: "Confirm".tr,
                                                            fSize: 20,
                                                            context: context,
                                                            press: () {
                                                              Get.back();
                                                              videoPath =
                                                                  file.path;
                                                              uploadVideo();

                                                              debugPrint(
                                                                  "String Path $videoPath");
                                                              _disposeVideoController();
                                                            }),
                                                  )
                                                ],
                                                content: SizedBox(
                                                  width: double.infinity,
                                                  height: double.infinity,
                                                  child: _previewVideo(),
                                                ),
                                                title: Text(
                                                    "Your Recorded Video".tr),
                                              ))
                                            });
                                      },
                                      child: Container(
                                        height:
                                            MediaQuery.of(context).size.height /
                                                8,
                                        width:
                                            MediaQuery.of(context).size.width /
                                                4,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        child: Card(
                                          color: const Color(0xff41BBFF),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: const [
                                              SizedBox(
                                                height: 20,
                                              ),
                                              Icon(
                                                Icons.video_call,
                                                size: 35,
                                                color: Colors.white,
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                "Video",
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    )),
                              ],
                            ),
                            Padding(
                                padding: const EdgeInsets.all(14.0),
                                child: InkWell(
                                  onTap: () async {
                                    _pickFile() async {
                                      final result = await FilePicker.platform
                                          .pickFiles(allowMultiple: true);
                                      if (result == null) return;
                                      final file = result.files.first;

                                      _openFile(file).whenComplete(() => {
                                        
                                      });
                                    }
                                    // final XFile file =
                                    //     await _picker.pickVideo(
                                    //   source: ImageSource.camera,
                                    // );
                                    // setState(() {
                                    //   isCaptured = true;
                                    // });
                                    // _pickFile().whenComplete(() => {

                                    // Get.dialog(AlertDialog(
                                    //   actions: [
                                    //     TextButton(
                                    //         onPressed: () {
                                    //           Get.back();
                                    //           _disposeVideoController();
                                    //         },
                                    //         child: Text(
                                    //           "Cancel".tr,
                                    //           style: const TextStyle(
                                    //               fontSize: 16),
                                    //         )),
                                    //     SizedBox(
                                    //       width:
                                    //           MediaQuery.of(context)
                                    //                   .size
                                    //                   .width /
                                    //               2,
                                    //       child: Helper()
                                    //           .customMaterialButton(
                                    //               bName: "Confirm".tr,
                                    //               fSize: 20,
                                    //               context: context,
                                    //               press: () {
                                    //                 Get.back();

                                    //                 uploadFile();

                                    //                 debugPrint(
                                    //                     "String Path $uploadFile");
                                    //               }),
                                    //     )
                                    //   ],
                                    //   content: SizedBox(
                                    //     width: double.infinity,
                                    //     height: double.infinity,
                                    //     child:
                                    //     // _previewVideo(),
                                    //   ),
                                    //   title: Text(
                                    //       "Your uploded  Resume".tr),
                                    // ))
                                    // });
                                  },
                                  // onTap: () async {
                                  //   _pickFile();
                                  //   // var picked =
                                  //   //     await FilePicker.platform.pickFiles();

                                  //   // if (picked != null) {
                                  //   //   debugPrint(picked.files.first.name);
                                  //   // }
                                  // },
                                  child: Container(
                                    height:
                                        MediaQuery.of(context).size.height / 8,
                                    width:
                                        MediaQuery.of(context).size.width / 4,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5)),
                                    child: Card(
                                      color: const Color(0xff41BBFF),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: const [
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Icon(
                                            Icons.upload,
                                            color: Colors.white,
                                            size: 35,
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            "Resume",
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                )),
                          ],
                        ),
                        InkWell(
                          onTap: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: const [
                              Text("Attached File"),
                              SizedBox(
                                width: 5,
                              ),
                              Icon(
                                Icons.attachment,
                                color: textColor,
                              )
                            ],
                          ),
                        ),
                        Helper().customMaterialButton2(
                          bName: "Submit",
                          context: context,
                          fSize: 24,
                          fweight: FontWeight.w500,
                          press: () {
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => const DoneScreen()));
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> _disposeVideoController() async {
    /*  if (_toBeDisposed != null) {
      await _toBeDisposed!.dispose();
    }
    toBeDisposed = controller;*/
    if (_controller != null) {
      await _controller.dispose();
    }
    _controller = null;
  }
}

class VideoPlayerApp extends StatelessWidget {
  const VideoPlayerApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'GeeksForGeeks',
      home: VideoPlayerScreen(),
    );
  }
}

class VideoPlayerScreen extends StatefulWidget {
  const VideoPlayerScreen({Key key}) : super(key: key);

  @override
// ignore: library_private_types_in_public_api
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  VideoPlayerController _controller;
  Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    _controller = VideoPlayerController.network(
      'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
    );
    _initializeVideoPlayerFuture = _controller.initialize();

    _controller.setLooping(true);

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Online iExam'),
        backgroundColor: textColor,
      ),
      body: FutureBuilder(
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
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            // pause
            if (_controller.value.isPlaying) {
              _controller.pause();
            } else {
              // play
              _controller.play();
            }
          });
        },
        // icon
        child: Icon(
          _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ),
    );
  }
}

class AspectRatioVideo extends StatefulWidget {
  const AspectRatioVideo(this.controller);

  final VideoPlayerController controller;

  @override
  AspectRatioVideoState createState() => AspectRatioVideoState();
}

class AspectRatioVideoState extends State<AspectRatioVideo> {
  VideoPlayerController get controller => widget.controller;
  bool initialized = false;

  void _onVideoControllerUpdate() {
    if (!mounted) {
      return;
    }
    if (initialized != controller.value.isInitialized) {
      initialized = controller.value.isInitialized;
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    controller.addListener(_onVideoControllerUpdate);
  }

  @override
  void dispose() {
    controller.removeListener(_onVideoControllerUpdate);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (initialized) {
      return Center(
        child: AspectRatio(
          aspectRatio: controller.value.aspectRatio,
          child: VideoPlayer(controller),
        ),
      );
    } else {
      return Container();
    }
  }
}
