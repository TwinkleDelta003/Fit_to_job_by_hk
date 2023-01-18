class checkTimeModel {
  String status;
  String message;
  List<Result> result;

  checkTimeModel({this.status, this.message, this.result});

  checkTimeModel.fromJson(Map<String, dynamic> json) {
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
  String isValid;
  String mSG;

  Result({this.isValid, this.mSG});

  Result.fromJson(Map<String, dynamic> json) {
    isValid = json['IsValid'];
    mSG = json['MSG'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['IsValid'] = this.isValid;
    data['MSG'] = this.mSG;
    return data;
  }
}
