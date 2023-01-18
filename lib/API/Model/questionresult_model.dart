class QuestionResultModel {
  String status;
  String message;
  List<Result> result;

  QuestionResultModel({this.status, this.message, this.result});

  QuestionResultModel.fromJson(Map<String, dynamic> json) {
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
  String subId;
  String queId;
  String question;
  String a1;
  String a2;
  String a3;
  String a4;
  String subject;
  String srNo;
  String orderBy;
  String imageNameQus;
  String imageNameA1;
  String imageNameA2;
  String imageNameA3;
  String imageNameA4;
  String queType;
  String queDataType;
  String rightMarks;
  String wrongMarks;
  String nonMarks;
  String noOfFile;
  String perQuestionTime;
  String insertedOn;
  String startDt;
  String queNo;
  String qnTime;
  String totalMins;
  String testId;
  String ans;
  String ansImage1;
  String ansImage2;
  String ansImage3;
  String ansImage4;
  String trueAns;

  Result(
      {this.subId,
      this.queId,
      this.question,
      this.a1,
      this.a2,
      this.a3,
      this.a4,
      this.subject,
      this.srNo,
      this.orderBy,
      this.imageNameQus,
      this.imageNameA1,
      this.imageNameA2,
      this.imageNameA3,
      this.imageNameA4,
      this.queType,
      this.queDataType,
      this.rightMarks,
      this.wrongMarks,
      this.nonMarks,
      this.noOfFile,
      this.perQuestionTime,
      this.insertedOn,
      this.startDt,
      this.queNo,
      this.qnTime,
      this.totalMins,
      this.testId,
      this.ans,
      this.ansImage1,
      this.ansImage2,
      this.ansImage3,
      this.ansImage4,
      this.trueAns});

  Result.fromJson(Map<String, dynamic> json) {
    subId = json['SubId'];
    queId = json['QueId'];
    question = json['Question'];
    a1 = json['A1'];
    a2 = json['A2'];
    a3 = json['A3'];
    a4 = json['A4'];
    subject = json['Subject'];
    srNo = json['SrNo'];
    orderBy = json['OrderBy'];
    imageNameQus = json['ImageNameQus'];
    imageNameA1 = json['ImageNameA1'];
    imageNameA2 = json['ImageNameA2'];
    imageNameA3 = json['ImageNameA3'];
    imageNameA4 = json['ImageNameA4'];
    queType = json['QueType'];
    queDataType = json['QueDataType'];
    rightMarks = json['RightMarks'];
    wrongMarks = json['WrongMarks'];
    nonMarks = json['NonMarks'];
    noOfFile = json['NoOfFile'];
    perQuestionTime = json['PerQuestionTime'];
    insertedOn = json['InsertedOn'];
    startDt = json['StartDt'];
    queNo = json['QueNo'];
    qnTime = json['QnTime'];
    totalMins = json['TotalMins'];
    testId = json['TestId'];
    ans = json['Ans'];
    ansImage1 = json['AnsImage1'];
    ansImage2 = json['AnsImage2'];
    ansImage3 = json['AnsImage3'];
    ansImage4 = json['AnsImage4'];
    trueAns = json['TrueAns'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['SubId'] = this.subId;
    data['QueId'] = this.queId;
    data['Question'] = this.question;
    data['A1'] = this.a1;
    data['A2'] = this.a2;
    data['A3'] = this.a3;
    data['A4'] = this.a4;
    data['Subject'] = this.subject;
    data['SrNo'] = this.srNo;
    data['OrderBy'] = this.orderBy;
    data['ImageNameQus'] = this.imageNameQus;
    data['ImageNameA1'] = this.imageNameA1;
    data['ImageNameA2'] = this.imageNameA2;
    data['ImageNameA3'] = this.imageNameA3;
    data['ImageNameA4'] = this.imageNameA4;
    data['QueType'] = this.queType;
    data['QueDataType'] = this.queDataType;
    data['RightMarks'] = this.rightMarks;
    data['WrongMarks'] = this.wrongMarks;
    data['NonMarks'] = this.nonMarks;
    data['NoOfFile'] = this.noOfFile;
    data['PerQuestionTime'] = this.perQuestionTime;
    data['InsertedOn'] = this.insertedOn;
    data['StartDt'] = this.startDt;
    data['QueNo'] = this.queNo;
    data['QnTime'] = this.qnTime;
    data['TotalMins'] = this.totalMins;
    data['TestId'] = this.testId;
    data['Ans'] = this.ans;
    data['AnsImage1'] = this.ansImage1;
    data['AnsImage2'] = this.ansImage2;
    data['AnsImage3'] = this.ansImage3;
    data['AnsImage4'] = this.ansImage4;
    data['TrueAns'] = this.trueAns;
    return data;
  }
}
