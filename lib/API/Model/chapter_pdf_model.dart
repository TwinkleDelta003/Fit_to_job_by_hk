class ChapterPDFModel {
  String status;
  String message;
  List<Result> result;

  ChapterPDFModel({this.status, this.message, this.result});

  ChapterPDFModel.fromJson(Map<String, dynamic> json) {
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
  String chapterPDFId;
  String chapterId;
  String srNo;
  String fileName;
  String remarks;
  String insertedOn;
  String lastUpdatedOn;
  String insertedByUserId;
  String lastUpdatedByUserId;
  String standardTextListId;
  String subId;
  String fileLink;

  Result(
      {this.chapterPDFId,
      this.chapterId,
      this.srNo,
      this.fileName,
      this.remarks,
      this.insertedOn,
      this.lastUpdatedOn,
      this.insertedByUserId,
      this.lastUpdatedByUserId,
      this.standardTextListId,
      this.subId,
      this.fileLink});

  Result.fromJson(Map<String, dynamic> json) {
    chapterPDFId = json['ChapterPDFId'];
    chapterId = json['ChapterId'];
    srNo = json['SrNo'];
    fileName = json['FileName'];
    remarks = json['Remarks'];
    insertedOn = json['InsertedOn'];
    lastUpdatedOn = json['LastUpdatedOn'];
    insertedByUserId = json['InsertedByUserId'];
    lastUpdatedByUserId = json['LastUpdatedByUserId'];
    standardTextListId = json['StandardTextListId'];
    subId = json['SubId'];
    fileLink = json['FileLink'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ChapterPDFId'] = this.chapterPDFId;
    data['ChapterId'] = this.chapterId;
    data['SrNo'] = this.srNo;
    data['FileName'] = this.fileName;
    data['Remarks'] = this.remarks;
    data['InsertedOn'] = this.insertedOn;
    data['LastUpdatedOn'] = this.lastUpdatedOn;
    data['InsertedByUserId'] = this.insertedByUserId;
    data['LastUpdatedByUserId'] = this.lastUpdatedByUserId;
    data['StandardTextListId'] = this.standardTextListId;
    data['SubId'] = this.subId;
    data['FileLink'] = this.fileLink;
    return data;
  }
}