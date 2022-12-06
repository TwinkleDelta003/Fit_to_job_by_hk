class SubjobProfileModel {
  String status;
  String message;
  List<Result> result;

  SubjobProfileModel({this.status, this.message, this.result});

  SubjobProfileModel.fromJson(Map<String, dynamic> json) {
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
  String jobOfferingId;
  String staffCategoryTextListId;
  String departmentId;
  String divisionId;
  String designationId;
  String pDFFile;
  String noOfSeats;
  String validFrom;
  String validTo;
  String insertedOn;
  String lastUpdatedOn;
  String insertedByUserId;
  String lastUpdatedByUserId;
  String staffCategory;
  String deptName;
  String designation;

  Result(
      {this.jobOfferingId,
      this.staffCategoryTextListId,
      this.departmentId,
      this.divisionId,
      this.designationId,
      this.pDFFile,
      this.noOfSeats,
      this.validFrom,
      this.validTo,
      this.insertedOn,
      this.lastUpdatedOn,
      this.insertedByUserId,
      this.lastUpdatedByUserId,
      this.staffCategory,
      this.deptName,
      this.designation});

  Result.fromJson(Map<String, dynamic> json) {
    jobOfferingId = json['JobOfferingId'];
    staffCategoryTextListId = json['StaffCategoryTextListId'];
    departmentId = json['DepartmentId'];
    divisionId = json['DivisionId'];
    designationId = json['DesignationId'];
    pDFFile = json['PDFFile'];
    noOfSeats = json['NoOfSeats'];
    validFrom = json['ValidFrom'];
    validTo = json['ValidTo'];
    insertedOn = json['InsertedOn'];
    lastUpdatedOn = json['LastUpdatedOn'];
    insertedByUserId = json['InsertedByUserId'];
    lastUpdatedByUserId = json['LastUpdatedByUserId'];
    staffCategory = json['StaffCategory'];
    deptName = json['DeptName'];
    designation = json['Designation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['JobOfferingId'] = this.jobOfferingId;
    data['StaffCategoryTextListId'] = this.staffCategoryTextListId;
    data['DepartmentId'] = this.departmentId;
    data['DivisionId'] = this.divisionId;
    data['DesignationId'] = this.designationId;
    data['PDFFile'] = this.pDFFile;
    data['NoOfSeats'] = this.noOfSeats;
    data['ValidFrom'] = this.validFrom;
    data['ValidTo'] = this.validTo;
    data['InsertedOn'] = this.insertedOn;
    data['LastUpdatedOn'] = this.lastUpdatedOn;
    data['InsertedByUserId'] = this.insertedByUserId;
    data['LastUpdatedByUserId'] = this.lastUpdatedByUserId;
    data['StaffCategory'] = this.staffCategory;
    data['DeptName'] = this.deptName;
    data['Designation'] = this.designation;
    return data;
  }
}
