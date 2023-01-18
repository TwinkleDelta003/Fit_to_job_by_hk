import 'package:fit_to_job/API/Controller/question_controller.dart';
import 'package:fit_to_job/API/Model/result_model.dart';
import 'package:fit_to_job/Screens/CommonScreen/questionresult_screen.dart';
import 'package:fit_to_job/Screens/Constant/Colorpath.dart';
import 'package:fit_to_job/Screens/Constant/imagePath.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Constant/responsive.dart';
import '../Widgets/hepler.dart';

class ResultScreen extends StatefulWidget {
  @override
  State<ResultScreen> createState() => ResultScreenState();
}

class ResultScreenState extends State<ResultScreen> {
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

  String testId = "";
  String examScheduleId = "";
  String subId = "";
  String subName = "";
  String totalExamTime = "";
  String insertedByUserId = "";
  @override
  void initState() {
    getUserId();
    testId = data[0];
    examScheduleId = data[1];
    subId = data[2];
    subName = data[3];
    totalExamTime = data[4];
    super.initState();
  }

  var data = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 237, 255, 251),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color.fromARGB(255, 237, 255, 251),
        leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Color(0xff018F89),
            ),
            onPressed: () => Get.back()),
        title: Padding(
          padding: const EdgeInsets.only(right: 120.0),
          child: Text(
            firstName.toString(),
            style: const TextStyle(
                color: Color(0xff1AA19A),
                fontSize: 24,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
        FutureBuilder(
            future: resultAPI(
              ExamScheduleId: data[1],
              RegistrationId: registrationId.toString(),
              Subject: data[3],
              IsJeeNeet: "",
              TestId: data[0],
              // RegistrationId: "a810b1d7-d914-4c1d-8297-f187f238b009",
              // TestId: "cf1908af-4440-4efa-806f-2dc92273881a",
              // ExamScheduleId: "97537d16-4658-45a9-8318-25f73af87b57",
              // Subject: "Lath Operator",
              // IsJeeNeet: "",
              /////////////
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
                  height: MediaQuery.of(context).size.height / 1,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                      itemCount: snapshot.data.result.length,
                      itemBuilder: (context, index) {
                        var list = snapshot.data.result[index];
                        return _resultUI(model: ResultModel1(result: [list]));
                      }),
                );
              }
            }),
          ],
        ),
      ),
    );
  }

  _resultUI({ResultModel1 model}) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              "Result:   " + model.result[0].testName,
              style: TextStyle(
                  color: textColor, fontWeight: FontWeight.w600, fontSize: 20),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Question Wise Analysis",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                SizedBox(
                  width: 25,
                ),
                customAssetPath(imagePath: result, size: 60),
                SizedBox(
                  width: 25,
                ),
                Column(
                  children: [
                    Text(
                      "View Question By Question Analysis\n Provided With Exaplation!",
                      style: TextStyle(fontSize: 14),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 2.7,
                      height: MediaQuery.of(context).size.height / 18,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          gradient: const LinearGradient(
                            colors: [
                              Color(0xff00716C),
                              Color.fromARGB(255, 18, 206, 196)
                            ],
                          )),
                      child: MaterialButton(
                        elevation: 4,
                        onPressed: () {
                          Get.to(() => const Questionresult(), arguments: [
                            testId,
                            examScheduleId,
                            subId,
                            subName,
                            totalExamTime,
                            registrationId,
                            model.result[0].totalQuestions
                          ]);
                        },
                        child: const Text(
                          "Explore",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Total Question Summary",
              style: TextStyle(
                  color: Color.fromARGB(255, 48, 47, 47),
                  fontWeight: FontWeight.w600,
                  fontSize: 16),
            ),
          ),
          Column(
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                          height: 60,
                          child: CircleAvatar(
                            backgroundColor: Colors.green,
                            child: Center(
                              child: Text(
                                model.result[0].totalAnswered,
                                style: const TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.normal),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text("Answered",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 18,
                                color: Color(0xff1AA19A),
                                fontWeight: FontWeight.normal)),
                      ],
                    ),
                  ),
                  Expanded(
                      flex: 1,
                      child: Row(
                        children: [
                          SizedBox(
                            height: 60,
                            child: CircleAvatar(
                              backgroundColor: Colors.yellow,
                              child: Center(
                                child: Text(
                                  model.result[0].totalSkipped,
                                  style: const TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text("Not Skipped",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Color(0xff1AA19A),
                                  fontWeight: FontWeight.normal)),
                        ],
                      )),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                          height: 60,
                          child: CircleAvatar(
                            backgroundColor: const Color(0Xffacacac),
                            child: Center(
                              child: Text(
                                model.result[0].totalNotVisited,
                                style: const TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.normal),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text("Not Visited",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 18,
                                color: Color(0xff1AA19A),
                                fontWeight: FontWeight.normal)),
                      ],
                    ),
                  ),
                  Expanded(
                      flex: 1,
                      child: Row(
                        children: [
                          SizedBox(
                            height: 60,
                            child: CircleAvatar(
                              backgroundColor: const Color(0Xff283593),
                              child: Center(
                                child: Text(
                                  model.result[0].totalMarkedforReview,
                                  style: const TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                      fontWeight: FontWeight.normal),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text("Mark For Review",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Color(0xff1AA19A),
                                  fontWeight: FontWeight.normal)),
                        ],
                      )),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Subject Wise Summary",
              style: TextStyle(
                  color: Color.fromARGB(255, 48, 47, 47),
                  fontWeight: FontWeight.w600,
                  fontSize: 18),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: textColor,
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0xff00716C),
                      blurRadius: 2.0,
                      spreadRadius: 0.0,
                      offset: Offset(2.0, 2.0),
                    )
                  ],
                ),
                height: SizeConfig.screenHeight,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: Column(
                    children: [
                      Text(model.result[0].subject,
                          style: const TextStyle(
                              fontSize: 24,
                              color: Colors.white,
                              fontWeight: FontWeight.w700)),
                      const Divider(color: Colors.white, thickness: 1),
                      Row(
                        children: [
                          SizedBox(
                              height: MediaQuery.of(context).size.height / 9,
                              width: MediaQuery.of(context).size.width / 3.2,
                              child: Card(
                                  child: Column(
                                children: [
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(model.result[0].totalMarks,
                                      style: const TextStyle(
                                          color: textColor,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 20)),
                                  const Text(
                                    "Total Marks",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16),
                                  ),
                                ],
                              ))),
                          SizedBox(
                              height: MediaQuery.of(context).size.height / 9,
                              width: MediaQuery.of(context).size.width / 3.2,
                              child: Card(
                                  child: Column(
                                children: [
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(model.result[0].totalQuestions,
                                      style: const TextStyle(
                                          color: textColor,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 20)),
                                  const Text(
                                    "Total Question",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16),
                                  ),
                                ],
                              ))),
                          SizedBox(
                              height: MediaQuery.of(context).size.height / 9,
                              width: MediaQuery.of(context).size.width / 3.2,
                              child: Card(
                                  child: Column(
                                children: [
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(model.result[0].totalObtainedMarks,
                                      style: const TextStyle(
                                          color: textColor,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 20)),
                                  const Text(
                                    "Got Marks",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16),
                                  ),
                                ],
                              ))),
                        ],
                      ),
                      ListTile(
                          title: const Text(
                            "Answered",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          trailing: Text(
                            model.result[0].totalAnswered,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          )),
                      ListTile(
                          title: const Text(
                            "Not Answered",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          trailing: Text(
                            model.result[0].noOfUnAttemptedQuestions,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          )),
                      ListTile(
                          title: const Text(
                            "Marked for Review",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          trailing: Text(
                            model.result[0].totalMarkedforReview,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          )),
                      ListTile(
                        title: const Text(
                          "Skipped",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        trailing: Text(
                          model.result[0].totalSkipped,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                )),
          ),
          SizedBox(
            height: 60,
          )
        ],
      ),
    );
  }
}
