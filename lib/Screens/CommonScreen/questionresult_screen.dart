import 'package:carousel_slider/carousel_slider.dart';
import 'package:fit_to_job/API/Model/questionresult_model.dart';
import 'package:fit_to_job/Screens/Constant/Colorpath.dart';
import 'package:fit_to_job/Screens/Constant/responsive.dart';
import 'package:fit_to_job/Screens/Widgets/hepler.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../API/Controller/question_controller.dart';
import '../../API/Model/question_model.dart';

class Questionresult extends StatefulWidget {
  const Questionresult({Key key}) : super(key: key);

  @override
  State<Questionresult> createState() => _QuestionresultState();
}

class _QuestionresultState extends State<Questionresult> {
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

  @override
  void initState() {
    getUserId();
    print(activeIndex);
    super.initState();
  }

  String gender;
  int activeIndex = 0;
  final _controller = CarouselController();
  var data = Get.arguments;
  void next() => _controller.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.ease,
      );
  void previous() => _controller.previousPage(
      duration: const Duration(milliseconds: 500), curve: Curves.ease);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            "Welcome  " + firstName.toString(),
            // firstName.toString(),
            style: const TextStyle(
                color: Color(0xff1AA19A),
                fontSize: 18,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            _subAndViewSummary(),
            //
            FutureBuilder<QuestionModel>(
                future: questionListAPI(
                  ExamScheduleId: data[1],
                  RegistrationId: data[5],
                  // SubId: data[2],
                  // Type: "",
                  TestId: data[0],
                  activeIndex: activeIndex,
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
                            return _quesansUI(
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
                        ));
                  }
                }),
          ],
        ),
      ),
    );
  }

  _quesansUI({QuestionModel model, int length, int itemL}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Text("Question No." + model.result[0].queNo + "/" + data[6]),

              // Text(model.result[0].queNo + model.result[0].question),
              SizedBox(
                width: MediaQuery.of(context).size.width / 9,
              ),
              Text("Question Remaining Time:  " +
                  model.result[0].qnTime.replaceAll(".00000", "") +
                  "  Sec."),
            ],
          ),
        ),
        Divider(
          color: textColor,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Text(model.result[0].question,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        ),
        SizedBox(
          height: 10,
        ),
        model.result[0].a1 == model.result[0].ans
            ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 40,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color.fromARGB(255, 173, 157, 7)),
                  child: Center(
                    child: Text(
                      model.result[0].a1,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              )
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 40,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color.fromARGB(255, 58, 172, 166)),
                  child: Center(
                    child: Text(
                      model.result[0].a1,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
        model.result[0].a2 == model.result[0].ans
            ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 40,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color.fromARGB(255, 173, 157, 7)),
                  child: Center(
                    child: Text(
                      model.result[0].a2,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              )
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 40,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color.fromARGB(255, 58, 172, 166)),
                  child: Center(
                    child: Text(
                      model.result[0].a2,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
        model.result[0].a3 == model.result[0].ans
            ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 40,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromARGB(255, 173, 157, 7),
                  ),
                  child: Center(
                    child: Text(
                      model.result[0].a3,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              )
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 40,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromARGB(255, 58, 172, 166),
                  ),
                  child: Center(
                    child: Text(
                      model.result[0].a3,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
        model.result[0].a4 == model.result[0].ans
            ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 40,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color.fromARGB(255, 173, 157, 7)),
                  child: Center(
                    child: Text(
                      model.result[0].a4,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              )
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 40,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color.fromARGB(255, 58, 172, 166)),
                  child: Center(
                    child: Text(
                      model.result[0].a4,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 40,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: Color.fromARGB(255, 6, 85, 9)),
            child: Center(
              child: Text(
                "Correct Answer:    " + model.result[0].trueAns,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 15,
        ),
      
        Container(
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
              activeIndex == itemL - 1 ? Get.back() : next();
            },
            child: Text(
              activeIndex == itemL - 1 ? "Submit" : "Next",
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }

  Widget _subAndViewSummary() {
    return Row(
      children: [
        const SizedBox(
          width: 20,
          height: 20,
        ),
        Container(
          width: MediaQuery.of(context).size.width / 2.5,
          height: 30,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(
                colors: [btnColor1, btnColor2],
              )),
          child: MaterialButton(
            elevation: 4,
            onPressed: () {},
            child: Text(
              data[3],
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        const SizedBox(
          width: 10,
        ),
      ],
    );
  }
}
