class ChapterVideoModel {
  String status;
  String message;
  List<Result> result;

  ChapterVideoModel({this.status, this.message, this.result});

  ChapterVideoModel.fromJson(Map<String, dynamic> json) {
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
  String chapterVideoId;
  String chapterId;
  String srNo;
  String videoName;
  String videoLink;
  String remarks;
  String insertedOn;
  String lastUpdatedOn;
  String insertedByUserId;
  String lastUpdatedByUserId;
  String subId;
  String standardTextListId;
  String hashtag;
  String periodNo;
  String isDisabled;
  String videoID;
  String fileName;
  String fileLink;

  Result(
      {this.chapterVideoId,
      this.chapterId,
      this.srNo,
      this.videoName,
      this.videoLink,
      this.remarks,
      this.fileName,
      this.insertedOn,
      this.lastUpdatedOn,
      this.insertedByUserId,
      this.lastUpdatedByUserId,
      this.subId,
      this.fileLink,
      this.standardTextListId,
      this.hashtag,
      this.periodNo,
      this.isDisabled,
      this.videoID});

  Result.fromJson(Map<String, dynamic> json) {
    chapterVideoId = json['ChapterVideoId'];
    chapterId = json['ChapterId'];
    srNo = json['SrNo'];
    videoName = json['VideoName'];
    videoLink = json['VideoLink'];
    remarks = json['Remarks'];
    insertedOn = json['InsertedOn'];
    lastUpdatedOn = json['LastUpdatedOn'];
    insertedByUserId = json['InsertedByUserId'];
    lastUpdatedByUserId = json['LastUpdatedByUserId'];
    subId = json['SubId'];
    standardTextListId = json['StandardTextListId'];
    hashtag = json['Hashtag'];
    periodNo = json['PeriodNo'];
    isDisabled = json['IsDisabled'];
    videoID = json['VideoID'];
    fileName = json['LinkName'];
    fileLink = json['Link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ChapterVideoId'] = this.chapterVideoId;
    data['ChapterId'] = this.chapterId;
    data['SrNo'] = this.srNo;
    data['VideoName'] = this.videoName;
    data['VideoLink'] = this.videoLink;
    data['Remarks'] = this.remarks;
    data['InsertedOn'] = this.insertedOn;
    data['LastUpdatedOn'] = this.lastUpdatedOn;
    data['InsertedByUserId'] = this.insertedByUserId;
    data['LastUpdatedByUserId'] = this.lastUpdatedByUserId;
    data['SubId'] = this.subId;
    data['StandardTextListId'] = this.standardTextListId;
    data['Hashtag'] = this.hashtag;
    data['PeriodNo'] = this.periodNo;
    data['IsDisabled'] = this.isDisabled;
    data['VideoID'] = this.videoID;
    data['Link'] = this.fileLink;
    data['LinkName'] = this.fileName;
    return data;
  }
}