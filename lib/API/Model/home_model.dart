class HomeModel {
  String status;
  String message;
  List<Result> result;

  HomeModel({this.status, this.message, this.result});

  HomeModel.fromJson(Map<String, dynamic> json) {
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
  String testId;
  String testName;
  String subId;
  String examDate;
  String examscheduleId;
  String isSelfieAllowed;
  String isSignatureAllowed;
  String examFromTime;
  String examToTime;
  String subName;

  Result(
      {this.testId,
        this.testName,
        this.subId,
        this.examDate,
        this.examscheduleId,
        this.isSelfieAllowed,
        this.isSignatureAllowed,
        this.examFromTime,
        this.examToTime,
        this.subName});

  Result.fromJson(Map<String, dynamic> json) {
    testId = json['TestId'];
    testName = json['TestName'];
    subId = json['SubId'];
    examDate = json['ExamDate'];
    examscheduleId = json['ExamscheduleId'];
    isSelfieAllowed = json['IsSelfieAllowed'];
    isSignatureAllowed = json['IsSignatureAllowed'];
    examFromTime = json['ExamFromTime'];
    examToTime = json['ExamToTime'];
    subName = json['SubName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['TestId'] = this.testId;
    data['TestName'] = this.testName;
    data['SubId'] = this.subId;
    data['ExamDate'] = this.examDate;
    data['ExamscheduleId'] = this.examscheduleId;
    data['IsSelfieAllowed'] = this.isSelfieAllowed;
    data['IsSignatureAllowed'] = this.isSignatureAllowed;
    data['ExamFromTime'] = this.examFromTime;
    data['ExamToTime'] = this.examToTime;
    data['SubName'] = this.subName;
    return data;
  }
}
