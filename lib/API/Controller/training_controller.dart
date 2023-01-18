import 'package:fit_to_job/API/Model/chapter_pdf_model.dart';
import 'package:fit_to_job/API/Model/chapter_video_model.dart';
import 'package:fit_to_job/API/Model/subject_model.dart';
import 'package:fit_to_job/Screens/Constant/apiPath.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../Model/chapter_model.dart';

Future<SubjectModel> subjectListAPI({String RegistrationId}) async {
  final response = await http.post(Uri.parse(subjectListAPIURL), body: {
    "RegistrationId": RegistrationId,
  });
  var data = json.decode(response.body);

  if (data['status'] == "200") {
    return SubjectModel.fromJson(data);
  } else {
    return SubjectModel.fromJson(data);
  }
}

Future<ChapterModel> chapterListAPI({String chapterId}) async {
  final response = await http.post(Uri.parse(chapterListAPIURL), body: {
    "SubId": chapterId,
  });
  var data = json.decode(response.body);

  if (data['status'] == "200") {
    return ChapterModel.fromJson(data);
  } else {
    return ChapterModel.fromJson(data);
  }
}

Future<ChapterPDFModel> chapterPDFListAPI({String chapterId}) async {
  final response = await http.post(Uri.parse(chapterPDFListAPIURL), body: {
    "ChapterId": chapterId,
  });
  var data = json.decode(response.body);

  if (data['status'] == "200") {
    return ChapterPDFModel.fromJson(data);
  } else {
    return ChapterPDFModel.fromJson(data);
  }
}

Future<ChapterVideoModel> chapterVideoListAPI({String chapterId}) async {
  final response = await http.post(Uri.parse(chapterVideoListAPIURL), body: {
    "ChapterId": chapterId,
  });
  var data = json.decode(response.body);

  if (data['status'] == "200") {
    return ChapterVideoModel.fromJson(data);
  } else {
    return ChapterVideoModel.fromJson(data);
  }
}

Future<ChapterVideoModel> chapterReferenceLinkListAPI(
    {String chapterId}) async {
  final response =
      await http.post(Uri.parse(chapterReferenceLinkListAPIURL), body: {
    "ChapterId": chapterId,
  });
  var data = json.decode(response.body);

  if (data['status'] == "200") {
    return ChapterVideoModel.fromJson(data);
  } else {
    return ChapterVideoModel.fromJson(data);
  }
}