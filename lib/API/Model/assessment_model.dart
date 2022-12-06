class AssessmentModel {
  String status;
  String message;
  List<Result> result;

  AssessmentModel({this.status, this.message, this.result});

  AssessmentModel.fromJson(Map<String, dynamic> json) {
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
  String examScheduleId;
  String subId;
  String testId;
  String registrationId;
  String schoolName;
  String schoolLogoImagePath;
  String assesmentCode;
  String duration;
  String assesmentDateTime;
  String totalQn;
  String answeredQn;
  String pendingQn;
  String skippedQn;
  String isJeeNeetTest;
  String isResultAvailable;
  String examDate;

  Result(
      {this.examScheduleId,
        this.subId,
        this.testId,
        this.registrationId,
        this.schoolName,
        this.schoolLogoImagePath,
        this.assesmentCode,
        this.duration,
        this.assesmentDateTime,
        this.totalQn,
        this.answeredQn,
        this.pendingQn,
        this.skippedQn,
        this.isJeeNeetTest,
        this.isResultAvailable,
        this.examDate});

  Result.fromJson(Map<String, dynamic> json) {
    examScheduleId = json['ExamScheduleId'];
    subId = json['SubId'];
    testId = json['TestId'];
    registrationId = json['RegistrationId'];
    schoolName = json['SchoolName'];
    schoolLogoImagePath = json['SchoolLogoImagePath'];
    assesmentCode = json['AssesmentCode'];
    duration = json['Duration'];
    assesmentDateTime = json['AssesmentDateTime'];
    totalQn = json['TotalQn'];
    answeredQn = json['AnsweredQn'];
    pendingQn = json['PendingQn'];
    skippedQn = json['SkippedQn'];
    isJeeNeetTest = json['IsJeeNeetTest'];
    isResultAvailable = json['IsResultAvailable'];
    examDate = json['ExamDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ExamScheduleId'] = this.examScheduleId;
    data['SubId'] = this.subId;
    data['TestId'] = this.testId;
    data['RegistrationId'] = this.registrationId;
    data['SchoolName'] = this.schoolName;
    data['SchoolLogoImagePath'] = this.schoolLogoImagePath;
    data['AssesmentCode'] = this.assesmentCode;
    data['Duration'] = this.duration;
    data['AssesmentDateTime'] = this.assesmentDateTime;
    data['TotalQn'] = this.totalQn;
    data['AnsweredQn'] = this.answeredQn;
    data['PendingQn'] = this.pendingQn;
    data['SkippedQn'] = this.skippedQn;
    data['IsJeeNeetTest'] = this.isJeeNeetTest;
    data['IsResultAvailable'] = this.isResultAvailable;
    data['ExamDate'] = this.examDate;
    return data;
  }
}
