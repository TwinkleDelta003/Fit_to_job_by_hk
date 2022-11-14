class VerifyotpModel {
  String status;
  String message;
  List<Result> result;

  VerifyotpModel({this.status, this.message, this.result});

  VerifyotpModel.fromJson(Map<String, dynamic> json) {
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
  String aadharCardNo;
  String firstName;
  String middleName;
  String lastName;
  String mobileNo;
  String city;
  String taluka;
  String district;
  String state;
  String address;
  String oTP;
  String oTPGeneratedOn;
  String fCMId;
  String insertedOn;
  String lastUpdatedOn;
  String insertedByUserId;
  String lastUpdatedByUserId;

  Result(
      {this.registrationId,
      this.aadharCardNo,
      this.firstName,
      this.middleName,
      this.lastName,
      this.mobileNo,
      this.city,
      this.taluka,
      this.district,
      this.state,
      this.address,
      this.oTP,
      this.oTPGeneratedOn,
      this.fCMId,
      this.insertedOn,
      this.lastUpdatedOn,
      this.insertedByUserId,
      this.lastUpdatedByUserId});

  Result.fromJson(Map<String, dynamic> json) {
    registrationId = json['RegistrationId'];
    aadharCardNo = json['AadharCardNo'];
    firstName = json['FirstName'];
    middleName = json['MiddleName'];
    lastName = json['LastName'];
    mobileNo = json['MobileNo'];
    city = json['City'];
    taluka = json['Taluka'];
    district = json['District'];
    state = json['State'];
    address = json['Address'];
    oTP = json['OTP'];
    oTPGeneratedOn = json['OTPGeneratedOn'];
    fCMId = json['FCMId'];
    insertedOn = json['InsertedOn'];
    lastUpdatedOn = json['LastUpdatedOn'];
    insertedByUserId = json['InsertedByUserId'];
    lastUpdatedByUserId = json['LastUpdatedByUserId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['RegistrationId'] = this.registrationId;
    data['AadharCardNo'] = this.aadharCardNo;
    data['FirstName'] = this.firstName;
    data['MiddleName'] = this.middleName;
    data['LastName'] = this.lastName;
    data['MobileNo'] = this.mobileNo;
    data['City'] = this.city;
    data['Taluka'] = this.taluka;
    data['District'] = this.district;
    data['State'] = this.state;
    data['Address'] = this.address;
    data['OTP'] = this.oTP;
    data['OTPGeneratedOn'] = this.oTPGeneratedOn;
    data['FCMId'] = this.fCMId;
    data['InsertedOn'] = this.insertedOn;
    data['LastUpdatedOn'] = this.lastUpdatedOn;
    data['InsertedByUserId'] = this.insertedByUserId;
    data['LastUpdatedByUserId'] = this.lastUpdatedByUserId;
    return data;
  }
}
