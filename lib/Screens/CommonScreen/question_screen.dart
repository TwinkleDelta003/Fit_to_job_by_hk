import 'package:fit_to_job/API/Model/view_summary.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'dart:async';
import '../../API/Controller/question_controller.dart';
import '../../API/Model/question_model.dart';
import '../Constant/Colorpath.dart';
import '../Constant/responsive.dart';
import '../Widgets/hepler.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({Key key}) : super(key: key);

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  int activeIndex = 0;
  int lengthofQue = 0;
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

  DateTime start;
  void addDuration() async {
    start = DateTime.now().add(Duration(minutes: totalMins1));
  }

  void apiSubmitExam() async {
    finalsubmitAPI(
        ExamScheduleId: data[1],
        InsertedByUserId: data[1],
        RegistrationId: data[5],
        StopLat: "0.00",
        StopLong: "0.00",
        context: context);
  }

  int totalMins = 0;
  int totalMins1 = 0;

  var data = Get.arguments;

  String testId = "";
  static String examScheduleId = "";
  static String subId = "";
  static String subName = "";
  static String totalExamTime = "";
  static String insertedByUserId = "";
  static PageController controller = PageController();
  final List<Widget> _list = <Widget>[
    const Center(
        child: Text(
      "Page 1",
    )),
    const Center(
        child: Text(
      "Page 2",
    )),
    const Center(
        child: Text(
      "Page 3",
    )),
    const Center(
        child: Text(
      "Page 4",
    )),
  ];
  int _curr = 0;

  int marks = 0;
  int i = 1;
  bool disableAnswer = false;

  int count1 = 0;
  int count2 = 0;
  int count3 = 0;
  int count4 = 0;
  int count5 = 0;

  String minutes = "";
  String seconds = "";

  String group;

  // void _answerQuestion() {
  //   setState(() {
  //     activeIndex = activeIndex + 1;
  //   });

  //   print(activeIndex);
  //   if (activeIndex < lengthofQue) {
  //   } else {}
  // }

  final _controller = CarouselController();
  void next() => _controller.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.ease,
      );
  void previous() => _controller.previousPage(
      duration: const Duration(milliseconds: 500), curve: Curves.ease);
  var data1;
  @override
  void initState() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      totalMins > 0;

      setState(() {
        _start--;
      });
    });
    // _answerQuestion();
    getUserId();
    addDuration();
    testId = data[0];
    examScheduleId = data[1];
    subId = data[2];
    subName = data[3];
    totalExamTime = data[4];
    super.initState();
    questionListAPI(
            TestId: testId,
            ExamScheduleId: examScheduleId,
            RegistrationId: data[5])
        .then((value) => {
              if (value.status == "200")
                {
                  setState(() {
                    lengthofQue = value.result.length;
                    totalMins = int.parse(value.result[0].totalMins);
                    _start = int.parse(value.result[0].totalMins);
                    totalMins1 = int.parse(value.result[0].totalMins);
                    _convertHS = int.parse(totalExamTime);
                    DateTime start = DateTime.now().add(Duration(
                        // hours: _convertHS,
                        minutes: totalMins1
                        //  minutes: 60 // Remove This minutes from data
                        ));

                    print(getRemainingTime(start));
                    getRemainingTime(start);
                    addDuration();
                  }),
                }
              //     for (i = 1; i < value.result.length; i++)
              //       {

              //       }
              //   }
              // else
              //   {print("No For Loop")}
            });
  }

  bool isSelected = false;
  Timer _timer;
  static int _start = 0;
  // static int _convertHS = 0;
  // int _start = 0;
  int _convertHS;
  int start1;
  String hhmmss = "";

  String getRemainingTime(DateTime start) {
    DateTime now = DateTime.now();
    var diff = start.difference(now);
    if (diff.inSeconds <= 0) {
      Future.delayed(Duration(seconds: 2), () {
        return "Time Over";
        // print("This is the computation to be performed.");
      });
      // return "Time Over";
    }
    int hours = diff.inHours;
    int minutes = diff.inMinutes % 60;
    int seconds = diff.inSeconds % 60;
    // print(hours);
    // print("$hours:$minutes:$seconds");
    return "$hours:$minutes:$seconds";
  }

  // overriding the setstate function to be called only if mounted
  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  String gender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF6FFFD),
      appBar: AppBar(
        backgroundColor: const Color(0xffF6FFFD),
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Color(0xff018F89),
            ),
            onPressed: () => Get.back()),
        title: Text(
          "Welcome  $firstName",
          style: const TextStyle(
              color: Color(0xff1AA19A),
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              child: _timeLeft(),
              onTap: () {},
            ),

            const Divider(
              color: Colors.black,
            ),
            _subAndViewSummary(),
            const SizedBox(
              height: 20,
            ),
            Container(
              alignment: Alignment.center,
              child: const Text(
                "Question : ",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const Divider(
              color: Colors.black,
            ),
            FutureBuilder<QuestionModel>(
                future: questionListAPI(
                  TestId: testId,
                  ExamScheduleId: examScheduleId,
                  RegistrationId: registrationId,
                  // activeIndex: activeIndex,
                ),
                builder: (context, snapshot) {
                  if (snapshot.data == null) {
                    return Center(
                        child: Center(
                            child:
                                snapshot.connectionState != ConnectionState.done
                                    ? const CircularProgressIndicator()
                                    : Helper().customText(
                                        text: "No Data Found", fontSize: 20)));
                  } else {
                    return SizedBox(
                        height: MediaQuery.of(context).size.height / 1.5,
                        width: MediaQuery.of(context).size.width,
                        child: CarouselSlider.builder(
                          carouselController: _controller,
                          itemCount: snapshot.data.result.length,
                          itemBuilder: (context, index, realIndex) {
                            var list = snapshot.data.result[index];
                            return queUI(
                                model: QuestionModel(result: [list]),
                                itemL: snapshot.data.result.length,
                                length: index);
                          },
                          options: CarouselOptions(
                            scrollPhysics: const NeverScrollableScrollPhysics(),
                            height: MediaQuery.of(context).size.height / 1.2,
                            autoPlay: false,
                            viewportFraction: 1,
                            enlargeCenterPage: true,
                            enlargeStrategy: CenterPageEnlargeStrategy.height,
                            onPageChanged: (index, reason) => setState(() {
                              activeIndex = index;
                            }),
                          ),
                        )

                        //  ListView.builder(
                        //     itemCount: 1,
                        //     itemBuilder: (context, index) {
                        //       var list = snapshot.data.result[index];
                        //       return queUI(
                        //         model: QuestionModel(result: [list]),
                        //       );
                        //     }),
                        );
                  }
                }),

            // _showData(),
            //_pageViewver(),

            const SizedBox(
              height: 20,
            ),
            // _skipReviewNextBtn(),
          ],
        ),
      ),
    );
  }

  Widget queUI({QuestionModel model, int length, int itemL}) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text(
                  model.result[0].queNo,
                  style: const TextStyle(
                      color: textColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text(
                  model.result[0].question,
                  style: const TextStyle(
                      color: textColor,
                      fontSize: 22,
                      fontWeight: FontWeight.w600),
                ),
              )
            ],
          ),
          model.result[0].perQuestionTime == "False"
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: SizeConfig.screenHeight,
                    child: Card(
                      
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      color:  gender == model.result[0].a1 ? Color.fromARGB(255, 198, 229, 255): Colors.white,
                      child: ListTile(
                        title: Text(model.result[0].a1),
                        leading: Radio(
                          value: model.result[0].a1,
                          groupValue: gender,
                          onChanged: (value) async {
                            SharedPreferences prefs = await SharedPreferences.getInstance();
                            prefs.setString('gender',value);
                            setState(() {
                              gender = model.result[0].a1.toString();
                            });
                          },
                          // activeColor: gender == model.result[0].a1 ? Colors.blue: Colors.grey,
                        ),
                      ),
                    ),
                  ))
              : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: SizeConfig.screenHeight,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      color:gender == model.result[0].a1 ? Color.fromARGB(255, 198, 229, 255): Colors.white,
                      child: ListTile(
                        title: Text(model.result[0].a1),
                        leading: Radio(
                            value: model.result[0].a1,
                            groupValue: gender,
                            onChanged: (value) {
                              setState(() {
                                // gender = value.toString();
                              });
                            }),
                      ),
                    ),
                  )),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: SizeConfig.screenHeight,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  color: gender == model.result[0].a2 ? Color.fromARGB(255, 198, 229, 255): Colors.white,
                  child: ListTile(
                    title: Text(model.result[0].a2),
                    leading: InkWell(
                      child: Radio(
                          value: model.result[0].a2,
                          groupValue: gender,
                          onChanged: (value) {
                            setState(() {
                              gender = value.toString();
                            });
                          }),
                    ),
                  ),
                ),
              )),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: SizeConfig.screenHeight,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  color: gender == model.result[0].a3 ? Color.fromARGB(255, 198, 229, 255): Colors.white,
                  child: ListTile(
                    title: Text(model.result[0].a3),
                    leading: Radio(
                        value: model.result[0].a3,
                        groupValue: gender,
                        onChanged: (value) {
                          setState(() {
                            gender = value.toString();
                          });
                        }),
                  ),
                ),
              )),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: SizeConfig.screenHeight,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  color: gender == model.result[0].a4 ? Color.fromARGB(255, 198, 229, 255): Colors.white,
                  child: InkWell(
                    onTap: (() {
                      debugPrint(gender);
                    }),
                    child: ListTile(
                      title: Text(model.result[0].a4),
                      leading: Radio(
                          value: model.result[0].a4[0],
                          groupValue: gender,
                          onChanged: (value) {
                            setState(() {
                              gender = value.toString();
                            });
                          }),
                    ),
                  ),
                ),
              )),
          Row(
            children: [
              Expanded(
                  flex: 1,
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: const LinearGradient(
                          colors: [Color(0Xffc6a700), Color(0Xffffff6b)],
                        )),
                    child: MaterialButton(
                      elevation: 4,
                      onPressed: () {
                        activeIndex == itemL - 1
                            ? showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    content: Text(
                                      "You have answered all Question for " +
                                          data[3],
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: textColor,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    actions: <Widget>[
                                      FlatButton(
                                        child: Text('Close'),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      )
                                    ],
                                  );
                                },
                              )
                            : next();
                        insertAPI(
                          QueId: model.result[0].queId,
                          ExamScheduleId: examScheduleId,
                          TestId: testId,
                          InsertedByUserId: registrationId,
                          SubId: subId,
                          IsJeeNeet: "True",
                          RegistrationId: registrationId,
                          Ans: "SKIPPED",
                          QueType: model.result[0].queType,
                          AnsStatus: "",
                        );
                        activeIndex == itemL - 1
                            ? gender
                            : setState(() {
                                gender = null;
                              });
                      },
                      child: const Text(
                        "Skip",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  )),
              const SizedBox(
                width: 5,
              ),
              Expanded(
                  flex: 1,
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: const LinearGradient(
                          colors: [
                            Color.fromARGB(255, 96, 96, 184),
                            Color.fromARGB(255, 168, 173, 201)
                          ],
                        )),
                    child: MaterialButton(
                      elevation: 4,
                      onPressed: () {
                        activeIndex == itemL - 1
                            ? showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    content: Text(
                                      "You have answered all Question for " +
                                          data[3],
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: textColor,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    actions: <Widget>[
                                      FlatButton(
                                        child: Text('Close'),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      )
                                    ],
                                  );
                                },
                              )
                            : next();
                        insertAPI(
                            QueId: model.result[0].queId,
                            ExamScheduleId: examScheduleId,
                            TestId: testId,
                            InsertedByUserId: registrationId,
                            SubId: subId,
                            IsJeeNeet: "True",
                            RegistrationId: registrationId,
                            Ans: "SKIPPED",
                            QueType: model.result[0].queType,
                            AnsStatus: "REVIEW");
                        activeIndex == itemL - 1
                            ? gender
                            : setState(() {
                                gender = null;
                              });
                      },
                      child: const Text(
                        "Mark Review",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  )),
              const SizedBox(
                width: 5,
              ),
              Expanded(
                  flex: 1,
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: const LinearGradient(
                          colors: [
                            Color.fromARGB(255, 39, 180, 49),
                            Color.fromARGB(255, 159, 201, 157)
                          ],
                        )),
                    child: MaterialButton(
                      elevation: 4,
                      onPressed: () {
                        activeIndex == itemL - 1
                            ? _modalBottomSheetsubmitSummary()
                            : next();
                        insertAPI(
                            QueId: model.result[0].queId,
                            ExamScheduleId: examScheduleId,
                            TestId: testId,
                            InsertedByUserId: registrationId,
                            SubId: subId,
                            IsJeeNeet: "True",
                            RegistrationId: registrationId,
                            Ans: gender,
                            QueType: model.result[0].queType,
                            AnsStatus: "");

                        setState(() {
                          gender = null;
                        });
                      },
                      child: Text(
                        activeIndex == itemL - 1 ? "Submit" : "Next",
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  )),
            ],
          )
        ],
      ),
    );
  }

  Widget _timeLeft() {
    return Row(
      children: [
        const SizedBox(
          width: 10,
        ),
        Expanded(
            flex: 1,
            child: InkWell(
              child: Text(
                "Left Time:${getRemainingTime(start)}",
                style: const TextStyle(
                    color: Color(0xff1AA19A),
                    fontSize: 15,
                    fontWeight: FontWeight.normal),
              ),
            )),
        Expanded(
            flex: 1,
            child: Container(
              height: 30,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: const LinearGradient(
                    colors: [Color(0Xff005005), Color(0Xff60ad5e)],
                  )),
              child: MaterialButton(
                elevation: 4,
                onPressed: () async {
                  _modalBottomSheetsubmitSummary();
                },
                child: const Text(
                  "Submit & End Exam",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ),
            )),
        const SizedBox(
          width: 10,
        ),
      ],
    );
  }

  _modalBottomSheetsubmitSummary() {
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
            return Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(35.0),
                  child: Text(
                    "Once you Submit exam, you are not able to change answer, are you sure Want to final submit exam?",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 1.4,
                      height: MediaQuery.of(context).size.height / 16,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          gradient: const LinearGradient(
                            colors: [Color(0Xffc6a700), Color(0Xffffff6b)],
                          )),
                      child: MaterialButton(
                        elevation: 4,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          "Cancel",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 1.4,
                      height: MediaQuery.of(context).size.height / 16,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          gradient: const LinearGradient(
                            colors: [Color(0Xff5f5fc4), Color(0Xff001064)],
                          )),
                      child: MaterialButton(
                        elevation: 4,
                        onPressed: () {
                          apiSubmitExam();
                          // finalsubmitAPI(
                          //   ExamScheduleId: data[1],
                          //   InsertedByUserId: data[1],
                          //   RegistrationId: data[5],
                          //   StopLat: "0.00",
                          //   StopLong: "0.00",
                          // );
                        },
                        child: Text(
                          "Finish",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            );
          });
    });
  }

