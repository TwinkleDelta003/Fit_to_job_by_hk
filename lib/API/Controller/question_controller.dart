import 'dart:convert';
import 'package:fit_to_job/API/Model/result_model.dart';
import 'package:fit_to_job/API/Model/view_summary.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:fit_to_job/API/Model/question_model.dart';
import '../../Screens/Widgets/hepler.dart';
import '../Model/FinalSubmit_model.dart';

Future<QuestionModel> questionListAPI(
    {String RegistrationId,
    String ExamScheduleId,
    String TestId,
    int activeIndex,
    int itemL}) async {
  final response = await http.post(
      Uri.parse(
          "http://110.227.253.77:90/FitToJobExam/API/API_GetSubjectWiseQnList.aspx"),
      body: {
        "RegistrationId": RegistrationId,
        "ExamScheduleId": ExamScheduleId,
        "TestId": TestId
      });
  var data = json.decode(response.body.toString());
  if (data['status'] == "200") {
    debugPrint("Data Get");
    // activeIndex == itemL - 1
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

Future<ViewSummaryModel> viewSummaryAPI(
    {String SubId,
    String TestId,
    String ExamScheduleId,
    String RegistrationId,
    String IsJeeNeet}) async {
  final response = await http.post(
      Uri.parse(
          "http://110.227.253.77:90/FitToJobExam/API/API_JEESummary.aspx"),
      body: {
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
  final response = await http.post(
      Uri.parse(
          "http://110.227.253.77:90/FitToJobExam/API/API_insertExam.aspx"),
      body: {
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

Future<Finalsubmitmodel> finalsubmitAPI({
  String RegistrationId,
  String ExamScheduleId,
  String StopLat,
  String StopLong,
  String InsertedByUserId,
}) async {
  final response = await http.post(
      Uri.parse(
          "http://110.227.253.77:90/FitToJobExam/API/API_FinalSubmit.aspx"),
      body: {
        "RegistrationId": RegistrationId,
        "ExamScheduleId": ExamScheduleId,
        "StopLat": StopLat,
        "StopLong": StopLong,
        "InsertedByUserId": InsertedByUserId
      });
  var data = json.decode(response.body);
  if (data['status'] == "200") {
    debugPrint("Finish Succesfully");
    debugPrint(data);
    return Finalsubmitmodel.fromJson(data);
  } else {
    debugPrint("Not Submitted Succesfully");
    return Finalsubmitmodel.fromJson(data);
  }
}

Future<ResultModel1> resultAPI({
  String ExamScheduleId,
  String RegistrationId,
  String Subject,
  String IsJeeNeet,
  String TestId,
}) async {
  final response = await http.post(
      Uri.parse(
          "http://110.227.253.77:90/FitToJobExam/API/API_GetSubjectWiseQnListWithAns.aspx"),
      body: {
        "ExamScheduleId": ExamScheduleId,
        "RegistrationId": RegistrationId,
        "Subject": Subject,
        "IsJeeNeet": IsJeeNeet,
        "TestId": TestId,
      });
  var data = json.decode(response.body);

  if (data['status'] == "200") {
    debugPrint(data.toString());
    return ResultModel1.fromJson(data);
  } else {
    debugPrint(data.toString());
    return ResultModel1.fromJson(data);
  }
}
