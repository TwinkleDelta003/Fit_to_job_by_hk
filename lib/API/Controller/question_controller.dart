import 'dart:convert';
import 'package:fit_to_job/API/Model/questionresult_model.dart';
import 'package:fit_to_job/API/Model/result_model.dart';
import 'package:fit_to_job/API/Model/view_summary.dart';
import 'package:fit_to_job/Screens/Constant/apiPath.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:fit_to_job/API/Model/question_model.dart';
import '../../Screens/Widgets/hepler.dart';
import '../Model/checkTime_model.dart';

Future<QuestionModel> questionListAPI(
    {String RegistrationId,
    String ExamScheduleId,
    String TestId,
    int activeIndex,
    int itemL}) async {
  final response = await http.post(Uri.parse(questionListURL), body: {
    "RegistrationId": RegistrationId,
    "ExamScheduleId": ExamScheduleId,
    "TestId": TestId
  });
  var data = json.decode(response.body.toString());
  if (data['status'] == "200") {
    // debugPrint("Data Get");
    // activeIndex == itemL - 1;
    //  ? Helper().customSnackbar(
    //           bgColor: Colors.green,
    //           msgColor: Colors.white,
    //           message: data['data'],
    //           duration: Duration(seconds: 2),
    //           title: "Success",
    //           icon: Icon(Icons.check_circle_rounded),
    //         )
    //       : null;

    return QuestionModel.fromJson(data);
  } else {
    debugPrint("DATA NOT PRINT");
    return QuestionModel.fromJson(data);
  }
}
//Question Result API

Future<QuestionResultModel> questionresultAPI(
    {String SubId,
    String TestId,
    String RegistrationId,
    String ExamScheduleId,
    String Type,
    int activeIndex,
    int itemL}) async {
  final response = await http.post(Uri.parse(questionresultAPIURL), body: {
    "RegistrationId": RegistrationId,
    "ExamScheduleId": ExamScheduleId,
    "TestId": TestId,
    "SubId": SubId,
    "Type": Type
  });
  var data = json.decode(response.body.toString());
  if (data['status'] == "200") {
    // debugPrint("Data Get");

    return QuestionResultModel.fromJson(data);
  } else {
    return QuestionResultModel.fromJson(data);
  }
}

Future<ViewSummaryModel> viewSummaryAPI(
    {String SubId,
    String TestId,
    String ExamScheduleId,
    String RegistrationId,
    String IsJeeNeet}) async {
  final response = await http.post(Uri.parse(viewSummaryAPIURL), body: {
    "TestId": TestId,
    "ExamScheduleId": ExamScheduleId,
    "SubId": SubId,
    "IsJeeNeet": IsJeeNeet,
    "RegistrationId": RegistrationId,
  });
  var data = json.decode(response.body);

  if (data['status'] == "200") {
    return ViewSummaryModel.fromJson(data);
  } else {
    return ViewSummaryModel.fromJson(data);
  }
}

Future insertAPI({
  String QueId,
  String ExamScheduleId,
  String TestId,
  String InsertedByUserId,
  String SubId,
  String IsJeeNeet,
  String RegistrationId,
  String Ans,
  String AnsStatus,
  String QueType,
}) async {
  final response = await http.post(Uri.parse(insertExamAPIURL), body: {
    "QueId": QueId,
    "ExamScheduleId": ExamScheduleId,
    "TestId": TestId,
    "InsertedByUserId": InsertedByUserId,
    "SubId": SubId,
    "IsJeeNeet": IsJeeNeet,
    "RegistrationId": RegistrationId,
    "Ans": Ans,
    "AnsStatus": AnsStatus,
    "QueType": QueType,
  });
  var data = json.decode(response.body.toString());

  if (data['status'] == "200") {
    debugPrint(data.toString());
    // snackBar(context, data['result']);
    return data;
  } else {
    debugPrint(data.toString());
    // snackBar(context, data['result']);
    return data;
  }
}

Future finalsubmitAPI(
    {String RegistrationId,
    String ExamScheduleId,
    String StopLat,
    String StopLong,
    String InsertedByUserId,
    BuildContext context}) async {
  final response = await http.post(
      Uri.parse(
          "http://110.227.253.77:90/FitToJobExam/API/API_FinalSubmit.aspx"),
      body: {
        "RegistrationId": RegistrationId,
        "ExamScheduleId": ExamScheduleId,
        "StopLat": StopLat,
        "StopLong": StopLong,
        "InsertedByUserId": InsertedByUserId,
      });
  var data = json.decode(response.body);
  if (data['status'] == "200") {
    debugPrint("Exam Submitted");
    Get.toNamed('/homescreen');
    ScaffoldMessenger.of(context).showSnackBar(customSnackbar(
        label: "",
        lColor: Colors.white,
        time: const Duration(seconds: 3),
        press: () {},
        msg: "Exam Submitted Successfully",
        chooseColor: Colors.green));
    return data;
  } else {
    debugPrint("Exam Not Submitted");
    return data;
  }
}

Future<ResultModel1> resultAPI({
  String ExamScheduleId,
  String RegistrationId,
  String Subject,
  String IsJeeNeet,
  String TestId,
}) async {
  final response = await http.post(Uri.parse(getanslistAPIURL), body: {
    "ExamScheduleId": ExamScheduleId,
    "RegistrationId": RegistrationId,
    "Subject": Subject,
    "IsJeeNeet": IsJeeNeet,
    "TestId": TestId,
  });
  var data = json.decode(response.body);

  if (data['status'] == "200") {
    return ResultModel1.fromJson(data);
  } else {
    debugPrint(data.toString());
    return ResultModel1.fromJson(data);
  }
}

Future<checkTimeModel> ChecktimeAPI({
  String ExamScheduleId,
  String RegistrationId,
  String TestId,
  BuildContext context,
}) async {
  final response = await http.post(Uri.parse(checkexamtimeAPIURL), body: {
    "ExamScheduleId": ExamScheduleId,
    "RegistrationId": RegistrationId,
    "TestId": TestId
  });
  var data = json.decode(response.body);
  if (data['status'] == "200"
//  && data['Msg'] == "False"
      ) {
    return checkTimeModel.fromJson(data);
  } else {
    return checkTimeModel.fromJson(data);
  }
}

Future insertsign({
  String RegistrationId,
  String ExamScheduleId,
  String StartLat,
  String StartLong,
  String StopLat,
  String StopLong,
  String InsertedByUserId,
  String Type,
}) async {
  final response = await http.post(Uri.parse(InsertsignlocationAPIURL), body: {
    "RegistrationId": RegistrationId,
    "ExamScheduleId": ExamScheduleId,
    "StartLat": StartLat,
    "StartLong": StartLong,
    "StopLat": StopLat,
    "StopLong": StopLong,
    "InsertedByUserId": InsertedByUserId,
    "Type": Type,
  });
  var data = json.decode(response.body);
  if (data['status'] == "200") {
    print("API Send");
    return data;
  } else {
    print("API Not Send");
    return data;
  }
}