//   Widget _finalsubmitUI(Finalsubmitmodel model) {
// return Text("ṅ");
//   }

  Widget _subAndViewSummary() {
    return Row(
      children: [
        const SizedBox(
          width: 10,
        ),
        Expanded(
            flex: 1,
            child: Container(
              //width: MediaQuery.of(context).size.width / 1.2,
              height: 30,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: const LinearGradient(
                    colors: [btnColor1, btnColor2],
                  )),
              child: MaterialButton(
                elevation: 4,
                onPressed: () {},
                child: Text(
                  //  designation,
                  data[3],
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ),
            )),
        const SizedBox(
          width: 10,
        ),
        Expanded(
            flex: 1,
            child: Container(
              height: 30,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  gradient: const LinearGradient(
                    colors: [Color(0Xff5f5fc4), Color(0Xff001064)],
                  )),
              child: MaterialButton(
                elevation: 4,
                onPressed: () async {
                  _modalBottomSheetViewSummary();
                },
                child: const Text(
                  "View Summary",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ),
            )),
        const SizedBox(
          width: 10,
        ),
      ],
    );
  }

  Widget _pageViewver() {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 1.8,
      child: PageView(
        controller: controller,
        scrollDirection: Axis.horizontal,
        onPageChanged: (num) {
          setState(() {
            _curr = num;
          });
        },
        children: _list,
      ),
    );
    /*return PageView(
      controller: controller,
      children: _list,
      scrollDirection: Axis.horizontal,
      onPageChanged: (num) {
        setState(() {
          _curr = num;
        });
      },
    );*/
  }

  Widget _skipReviewNextBtn() {
    return Row(
      children: [
        const SizedBox(
          width: 10,
        ),
        Expanded(
            flex: 1,
            child: Container(
              height: 30,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  gradient: const LinearGradient(
                    colors: [Color(0Xffc6a700), Color(0Xffffff6b)],
                  )),
              child: MaterialButton(
                elevation: 4,
                onPressed: () {},
                child: const Text(
                  "Skip",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ),
            )),
        const SizedBox(
          width: 10,
        ),
        Expanded(
            flex: 1,
            child: Container(
              //width: MediaQuery.of(context).size.width / 1.2,
              height: 30,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  gradient: const LinearGradient(
                    colors: [Color(0Xff5f5fc4), Color(0Xff001064)],
                  )),
              child: MaterialButton(
                elevation: 4,
                onPressed: () {},
                child: const Text(
                  "Mark Review",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ),
            )),
        const SizedBox(
          width: 10,
        ),
        Expanded(
            flex: 1,
            child: Container(
              //width: MediaQuery.of(context).size.width / 1.2,
              height: 30,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  gradient: const LinearGradient(
                    colors: [
                      Color.fromARGB(255, 22, 163, 32),
                      Color(0Xff60ad5e)
                    ],
                  )),
              child: MaterialButton(
                elevation: 4,
                onPressed: () {},
                child: const Text(
                  "Next",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ),
            )),
        const SizedBox(
          width: 10,
        ),
      ],
    );
  }

  _modalBottomSheetViewSummary() {
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
                child: FutureBuilder(
                    future: viewSummaryAPI(
                      SubId: subId,
                      TestId: testId,
                      ExamScheduleId: examScheduleId,
                      RegistrationId: registrationId.toString(),
                      IsJeeNeet: "",
                    ),
                    builder: (context, snapshot) {
                      if (snapshot.data == null) {
                        return Center(
                            child: Center(
                                child: snapshot.connectionState !=
                                        ConnectionState.done
                                    ? const CircularProgressIndicator()
                                    : Helper().customText(
                                        text: "No Data Found", fontSize: 20)));
                      } else {
                        return SizedBox(
                          height: MediaQuery.of(context).size.height / 2,
                          width: MediaQuery.of(context).size.width,
                          child: ListView.builder(
                              //itemCount: snapshot.data.result.length,
                              itemCount: snapshot.data.result.length,
                              itemBuilder: (context, index) {
                                var list = snapshot.data.result[index];
                                return Container(
                                  child: _viewSummaryUI(
                                      model: ViewSummaryModel(result: [list])),
                                );
                              }),
                        );
                      }
                    }));
          });
    });
  }

  _viewSummaryUI({ViewSummaryModel model}) {
    if (model.result[0].queType == 1) {
      count1 = count1 + 1;
    }

    if (model.result[0].queType == 2) {
      count2 = count2 + 1;
    }

    if (model.result[0].queType == 3) {
      count3 = count3 + 1;
    }

    if (model.result[0].queType == 4) {
      count4 = count4 + 1;
    }

    if (model.result[0].queType == 5) {
      count5 = count5 + 1;
    }

    return SingleChildScrollView(
      child: Column(
        children: [
          // Container(
          //   margin: const EdgeInsets.only(top: 10),
          //   alignment: Alignment.center,
          //   decoration: BoxDecoration(
          //       borderRadius: BorderRadius.circular(10),
          //       color: const Color(0xff1AA19A)),
          //   width: 100,
          //   height: 10,
          // ),
          const SizedBox(
            height: 10,
          ),
          Text(model.result[0].queNo + model.result[0].queType,
              style: const TextStyle(
                  fontSize: 20,
                  color: Color(0xff1AA19A),
                  fontWeight: FontWeight.w500)),
          const SizedBox(
            height: 10,
          ),
          const Divider(
            color: Colors.black,
          ),
          const SizedBox(
            height: 10,
          ),
          // const Text("Summary",
          //     style: TextStyle(
          //         fontSize: 20,
          //         color: Color(0xff1AA19A),
          //         fontWeight: FontWeight.normal)),
          // Column(
          //   children: [
          //     Row(
          //       children: [
          //         Expanded(
          //           flex: 1,
          //           child: Row(
          //             children: [
          //               const SizedBox(
          //                 width: 10,
          //               ),
          //               SizedBox(
          //                 height: 60,
          //                 child: CircleAvatar(
          //                   backgroundColor: Colors.green,
          //                   child: Center(
          //                     child: Text(
          //                       count1.toString(),
          //                       style: const TextStyle(
          //                           fontSize: 18,
          //                           color: Colors.white,
          //                           fontWeight: FontWeight.normal),
          //                     ),
          //                   ),
          //                 ),
          //               ),
          //               const SizedBox(
          //                 width: 10,
          //               ),
          //               const Text("Answered",
          //                   textAlign: TextAlign.center,
          //                   style: TextStyle(
          //                       fontSize: 18,
          //                       color: Color(0xff1AA19A),
          //                       fontWeight: FontWeight.normal)),
          //             ],
          //           ),
          //         ),
          //         Expanded(
          //             flex: 1,
          //             child: Row(
          //               children: [
          //                 SizedBox(
          //                   height: 60,
          //                   child: CircleAvatar(
          //                     backgroundColor: Colors.yellow,
          //                     child: Center(
          //                       child: Text(
          //                         count2.toString(),
          //                         style: const TextStyle(
          //                             fontSize: 18,
          //                             color: Colors.black,
          //                             fontWeight: FontWeight.normal),
          //                       ),
          //                     ),
          //                   ),
          //                 ),
          //                 const SizedBox(
          //                   width: 10,
          //                 ),
          //                 const Text("Skipped",
          //                     textAlign: TextAlign.center,
          //                     style: TextStyle(
          //                         fontSize: 18,
          //                         color: Color(0xff1AA19A),
          //                         fontWeight: FontWeight.normal)),
          //               ],
          //             )),
          //       ],
          //     ),
          //     const SizedBox(
          //       height: 10,
          //     ),
          //     Row(
          //       children: [
          //         Expanded(
          //           flex: 1,
          //           child: Row(
          //             children: [
          //               const SizedBox(
          //                 width: 10,
          //               ),
          //               SizedBox(
          //                 height: 60,
          //                 child: CircleAvatar(
          //                   backgroundColor: const Color(0Xffacacac),
          //                   child: Center(
          //                     child: Text(
          //                       count3.toString(),
          //                       style: const TextStyle(
          //                           fontSize: 18,
          //                           color: Colors.white,
          //                           fontWeight: FontWeight.normal),
          //                     ),
          //                   ),
          //                 ),
          //               ),
          //               const SizedBox(
          //                 width: 10,
          //               ),
          //               const Text("Not Visited",
          //                   textAlign: TextAlign.center,
          //                   style: TextStyle(
          //                       fontSize: 18,
          //                       color: Color(0xff1AA19A),
          //                       fontWeight: FontWeight.normal)),
          //             ],
          //           ),
          //         ),
          //         Expanded(
          //             flex: 1,
          //             child: Row(
          //               children: [
          //                 SizedBox(
          //                   height: 60,
          //                   child: CircleAvatar(
          //                     backgroundColor: const Color(0Xff283593),
          //                     child: Center(
          //                       child: Text(
          //                         count4.toString(),
          //                         style: const TextStyle(
          //                             fontSize: 18,
          //                             color: Colors.black,
          //                             fontWeight: FontWeight.normal),
          //                       ),
          //                     ),
          //                   ),
          //                 ),
          //                 const SizedBox(
          //                   width: 10,
          //                 ),
          //                 const Text("Mark Review",
          //                     textAlign: TextAlign.center,
          //                     style: TextStyle(
          //                         fontSize: 18,
          //                         color: Color(0xff1AA19A),
          //                         fontWeight: FontWeight.normal)),
          //               ],
          //             )),
          //       ],
          //     ),
          //   ],
          // ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }

  _questionAndAmswerListShow() {
    return Column(
      children: const [
        SizedBox(
          height: 10,
        ),
        Text("Question Show",
            style: TextStyle(
                fontSize: 20,
                color: Color(0xff1AA19A),
                fontWeight: FontWeight.w500)),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }

  Widget radioButtonUI() {
    return ListTile(
      title: const Text(
        "Value Text",
        style: TextStyle(
            color: Color(0xffb5b3dc),
            fontWeight: FontWeight.w500,
            fontSize: 15),
      ),
      leading: Radio(
          value: "Value Radio",
          groupValue: group,
          activeColor: const Color(0xff2A2866),
          onChanged: (value) {
            setState(() {
              group = value.toString();
            });
          }),
    );
  }
}

// /GetSubjectWiseQnList.aspx



//   Widget _showData() {
//     return Container(
//       padding: const EdgeInsets.all(10.0),
//       //height: MediaQuery.of(context).size.height / 1.8,
//       child: _questionIndex < _questions.length
//           ? Quiz(
//               answerQuestion: _answerQuestion,
//               questionIndex: _questionIndex,
//               questions: _questions,
//             ) //Quiz
//           : ResultScreen(_totalScore, _resetQuiz),
//     );
//   }
// }

// class MyApp extends StatefulWidget {
//   final List<Map<String, Object>> questions;
//   final int questionIndex;
//   final Function answerQuestion;
//   final String Question;

//   const MyApp({
//     Key key,
//     this.questions,
//     this.answerQuestion,
//     this.questionIndex,
//     this.Question,
//   }) : super(key: key);

//   @override
//   State<StatefulWidget> createState() {
//     return _MyAppState();
//   }
// }

// class _MyAppState extends State<MyApp> {
//   final _questions = const [
//     {
//       'questionText': 'Q1. Who created Flutter?',
//       'answers': [
//         {'text': 'Facebook', 'score': -2},
//         {'text': 'Adobe', 'score': -2},
//         {'text': 'Google', 'score': 10},
//         {'text': 'Microsoft', 'score': -2},
//       ],
//     },
//     {
//       'questionText': 'Q2. What is Flutter?',
//       'answers': [
//         {'text': 'Android Development Kit', 'score': -2},
//         {'text': 'IOS Development Kit', 'score': -2},
//         {'text': 'Web Development Kit', 'score': -2},
//         {
//           'text':
//               'SDK to build beautiful IOS, Android, Web & Desktop Native Apps',
//           'score': 10
//         },
//       ],
//     },
//     {
//       'questionText': ' Q3. Which programing language is used by Flutter',
//       'answers': [
//         {'text': 'Ruby', 'score': -2},
//         {'text': 'Dart', 'score': 10},
//         {'text': 'C++', 'score': -2},
//         {'text': 'Kotlin', 'score': -2},
//       ],
//     },
//     {
//       'questionText': 'Q4. Who created Dart programing language?',
//       'answers': [
//         {'text': 'Lars Bak and Kasper Lund', 'score': 10},
//         {'text': 'Brendan Eich', 'score': -2},
//         {'text': 'Bjarne Stroustrup', 'score': -2},
//         {'text': 'Jeremy Ashkenas', 'score': -2},
//       ],
//     },
//     {
//       'questionText':
//           'Q5. Is Flutter for Web and Desktop available in stable version?',
//       'answers': [
//         {
//           'text': 'Yes',
//           'score': -2,
//         },
//         {'text': 'No', 'score': 10},
//       ],
//     },
//   ];

//   var _questionIndex = 0;
//   var _totalScore = 0;

//   void _resetQuiz() {
//     setState(() {
//       _questionIndex = 0;
//       _totalScore = 0;
//     });
//   }

//   void _answerQuestion(int score) {
//     _totalScore += score;

//     setState(() {
//       _questionIndex = _questionIndex + 1;
//     });
//     // ignore: avoid_print
//     print(_questionIndex);
//     if (_questionIndex < _questions.length) {
//       // ignore: avoid_print
//       print('We have more questions!');
//     } else {
//       // ignore: avoid_print
//       print('No more questions!');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Geeks for Geeks'),
//           backgroundColor: const Color(0xFF00E676),
//         ),
//         body: Padding(
//             padding: const EdgeInsets.all(30.0),
//             child: _questionIndex < _questions.length
//                 ? Quiz(
//                     answerQuestion: _answerQuestion,
//                     questionIndex: _questionIndex,
//                     questions: _questions,
//                   ) //Quiz
//                 : null
//             // Result(_totalScore, _resetQuiz),
//             ), //Padding
//       ), //Scaffold
//       debugShowCheckedModeBanner: false,
//     ); //MaterialApp
//   }
// }
