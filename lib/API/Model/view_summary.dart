class ViewSummaryModel {
  String status;
  String message;
  List<Result> result;

  ViewSummaryModel({this.status, this.message, this.result});

  ViewSummaryModel.fromJson(Map<String, dynamic> json) {
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
  String queId;
  String question;
  String testId;
  String language;
  String subject;
  String queType;
  String queNo;

  Result(
      {this.queId,
        this.question,
        this.testId,
        this.language,
        this.subject,
        this.queType,
        this.queNo});

  Result.fromJson(Map<String, dynamic> json) {
    queId = json['QueId'];
    question = json['Question'];
    testId = json['TestId'];
    language = json['Language'];
    subject = json['Subject'];
    queType = json['QueType'];
    queNo = json['QueNo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['QueId'] = this.queId;
    data['Question'] = this.question;
    data['TestId'] = this.testId;
    data['Language'] = this.language;
    data['Subject'] = this.subject;
    data['QueType'] = this.queType;
    data['QueNo'] = this.queNo;
    return data;
  }
}
