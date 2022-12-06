class JobprofileModel {
  String status;
  String message;
  List<Result> result;

  JobprofileModel({this.status, this.message, this.result});

  JobprofileModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['result'] != null) {
      result = <Result>[];
      json['result'].forEach((v) {
        result.add(Result.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (result != null) {
      data['result'] = result.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Result {
  String staffCategory;

  Result({this.staffCategory});

  Result.fromJson(Map<String, dynamic> json) {
    staffCategory = json['StaffCategory'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['StaffCategory'] = staffCategory;
    return data;
  }
}
