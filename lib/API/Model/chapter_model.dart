class ChapterModel {
  String status;
  String message;
  List<Result> result;

  ChapterModel({this.status, this.message, this.result});

  ChapterModel.fromJson(Map<String, dynamic> json) {
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
  String chapterId;
  String srNo;
  String chapterName;
  String subId;
  String remarks;
  String insertedOn;
  String lastUpdatedOn;
  String insertedByUserId;
  String lastUpdatedByUserId;
  String standardTextListId;
  String periodNo;
  String videoCnt;
  String pDFCnt;

  Result(
      {this.chapterId,
      this.srNo,
      this.chapterName,
      this.subId,
      this.remarks,
      this.insertedOn,
      this.lastUpdatedOn,
      this.insertedByUserId,
      this.lastUpdatedByUserId,
      this.standardTextListId,
      this.periodNo,
      this.videoCnt,
      this.pDFCnt});

  Result.fromJson(Map<String, dynamic> json) {
    chapterId = json['ChapterId'];
    srNo = json['SrNo'];
    chapterName = json['ChapterName'];
    subId = json['SubId'];
    remarks = json['Remarks'];
    insertedOn = json['InsertedOn'];
    lastUpdatedOn = json['LastUpdatedOn'];
    insertedByUserId = json['InsertedByUserId'];
    lastUpdatedByUserId = json['LastUpdatedByUserId'];
    standardTextListId = json['StandardTextListId'];
    periodNo = json['PeriodNo'];
    videoCnt = json['VideoCnt'];
    pDFCnt = json['PDFCnt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ChapterId'] = this.chapterId;
    data['SrNo'] = this.srNo;
    data['ChapterName'] = this.chapterName;
    data['SubId'] = this.subId;
    data['Remarks'] = this.remarks;
    data['InsertedOn'] = this.insertedOn;
    data['LastUpdatedOn'] = this.lastUpdatedOn;
    data['InsertedByUserId'] = this.insertedByUserId;
    data['LastUpdatedByUserId'] = this.lastUpdatedByUserId;
    data['StandardTextListId'] = this.standardTextListId;
    data['PeriodNo'] = this.periodNo;
    data['VideoCnt'] = this.videoCnt;
    data['PDFCnt'] = this.pDFCnt;
    return data;
  }
}