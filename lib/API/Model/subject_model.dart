class SubjectModel {
  String status;
  String message;
  List<Result> result;

  SubjectModel({this.status, this.message, this.result});

  SubjectModel.fromJson(Map<String, dynamic> json) {
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
  String name;
  String remarks;
  String insertedOn;
  String lastUpdatedOn;
  String insertedByUserId;
  String lastUpdatedByUserId;
  String standardTextListId;
  String photoPath;
  String isStudyMaterialAllowed;
  String imagePhoto;
  String photoPathLive;
  String count;

  Result(
      {this.subId,
      this.name,
      this.remarks,
      this.insertedOn,
      this.lastUpdatedOn,
      this.insertedByUserId,
      this.lastUpdatedByUserId,
      this.standardTextListId,
      this.photoPath,
      this.isStudyMaterialAllowed,
      this.imagePhoto,
      this.photoPathLive,
      this.count});

  Result.fromJson(Map<String, dynamic> json) {
    subId = json['SubId'];
    name = json['Name'];
    remarks = json['Remarks'];
    insertedOn = json['InsertedOn'];
    lastUpdatedOn = json['LastUpdatedOn'];
    insertedByUserId = json['InsertedByUserId'];
    lastUpdatedByUserId = json['LastUpdatedByUserId'];
    standardTextListId = json['StandardTextListId'];
    photoPath = json['PhotoPath'];
    isStudyMaterialAllowed = json['IsStudyMaterialAllowed'];
    imagePhoto = json['ImagePhoto'];
    photoPathLive = json['PhotoPathLive'];
    count = json['Count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['SubId'] = this.subId;
    data['Name'] = this.name;
    data['Remarks'] = this.remarks;
    data['InsertedOn'] = this.insertedOn;
    data['LastUpdatedOn'] = this.lastUpdatedOn;
    data['InsertedByUserId'] = this.insertedByUserId;
    data['LastUpdatedByUserId'] = this.lastUpdatedByUserId;
    data['StandardTextListId'] = this.standardTextListId;
    data['PhotoPath'] = this.photoPath;
    data['IsStudyMaterialAllowed'] = this.isStudyMaterialAllowed;
    data['ImagePhoto'] = this.imagePhoto;
    data['PhotoPathLive'] = this.photoPathLive;
    data['Count'] = this.count;
    return data;
  }
}