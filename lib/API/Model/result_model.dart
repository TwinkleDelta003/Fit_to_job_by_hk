class ResultModel1 {
  String status;
  String message;
  List<Result> result;

  ResultModel1({this.status, this.message, this.result});

  ResultModel1.fromJson(Map<String, dynamic> json) {
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
  String registrationId;
  String examScheduleId;
  String examNo;
  String mobileNo;
  String firstName;
  String totalQuestions;
  String totalAnswered;
  String totalSkipped;
  String totalNotVisited;
  String totalMarkedforReview;
  String totalAnsandMarkedForReview;
  String totalObtainedMarks;
  String totalMarks;
  String noOfTrueAnswers;
  String noOfWrongAnswers;
  String noOfUnAttemptedQuestions;
  String standard;
  String subject;
  String testId;
  String testName;
  String ansKeyPDF;
  String viewAnsKey;
  String viewCheckedSheet;
  String smiley;

  Result(
      {this.registrationId,
      this.examScheduleId,
      this.examNo,
      this.mobileNo,
      this.firstName,
      this.totalQuestions,
      this.totalAnswered,
      this.totalSkipped,
      this.totalNotVisited,
      this.totalMarkedforReview,
      this.totalAnsandMarkedForReview,
      this.totalObtainedMarks,
      this.totalMarks,
      this.noOfTrueAnswers,
      this.noOfWrongAnswers,
      this.noOfUnAttemptedQuestions,
      this.standard,
      this.subject,
      this.testId,
      this.testName,
      this.ansKeyPDF,
      this.viewAnsKey,
      this.viewCheckedSheet,
      this.smiley});

  Result.fromJson(Map<String, dynamic> json) {
    registrationId = json['RegistrationId'];
    examScheduleId = json['ExamScheduleId'];
    examNo = json['ExamNo'];
    mobileNo = json['MobileNo'];
    firstName = json['FirstName'];
    totalQuestions = json['TotalQuestions'];
    totalAnswered = json['TotalAnswered'];
    totalSkipped = json['TotalSkipped'];
    totalNotVisited = json['TotalNotVisited'];
    totalMarkedforReview = json['TotalMarkedforReview'];
    totalAnsandMarkedForReview = json['TotalAnsandMarkedForReview'];
    totalObtainedMarks = json['TotalObtainedMarks'];
    totalMarks = json['TotalMarks'];
    noOfTrueAnswers = json['NoOfTrueAnswers'];
    noOfWrongAnswers = json['NoOfWrongAnswers'];
    noOfUnAttemptedQuestions = json['NoOfUnAttemptedQuestions'];
    standard = json['Standard'];
    subject = json['Subject'];
    testId = json['TestId'];
    testName = json['TestName'];
    ansKeyPDF = json['AnsKeyPDF'];
    viewAnsKey = json['ViewAnsKey'];
    viewCheckedSheet = json['ViewCheckedSheet'];
    smiley = json['Smiley'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['RegistrationId'] = this.registrationId;
    data['ExamScheduleId'] = this.examScheduleId;
    data['ExamNo'] = this.examNo;
    data['MobileNo'] = this.mobileNo;
    data['FirstName'] = this.firstName;
    data['TotalQuestions'] = this.totalQuestions;
    data['TotalAnswered'] = this.totalAnswered;
    data['TotalSkipped'] = this.totalSkipped;
    data['TotalNotVisited'] = this.totalNotVisited;
    data['TotalMarkedforReview'] = this.totalMarkedforReview;
    data['TotalAnsandMarkedForReview'] = this.totalAnsandMarkedForReview;
    data['TotalObtainedMarks'] = this.totalObtainedMarks;
    data['TotalMarks'] = this.totalMarks;
    data['NoOfTrueAnswers'] = this.noOfTrueAnswers;
    data['NoOfWrongAnswers'] = this.noOfWrongAnswers;
    data['NoOfUnAttemptedQuestions'] = this.noOfUnAttemptedQuestions;
    data['Standard'] = this.standard;
    data['Subject'] = this.subject;
    data['TestId'] = this.testId;
    data['TestName'] = this.testName;
    data['AnsKeyPDF'] = this.ansKeyPDF;
    data['ViewAnsKey'] = this.viewAnsKey;
    data['ViewCheckedSheet'] = this.viewCheckedSheet;
    data['Smiley'] = this.smiley;
    return data;
  }
}
