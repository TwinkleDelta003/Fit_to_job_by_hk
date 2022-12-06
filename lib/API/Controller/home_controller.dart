import 'dart:convert';

import 'package:fit_to_job/API/Model/assessment_model.dart';
import 'package:fit_to_job/API/Model/home_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

Future<HomeModel> testViewListAPI({String date, String RegistrationId}) async {
  final response = await http.post(Uri.parse("http://110.227.253.77:90/FitToJobExam/API/API_Timetable.aspx"), body: {
    "date": date,
    "RegistrationId": RegistrationId,
  });
  var data = json.decode(response.body);

  if (data['status'] == "200") {
    return HomeModel.fromJson(data);
  } else {
    return HomeModel.fromJson(data);
  }
}

Future<AssessmentModel> assessmentListAPI(
    {String ExamScheduleId, String TestId, String RegistrationId}) async {
  final response = await http.post(Uri.parse("http://110.227.253.77:90/FitToJobExam/API/API_TestDetails.aspx"), body: {
    "ExamScheduleId": ExamScheduleId,
    "TestId": TestId,
    "RegistrationId": RegistrationId,
  });
  var data = json.decode(response.body);

  if (data['status'] == "200") {
    return AssessmentModel.fromJson(data);
  } else {
    return AssessmentModel.fromJson(data);
  }
}
