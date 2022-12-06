class Finalsubmitmodel {
  String status;
  String message;
  List<Result> result;

  Finalsubmitmodel({this.status, this.message, this.result});

  Finalsubmitmodel.fromJson(Map<String, dynamic> json) {
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
  String examStartStopTimeId;

  Result({this.examStartStopTimeId});

  Result.fromJson(Map<String, dynamic> json) {
    examStartStopTimeId = json['ExamStartStopTimeId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ExamStartStopTimeId'] = this.examStartStopTimeId;
    return data;
  }
}
