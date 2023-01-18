import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:fit_to_job/API/Controller/register_controller.dart';
import 'package:fit_to_job/Screens/CommonScreen/demoscreen.dart';
import 'package:fit_to_job/Screens/Connection/Connection.dart';
import 'package:fit_to_job/Screens/Constant/Colorpath.dart';
import 'package:fit_to_job/Screens/Constant/apiPath.dart';
import 'package:fit_to_job/Screens/Constant/imagePath.dart';
import 'package:fit_to_job/Screens/Constant/responsive.dart';
import 'package:fit_to_job/Screens/Constant/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Widgets/hepler.dart';
import 'package:http/http.dart' as http;

class InterviewScreen extends StatefulWidget {
  const InterviewScreen({Key key}) : super(key: key);

  @override
  State<InterviewScreen> createState() => InterviewScreenState();
}

class InterviewScreenState extends State<InterviewScreen> {
  String registrationId;
  String firstName;
  String designation;
  String jobOfferingId;
  getUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      registrationId = prefs.getString('registrationId');
      firstName = prefs.getString('firstName');
      designation = prefs.getString('designation');
      jobOfferingId = prefs.getString('jobOfferingId');
    });
  }

  @override
  void initState() {
    getUserId();
    super.initState();
  }

  TextEditingController fromDateCltr = TextEditingController();
  TextEditingController dateinput = TextEditingController();
  TextEditingController _dateCltr = TextEditingController();
  final TextEditingController _nameCltr = TextEditingController();
  final TextEditingController _addressCltr = TextEditingController();
  final TextEditingController _postCltr = TextEditingController();
  final TextEditingController _cityCltr = TextEditingController();
  final TextEditingController _districtCltr = TextEditingController();
  final TextEditingController _pincodeCltr = TextEditingController();
  final TextEditingController _paddressCltr = TextEditingController();
  final TextEditingController _ppostCltr = TextEditingController();
  final TextEditingController _pcityCltr = TextEditingController();
  final TextEditingController _pdistrictCltr = TextEditingController();
  final TextEditingController _ppincodeCltr = TextEditingController();
  final TextEditingController _dateofbirthCltr = TextEditingController();
  final TextEditingController _bloodCltr = TextEditingController();
  final TextEditingController _adharcardCltr = TextEditingController();
  final TextEditingController _panCardCltr = TextEditingController();
  final TextEditingController _electionCltr = TextEditingController();
  final TextEditingController _emailCltr = TextEditingController();
  final TextEditingController _fnameCltr = TextEditingController();
  final TextEditingController _fOccupassionCltr = TextEditingController();
  final TextEditingController _feduCltr = TextEditingController();
  final TextEditingController _fpermobileCltr = TextEditingController();
  final TextEditingController _mnameCltr = TextEditingController();
  final TextEditingController _mOccupassionCltr = TextEditingController();
  final TextEditingController _meduCltr = TextEditingController();
  final TextEditingController _mpermobileCltr = TextEditingController();
  final TextEditingController _wnameCltr = TextEditingController();
  final TextEditingController _wOccupassionCltr = TextEditingController();
  final TextEditingController _weduCltr = TextEditingController();
  final TextEditingController _wpermobileCltr = TextEditingController();
  final TextEditingController _bnameCltr = TextEditingController();
  final TextEditingController _bOccupassionCltr = TextEditingController();
  final TextEditingController _beduCltr = TextEditingController();
  final TextEditingController _bpermobileCltr = TextEditingController();
  final TextEditingController _nnameCltr = TextEditingController();
  final TextEditingController _ndobCltr = TextEditingController();
  final TextEditingController _nrelativeCltr = TextEditingController();
  final TextEditingController _nageCltr = TextEditingController();
  final TextEditingController _10SubjectCltr = TextEditingController();
  final TextEditingController _10yearCltr = TextEditingController();
  final TextEditingController _10gradeCltr = TextEditingController();
  final TextEditingController _12SubjectCltr = TextEditingController();
  final TextEditingController _12yearCltr = TextEditingController();
  final TextEditingController _12gradeCltr = TextEditingController();
  final TextEditingController _subgradeCltr = TextEditingController();
  final TextEditingController _passgradeCltr = TextEditingController();
  final TextEditingController _GradegradeCltr = TextEditingController();
  final TextEditingController _subpostCltr = TextEditingController();
  final TextEditingController _passpostcltr = TextEditingController();
  final TextEditingController _GradepostCltr = TextEditingController();
  final TextEditingController _subITICltr = TextEditingController();
  final TextEditingController _passITIcltr = TextEditingController();
  final TextEditingController _GradeITICltr = TextEditingController();
  final TextEditingController _namecerCltr = TextEditingController();
  final TextEditingController _yearcerCltr = TextEditingController();
  final TextEditingController _nametraingCltr = TextEditingController();
  final TextEditingController _yeartraingCltr = TextEditingController();
  final TextEditingController _nameprizCltr = TextEditingController();
  final TextEditingController _yearprizeCltr = TextEditingController();
  final TextEditingController _fcompanyCltr = TextEditingController();
  final TextEditingController _fdesignationCltr = TextEditingController();
  final TextEditingController _fyearCltr = TextEditingController();
  final TextEditingController _salaryCltr = TextEditingController();
  final TextEditingController _scompanyCltr = TextEditingController();
  final TextEditingController _sdesignationCltr = TextEditingController();
  final TextEditingController _syearCltr = TextEditingController();
  final TextEditingController _ssalaryCltr = TextEditingController();
  final TextEditingController _tcompanyCltr = TextEditingController();
  final TextEditingController _tdesignationCltr = TextEditingController();
  final TextEditingController _tyearCltr = TextEditingController();
  final TextEditingController _tsalaryCltr = TextEditingController();
  final TextEditingController _mobileCltr = TextEditingController();
  final TextEditingController _pmobileCltr = TextEditingController();
  final TextEditingController _experienceCltr = TextEditingController();
  final TextEditingController _dukenameCltr = TextEditingController();
  final TextEditingController _signCltr = TextEditingController();
  final TextEditingController _personrefCltr = TextEditingController();
  final TextEditingController _signrefCltr = TextEditingController();
  final GetXNetworkManager _networkManager = Get.put(GetXNetworkManager());
  File _pImageadharcard;
  File _pImageelectioncard;
  File _pImagerationcard1;
  File _pImagerationcard2;
  File _pImagepancard;
  File _pImagepassphoto;
  File _pImageMarksheet;
  File _pImageCertificate;
  File _pImageLC1;
  File _pImageLc2;
  File _pImagesalary;
  File _pappointment;
  String gender;
  String formattedDate;

  var adharCard;
  var electionCard;
  var rationCard;
  var rationCard1;
  var pancard;
  var photo;
  var marksheet;
  var certy;
  var LC1;
  var LC2;
  var salary;
  var appointment;

  Future uploadInterviewAPI() async {
    var request = http.MultipartRequest('POST', Uri.parse(interviewformAPIURL));
    request.fields['FullName'] = _nameCltr.text.isEmpty ? "" : _nameCltr.text;
    request.fields['PresentAddress'] =
        _addressCltr.text.isEmpty ? "" : _addressCltr.text;
    request.fields['PresentPost'] =
        _postCltr.text.isEmpty ? "" : _postCltr.text;
    request.fields['PresentVillage'] =
        _cityCltr.text.isEmpty ? "" : _cityCltr.text;
    request.fields['PresentDistrict'] =
        _districtCltr.text.isEmpty ? "" : _districtCltr.text;
    request.fields['PresentPinCode'] =
        _pincodeCltr.text.isEmpty ? "" : _pincodeCltr.text;
    request.fields['PresentMobileNo'] =
        _mobileCltr.text.isEmpty ? "" : _mobileCltr.text;
    request.fields['PermanentAddress'] =
        _addressCltr.text.isEmpty ? "" : _addressCltr.text;
    request.fields['PermanentPost'] =
        _postCltr.text.isEmpty ? "" : _postCltr.text;
    request.fields['PermanentVillage'] =
        _pcityCltr.text.isEmpty ? "" : _pcityCltr.text;
    request.fields['PermanentDistrict'] =
        _pdistrictCltr.text.isEmpty ? "" : _pdistrictCltr.text;
    request.fields['PermanentPinCode'] =
        _ppincodeCltr.text.isEmpty ? "" : _ppincodeCltr.text;
    request.fields['PermanentMobileNo'] =
        _pmobileCltr.text.isEmpty ? "" : _pmobileCltr.text;
    request.fields['DOB'] = fromDateCltr.text;
    // dateinput.text.isEmpty ? "" : dateinput.text.toString();
    // _dateofbirthCltr.text.isEmpty ? "" : _dateofbirthCltr.text;
    request.fields['YourBloodGroup'] =
        _bloodCltr.text.isEmpty ? "" : _bloodCltr.text;
    request.fields['YourAadharCardNo'] =
        _adharcardCltr.text.isEmpty ? "" : _adharcardCltr.text;
    request.fields['YourPanCardNo'] =
        _panCardCltr.text.isEmpty ? "" : _panCardCltr.text;
    request.fields['YourElectionCardNo'] =
        _electionCltr.text.isEmpty ? "" : _electionCltr.text;
    request.fields['Category'] = gender == "" ? "" : gender.toString();
    request.fields['YourEmail'] =
        _emailCltr.text.isEmpty ? "" : _emailCltr.text;
    request.fields['FatherName'] =
        _fnameCltr.text.isEmpty ? "" : _fnameCltr.text;
    request.fields['FatherOccupation'] =
        _fOccupassionCltr.text.isEmpty ? "" : _fOccupassionCltr.text;
    request.fields['FatherEducation'] =
        _feduCltr.text.isEmpty ? "" : _feduCltr.text;
    request.fields['FatherMobileNo'] =
        _fpermobileCltr.text.isEmpty ? "" : _fpermobileCltr.text;
    request.fields['MotherName'] =
        _mnameCltr.text.isEmpty ? "" : _mnameCltr.text;
    request.fields['MotherOccupation'] =
        _mOccupassionCltr.text.isEmpty ? "" : _mOccupassionCltr.text;
    request.fields['MotherEducation'] =
        _meduCltr.text.isEmpty ? "" : _meduCltr.text;
    request.fields['MotherMobileNo'] =
        _mpermobileCltr.text.isEmpty ? "" : _mpermobileCltr.text;
    request.fields['WifeName'] = _wnameCltr.text.isEmpty ? "" : _wnameCltr.text;
    request.fields['WifeOccupation'] =
        _wOccupassionCltr.text.isEmpty ? "" : _wOccupassionCltr.text;
    request.fields['WifeEducation'] =
        _weduCltr.text.isEmpty ? "" : _weduCltr.text;
    request.fields['WifeMobileNo'] =
        _wpermobileCltr.text.isEmpty ? "" : _wpermobileCltr.text;
    request.fields['BrotherName'] =
        _bnameCltr.text.isEmpty ? "" : _bnameCltr.text;
    request.fields['BrotherOccupation'] =
        _bOccupassionCltr.text.isEmpty ? "" : _bOccupassionCltr.text;
    request.fields['BrotherEducation'] =
        _beduCltr.text.isEmpty ? "" : _beduCltr.text;
    request.fields['BrotherMobileNo'] =
        _bpermobileCltr.text.isEmpty ? "" : _bpermobileCltr.text;
    request.fields['NomineeName'] =
        _nnameCltr.text.isEmpty ? "" : _nnameCltr.text;
    request.fields['NomineeDOB'] = _ndobCltr.text.isEmpty ? "" : _ndobCltr.text;
    request.fields['NomineeRelation'] =
        _nrelativeCltr.text.isEmpty ? "" : _nrelativeCltr.text;
    request.fields['NomineeAge'] = _nageCltr.text.isEmpty ? "" : _nageCltr.text;
    request.fields['Standanrd10Subject'] =
        _nageCltr.text.isEmpty ? "" : _nageCltr.text;
    request.fields['Standanrd10PassingYear'] =
        _10yearCltr.text.isEmpty ? "" : _10yearCltr.text;
    request.fields['Standanrd10Percentage'] =
        _10gradeCltr.text.isEmpty ? "" : _10gradeCltr.text;
    request.fields['Standanrd12Subject'] =
        _12SubjectCltr.text.isEmpty ? "" : _12SubjectCltr.text;
    request.fields['Standanrd12PassingYear'] =
        _12yearCltr.text.isEmpty ? "" : _12yearCltr.text;
    request.fields['Standanrd12Percentage'] =
        _12gradeCltr.text.isEmpty ? "" : _12gradeCltr.text;
    request.fields['GraduateSubject'] =
        _subgradeCltr.text.isEmpty ? "" : _subgradeCltr.text;
    request.fields['GraduatePassingYear'] =
        _passgradeCltr.text.isEmpty ? "" : _passgradeCltr.text;
    request.fields['GraduatePercentage'] =
        _GradegradeCltr.text.isEmpty ? "" : _GradegradeCltr.text;
    request.fields['PostGraduateSubject'] =
        _subpostCltr.text.isEmpty ? "" : _subpostCltr.text;
    request.fields['PostGraduatePassingYear'] =
        _passpostcltr.text.isEmpty ? "" : _passpostcltr.text;
    request.fields['PostGraduatePercentage'] =
        _GradepostCltr.text.isEmpty ? "" : _GradepostCltr.text;
    request.fields['OtherSubject'] =
        _subITICltr.text.isEmpty ? "" : _subITICltr.text;
    request.fields['OtherPassingYear'] =
        _passITIcltr.text.isEmpty ? "" : _passITIcltr.text;
    request.fields['OtherPercentage'] =
        _GradeITICltr.text.isEmpty ? "" : _GradeITICltr.text;
    request.fields['CertificateCourseName'] =
        _namecerCltr.text.isEmpty ? "" : _namecerCltr.text;
    request.fields['CertificateCourseYear'] =
        _yearcerCltr.text.isEmpty ? "" : _yearcerCltr.text;
    request.fields['TrainingName'] =
        _nametraingCltr.text.isEmpty ? "" : _nametraingCltr.text;
    request.fields['TrainingYear'] =
        _yeartraingCltr.text.isEmpty ? "" : _yeartraingCltr.text;
    request.fields['MedalName'] =
        _nameprizCltr.text.isEmpty ? "" : _nameprizCltr.text;
    request.fields['MedalYear'] =
        _yearprizeCltr.text.isEmpty ? "" : _yearprizeCltr.text;
    request.fields['FirstCompanyName'] =
        _fnameCltr.text.isEmpty ? "" : _fnameCltr.text;
    request.fields['FirstCompanyDesignation'] =
        _fdesignationCltr.text.isEmpty ? "" : _fdesignationCltr.text;
    request.fields['FirstCompanyExp'] =
        _fyearCltr.text.isEmpty ? "" : _fyearCltr.text;
    request.fields['FirstCompanySalary'] =
        _salaryCltr.text.isEmpty ? "" : _salaryCltr.text;
    request.fields['SecondCompanyName'] =
        _scompanyCltr.text.isEmpty ? "" : _scompanyCltr.text;
    request.fields['SecondCompanyDesignation'] =
        _sdesignationCltr.text.isEmpty ? "" : _sdesignationCltr.text;
    request.fields['SecondCompanyExp'] =
        _syearCltr.text.isEmpty ? "" : _syearCltr.text;
    request.fields['SecondCompanySalary'] =
        _ssalaryCltr.text.isEmpty ? "" : _ssalaryCltr.text;
    request.fields['ThirdCompanyName'] =
        _tcompanyCltr.text.isEmpty ? "" : _tcompanyCltr.text;
    request.fields['ThirdCompanyDesignation'] =
        _tdesignationCltr.text.isEmpty ? "" : _tdesignationCltr.text;
    request.fields['ThirdCompanyExp'] =
        _tsalaryCltr.text.isEmpty ? "" : _tsalaryCltr.text;
    request.fields['ThirdCompanySalary'] =
        _tsalaryCltr.text.isEmpty ? "" : _tsalaryCltr.text;
    request.fields['OtherExpNoExpDetails'] =
        _experienceCltr.text.isEmpty ? "" : _experienceCltr.text;
    request.fields['DukeReferenceName'] =
        _dukenameCltr.text.isEmpty ? "" : _dukenameCltr.text;
    request.fields['DukeReferenceSign'] =
        _signCltr.text.isEmpty ? "" : _signCltr.text;
    request.fields['OtherReferenceName'] =
        _personrefCltr.text.isEmpty ? "" : _personrefCltr.text;
    request.fields['OtherReferenceSign'] =
        _signrefCltr.text.isEmpty ? "" : _signrefCltr.text;
// adharcard
    _pImageadharcard != null
        ? adharCard = await http.MultipartFile.fromPath(
            "Document1Path1", _pImageadharcard.path)
        : request.fields['Document1Path1'] = "";

    fileadhar != null
        ? adharCard =
            await http.MultipartFile.fromPath("Document1Path1", fileadhar)
        : request.fields['Document1Path1'] = "";

    _pImageadharcard != null ? request.files.add(adharCard) : null;
    fileadhar != null ? request.files.add(adharCard) : null;
// election card
    _pImageelectioncard != null
        ? electionCard = await http.MultipartFile.fromPath(
            "Document1Path2", _pImageelectioncard.path)
        : request.fields['Document1Path2'] = "";

    fileelec != null
        ? electionCard =
            await http.MultipartFile.fromPath("Document1Path2", fileelec)
        : request.fields['Document1Path2'] = "";

    _pImageelectioncard != null ? request.files.add(electionCard) : null;
    fileelec != null ? request.files.add(electionCard) : null;
// ration1 card
    _pImagerationcard1 != null
        ? rationCard = await http.MultipartFile.fromPath(
            "Document2Path1", _pImagerationcard1.path)
        : request.fields['Document2Path1'] = "";

    fileration != null
        ? rationCard =
            await http.MultipartFile.fromPath("Document2Path1", fileration)
        : request.fields['Document2Path1'] = "";

    _pImagerationcard1 != null ? request.files.add(rationCard) : null;
    fileration != null ? request.files.add(rationCard) : null;
// ration card 2
    _pImagerationcard2 != null
        ? rationCard1 = await http.MultipartFile.fromPath(
            "Document2Path2", _pImagerationcard2.path)
        : request.fields['Document2Path2'] = "";

    fileration1 != null
        ? rationCard1 =
            await http.MultipartFile.fromPath("Document2Path2", fileration1)
        : request.fields['Document2Path2'] = "";

    _pImagerationcard2 != null ? request.files.add(rationCard1) : null;
    fileration1 != null ? request.files.add(rationCard1) : null;
//Pan Card
    _pImagepancard != null
        ? pancard = await http.MultipartFile.fromPath(
            "Document3Path1", _pImagepancard.path)
        : request.fields['Document3Path1'] = "";

    filepancard != null
        ? pancard =
            await http.MultipartFile.fromPath("Document3Path1", filepancard)
        : request.fields['Document3Path1'] = "";

    _pImagepancard != null ? request.files.add(pancard) : null;
    fileadhar != null ? request.files.add(pancard) : null;
// photo
    _pImagepassphoto != null
        ? photo = await http.MultipartFile.fromPath(
            "Document3Path2", _pImagepassphoto.path)
        : request.fields['Document3Path2'] = "";

    filephoto != null
        ? photo = await http.MultipartFile.fromPath("Document3Path2", filephoto)
        : request.fields['Document3Path2'] = "";

    _pImagepassphoto != null ? request.files.add(photo) : null;
    filephoto != null ? request.files.add(photo) : null;
// marksheet
    _pImageMarksheet != null
        ? marksheet = await http.MultipartFile.fromPath(
            "Document4Path1", _pImageMarksheet.path)
        : request.fields['Document4Path1'] = "";

    filemarksheet != null
        ? marksheet =
            await http.MultipartFile.fromPath("Document4Path1", filemarksheet)
        : request.fields['Document4Path1'] = "";

    _pImageMarksheet != null ? request.files.add(marksheet) : null;
    filemarksheet != null ? request.files.add(marksheet) : null;

// certificate
    _pImageCertificate != null
        ? certy = await http.MultipartFile.fromPath(
            "Document4Path2", _pImageCertificate.path)
        : request.fields['Document4Path2'] = "";

    filecerty != null
        ? certy = await http.MultipartFile.fromPath("Document4Path2", filecerty)
        : request.fields['Document4Path2'] = "";

    _pImageCertificate != null ? request.files.add(certy) : null;
    filecerty != null ? request.files.add(certy) : null;

//LC1
    _pImageLC1 != null
        ? LC1 =
            await http.MultipartFile.fromPath("Document5Path1", _pImageLC1.path)
        : request.fields['Document5Path1'] = "";

    fileLC1 != null
        ? LC1 = await http.MultipartFile.fromPath("Document5Path1", fileLC1)
        : request.fields['Document5Path1'] = "";

    _pImageLC1 != null ? request.files.add(LC1) : null;
    fileLC1 != null ? request.files.add(LC1) : null;
//LC2

    _pImageLc2 != null
        ? LC2 =
            await http.MultipartFile.fromPath("Document5Path2", _pImageLc2.path)
        : request.fields['Document5Path2'] = "";

    fileLC2 != null
        ? LC2 = await http.MultipartFile.fromPath("Document5Path2", fileLC2)
        : request.fields['Document5Path2'] = "";

    _pImageLc2 != null ? request.files.add(LC2) : null;
    fileLC2 != null ? request.files.add(LC2) : null;
// Salary
    _pImagesalary != null
        ? salary = await http.MultipartFile.fromPath(
            "Document6Path1", _pImagesalary.path)
        : request.fields['Document6Path1'] = "";

    filesalary != null
        ? salary =
            await http.MultipartFile.fromPath("Document6Path1", filesalary)
        : request.fields['Document6Path1'] = "";

    _pImagesalary != null ? request.files.add(salary) : null;
    filesalary != null ? request.files.add(salary) : null;

// appointment
    _pappointment != null
        ? appointment = await http.MultipartFile.fromPath(
            "Document6Path2", _pappointment.path)
        : request.fields['Document6Path2'] = "";

    fileappointment != null
        ? appointment =
            await http.MultipartFile.fromPath("Document6Path2", fileappointment)
        : request.fields['Document6Path2'] = "";

    _pappointment != null ? request.files.add(appointment) : null;
    fileappointment != null ? request.files.add(appointment) : null;

    var response = await request.send();

    var responsed = await http.Response.fromStream(response);
    final responseJson = json.decode(responsed.body);

    if (responseJson['status'] == "200") {
      print("Data Added Successfully");
      snackBar(context, responseJson['result']);
    } else {
      snackBar(context, responseJson['message']);
      print(responseJson['message']);
    }

    print(responseJson);
    return responseJson;
  }

  final picker = ImagePicker();
  Future pickImage({ImageSource source}) async {
    var pickedImage = await picker.pickImage(
      source: source,
    );
    setState(() {
      _pImageadharcard = File(pickedImage.path);
    });
  }

  Future elecImage({ImageSource source}) async {
    var pickedImage = await picker.pickImage(
      source: source,
    );
    setState(() {
      _pImageelectioncard = File(pickedImage.path);
    });
  }

  Future ration1Image({ImageSource source}) async {
    var pickedImage = await picker.pickImage(
      source: source,
    );
    setState(() {
      _pImagerationcard1 = File(pickedImage.path);
    });
  }

  Future ration2Image({ImageSource source}) async {
    var pickedImage = await picker.pickImage(
      source: source,
    );
    setState(() {
      _pImagerationcard2 = File(pickedImage.path);
    });
  }

  Future pancardImage({ImageSource source}) async {
    var pickedImage = await picker.pickImage(
      source: source,
    );
    setState(() {
      _pImagepancard = File(pickedImage.path);
    });
  }

  Future passphotoImage({ImageSource source}) async {
    var pickedImage = await picker.pickImage(
      source: source,
    );
    setState(() {
      _pImagepassphoto = File(pickedImage.path);
    });
  }

  Future marksheetImage({ImageSource source}) async {
    var pickedImage = await picker.pickImage(
      source: source,
    );
    setState(() {
      _pImageMarksheet = File(pickedImage.path);
    });
  }

  Future certificateImage({ImageSource source}) async {
    var pickedImage = await picker.pickImage(
      source: source,
    );
    setState(() {
      _pImageCertificate = File(pickedImage.path);
    });
  }

  Future LC1Image({ImageSource source}) async {
    var pickedImage = await picker.pickImage(
      source: source,
    );
    setState(() {
      _pImageLC1 = File(pickedImage.path);
    });
  }

  Future LC2Image({ImageSource source}) async {
    var pickedImage = await picker.pickImage(
      source: source,
    );
    setState(() {
      _pImageLc2 = File(pickedImage.path);
    });
  }

  Future salaryImage({ImageSource source}) async {
    var pickedImage = await picker.pickImage(
      source: source,
    );
    setState(() {
      _pImagesalary = File(pickedImage.path);
    });
  }

  Future appointImage({ImageSource source}) async {
    var pickedImage = await picker.pickImage(
      source: source,
    );
    setState(() {
      _pappointment = File(pickedImage.path);
    });
  }

// Document Upload Files
  String fileadhar;
  String adharFileName;
  Future pickFile() async {
    try {
      FilePickerResult result = await FilePicker.platform.pickFiles();
      if (result != null) {
        PlatformFile file = result.files.first;
        setState(() {
          fileadhar = file.path;
          adharFileName = file.name;
        });
      } else {
        snackBar(context, "No file attach.");
      }
    } on PlatformException catch (e) {
      snackBar(context, "$adharFileName is Selected");
      print('Failed to pick file: $e');
    }
  }

//elce
  String fileelec;
  String elecFileName;
  Future pickelec() async {
    try {
      FilePickerResult result = await FilePicker.platform.pickFiles();
      if (result != null) {
        PlatformFile file = result.files.first;
        setState(() {
          fileelec = file.path;
          elecFileName = file.name;
        });
      } else {
        snackBar(context, "No file attach.");
      }
    } on PlatformException catch (e) {
      snackBar(context, "$elecFileName is Selected");
      print('Failed to pick file: $e');
    }
  }

//ration
  String fileration;
  String rationFileName;
  Future pickration() async {
    try {
      FilePickerResult result = await FilePicker.platform.pickFiles();
      if (result != null) {
        PlatformFile file = result.files.first;
        setState(() {
          fileration = file.path;
          rationFileName = file.name;
        });
      } else {
        snackBar(context, "No file attach.");
      }
    } on PlatformException catch (e) {
      snackBar(context, "$rationFileName is Selected");
      print('Failed to pick file: $e');
    }
  }

  // ration 2
  String fileration1;
  String ration1FileName;
  Future pickration1() async {
    try {
      FilePickerResult result = await FilePicker.platform.pickFiles();
      if (result != null) {
        PlatformFile file = result.files.first;
        setState(() {
          fileration1 = file.path;
          ration1FileName = file.name;
        });
      } else {
        snackBar(context, "No file attach.");
      }
    } on PlatformException catch (e) {
      snackBar(context, "$ration1FileName is Selected");
      print('Failed to pick file: $e');
    }
  }

  //pan card
  String filepancard;
  String pancardFileName;
  Future pickpancard() async {
    try {
      FilePickerResult result = await FilePicker.platform.pickFiles();
      if (result != null) {
        PlatformFile file = result.files.first;
        setState(() {
          filepancard = file.path;
          pancardFileName = file.name;
        });
      } else {
        snackBar(context, "No file attach.");
      }
    } on PlatformException catch (e) {
      snackBar(context, "$pancardFileName is Selected");
      print('Failed to pick file: $e');
    }
  }

//photo
  String filephoto;
  String photoFileName;
  Future pickphotot() async {
    try {
      FilePickerResult result = await FilePicker.platform.pickFiles();
      if (result != null) {
        PlatformFile file = result.files.first;
        setState(() {
          filephoto = file.path;
          photoFileName = file.name;
        });
      } else {
        snackBar(context, "No file attach.");
      }
    } on PlatformException catch (e) {
      snackBar(context, "$photoFileName is Selected");
      print('Failed to pick file: $e');
    }
  }

  // Marksheet
  String filemarksheet;
  String marksheetFileName;
  Future pickmarksheet() async {
    try {
      FilePickerResult result = await FilePicker.platform.pickFiles();
      if (result != null) {
        PlatformFile file = result.files.first;
        setState(() {
          filemarksheet = file.path;
          marksheetFileName = file.name;
        });
      } else {
        snackBar(context, "No file attach.");
      }
    } on PlatformException catch (e) {
      snackBar(context, "$marksheetFileName is Selected");
      print('Failed to pick file: $e');
    }
  }
//  Certificate

  String filecerty;
  String certyFileName;
  Future pickcerty() async {
    try {
      FilePickerResult result = await FilePicker.platform.pickFiles();
      if (result != null) {
        PlatformFile file = result.files.first;
        setState(() {
          filecerty = file.path;
          certyFileName = file.name;
        });
      } else {
        snackBar(context, "No file attach.");
      }
    } on PlatformException catch (e) {
      snackBar(context, "$certyFileName is Selected");
      print('Failed to pick file: $e');
    }
  }

  // LC1
  String fileLC1;
  String LC1FileName;
  Future pickLC1() async {
    try {
      FilePickerResult result = await FilePicker.platform.pickFiles();
      if (result != null) {
        PlatformFile file = result.files.first;
        setState(() {
          fileLC1 = file.path;
          LC1FileName = file.name;
        });
      } else {
        snackBar(context, "No file attach.");
      }
    } on PlatformException catch (e) {
      snackBar(context, "$LC1FileName is Selected");
      print('Failed to pick file: $e');
    }
  }

  // LC2
  String fileLC2;
  String LC2FileName;
  Future pickLC2() async {
    try {
      FilePickerResult result = await FilePicker.platform.pickFiles();
      if (result != null) {
        PlatformFile file = result.files.first;
        setState(() {
          fileLC2 = file.path;
          LC2FileName = file.name;
        });
      } else {
        snackBar(context, "No file attach.");
      }
    } on PlatformException catch (e) {
      snackBar(context, "$LC2FileName is Selected");
      print('Failed to pick file: $e');
    }
  }

  String filesalary;
  String salaryFileName;
  Future picksalary() async {
    try {
      FilePickerResult result = await FilePicker.platform.pickFiles();
      if (result != null) {
        PlatformFile file = result.files.first;
        setState(() {
          filesalary = file.path;
          salaryFileName = file.name;
        });
      } else {
        snackBar(context, "No file attach.");
      }
    } on PlatformException catch (e) {
      snackBar(context, "$salaryFileName is Selected");
      print('Failed to pick file: $e');
    }
  }

  String fileappointment;
  String appointmentFileName;
  Future pickapp() async {
    try {
      FilePickerResult result = await FilePicker.platform.pickFiles();
      if (result != null) {
        PlatformFile file = result.files.first;
        setState(() {
          fileappointment = file.path;
          appointmentFileName = file.name;
        });
      } else {
        snackBar(context, "No file attach.");
      }
    } on PlatformException catch (e) {
      snackBar(context, "$salaryFileName is Selected");
      print('Failed to pick file: $e');
    }
  }

  // Show Dialog For Check Image pick , Gallery Image pick and, Doc Pick
  Future<void> _showMyDialog(VoidCallback onPressed, VoidCallback onPressed1,
      VoidCallback onPressed2) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return SimpleDialog(
          title: const Text("Add Photo"),
          children: <Widget>[
            SimpleDialogOption(
              child: const Text('Take Photo'),
              onPressed: onPressed,
            ),
            SimpleDialogOption(
                child: const Text('Choose form Gallery'),
                onPressed: onPressed1),
            SimpleDialogOption(
                child: const Text('Attach document'), onPressed: onPressed2),
            SimpleDialogOption(
              child: const Text(
                'Cancel',
                style: TextStyle(color: textColor, fontSize: 14),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      
        leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
            onPressed: () => Get.back()),
        elevation: 5,
        backgroundColor: textColor,
        automaticallyImplyLeading: false,
        // leading: Image.asset("assets/images/research.png", height: 20),
        title: InkWell(
          onTap: () {
            Get.to(
              () => InterviewUpload(),
            );
          },
          child: const Text(
            "Interview Form",
            style: TextStyle(
                fontWeight: FontWeight.w700, color: Colors.white, fontSize: 24),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Helper().customTextField(
                controller: _nameCltr,
                isEnabled: true,
                obscureText: false,
                context: context,
                hintText: "Full Name (Same as Aadhar Card)",
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(5.0),
              child: Text(
                "Present Address",
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: textColor,
                    fontSize: 18),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: SizeConfig.screenHeight,
                width: MediaQuery.of(context).size.width,
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  elevation: 4,
                  child: Column(
                    children: [
                      Helper().customTextField(
                        controller: _addressCltr,
                        isEnabled: true,
                        obscureText: false,
                        context: context,
                        hintText: "Address",
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Helper().customTextField(
                        controller: _postCltr,
                        isEnabled: true,
                        obscureText: false,
                        context: context,
                        hintText: "Post",
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Helper().customTextField(
                        controller: _cityCltr,
                        isEnabled: true,
                        obscureText: false,
                        context: context,
                        hintText: "Village/City",
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Helper().customTextField(
                        controller: _districtCltr,
                        isEnabled: true,
                        obscureText: false,
                        context: context,
                        hintText: "District",
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Helper().customTextField(
                        type: TextInputType.number,
                        mLength: 6,
                        controller: _pincodeCltr,
                        isEnabled: true,
                        obscureText: false,
                        context: context,
                        hintText: "Pin code",
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Helper().customTextField(
                        mLength: 10,
                        type: TextInputType.number,
                        controller: _mobileCltr,
                        isEnabled: true,
                        obscureText: false,
                        context: context,
                        hintText: "Permanent Mobile Num.",
                      ),
                      const SizedBox(
                        height: 5,
                      )
                    ],
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(5.0),
              child: Text(
                "Perment Address",
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: textColor,
                    fontSize: 18),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: SizeConfig.screenHeight,
                width: MediaQuery.of(context).size.width,
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  elevation: 4,
                  child: Column(
                    children: [
                      Helper().customTextField(
                        controller: _paddressCltr,
                        isEnabled: true,
                        obscureText: false,
                        context: context,
                        hintText: "Address",
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Helper().customTextField(
                        controller: _ppostCltr,
                        isEnabled: true,
                        obscureText: false,
                        context: context,
                        hintText: "Post",
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Helper().customTextField(
                        controller: _pcityCltr,
                        isEnabled: true,
                        obscureText: false,
                        context: context,
                        hintText: "Village/City",
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Helper().customTextField(
                        controller: _pdistrictCltr,
                        isEnabled: true,
                        obscureText: false,
                        context: context,
                        hintText: "District",
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Helper().customTextField(
                        type: TextInputType.number,
                        mLength: 6,
                        controller: _ppincodeCltr,
                        isEnabled: true,
                        obscureText: false,
                        context: context,
                        hintText: "Pin code",
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Helper().customTextField(
                        controller: _pmobileCltr,
                        mLength: 10,
                        type: TextInputType.number,
                        isEnabled: true,
                        obscureText: false,
                        context: context,
                        hintText: "Permanent Mobile Num.",
                      ),
                      const SizedBox(
                        height: 5,
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: SizeConfig.screenHeight,
                width: MediaQuery.of(context).size.width,
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  elevation: 4,
                  child: Column(
                    children: [
                      ListTile(
                          title: Text(
                            "Date From",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                          subtitle: GestureDetector(
                            onTap: () async {
                              // allDateEnable1(context, fromDateCltr);
                              DateTime pickedDate = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(1950),
                                  //DateTime.now() - not to allow to choose before today.
                                  lastDate: DateTime(2100));

                              if (pickedDate != null) {
                                print(
                                    pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                                String formattedDate = DateFormat('dd-MMM-yyyy')
                                    .format(pickedDate);
                                print(
                                    formattedDate); //formatted date output using intl package =>  2021-03-16
                                setState(() {
                                  fromDateCltr.text =
                                      formattedDate; //set output date to TextField value.
                                });
                              } else {}
                            },
                            child: TextField(
                                controller: fromDateCltr,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(10),
                                  enabled: false,
                                  disabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        width: 2, color: Color(0xffb5b3dc)),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  suffixIcon: const Icon(
                                    Icons.date_range,
                                    color: Color(0xffb5b3dc),
                                  ),
                                )),
                          )),
                      // TextField(
                      //   controller: dateinput,
                      //   decoration: const InputDecoration(
                      //       icon: Icon(Icons.calendar_today),
                      //       labelText: "Enter Date"),
                      //   readOnly: true,
                      //   onTap: () async {
                      //     DateTime pickedDate = await showDatePicker(
                      //         context: context,
                      //         initialDate: DateTime.now(),
                      //         firstDate: DateTime(1900),
                      //         lastDate: DateTime(2101));

                      //     if (pickedDate != null) {
                      //       // print(
                      //       //     pickedDate);
                      //       String formattedDate =
                      //           DateFormat('yyyy-MM-dd').format(pickedDate);
                      //       // print(
                      //       //    dateinput.text);
                      //       setState(() {
                      //         dateinput.text = formattedDate;
                      //       });
                      //     } else {
                      //       print("Date is not selected");
                      //     }
                      //   },
                      // ),

                      // Helper().customTextField(
                      //   type: TextInputType.number,
                      //   controller: _dateofbirthCltr,
                      //   isEnabled: true,
                      //   obscureText: false,
                      //   context: context,
                      //   hintText: "Date of Birth (As Per adharCard)",
                      // ),
                      const SizedBox(
                        height: 5,
                      ),
                      Helper().customTextField(
                        controller: _bloodCltr,
                        isEnabled: true,
                        obscureText: false,
                        context: context,
                        hintText: "Blood Group:",
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Helper().customTextField(
                        controller: _adharcardCltr,
                        isEnabled: true,
                        obscureText: false,
                        context: context,
                        hintText: "AadharCard No.",
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Helper().customTextField(
                        controller: _panCardCltr,
                        type: TextInputType.number,
                        isEnabled: true,
                        obscureText: false,
                        context: context,
                        hintText: "Pan Card No.",
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Helper().customTextField(
                        controller: _electionCltr,
                        isEnabled: true,
                        obscureText: false,
                        context: context,
                        hintText: "Election Card No.",
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Helper().customTextField(
                        controller: _emailCltr,
                        type: TextInputType.emailAddress,
                        obscureText: false,
                        context: context,
                        hintText: "Enter Email",
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(right: 250.0),
                        child: Text("Category", style: TextStyle(fontSize: 18)),
                      ),
                      Column(
                        children: [
                          Row(
                            children: [
                              Flexible(
                                flex: 1,
                                child: Row(
                                  children: [
                                    Radio(
                                      value: "General",
                                      groupValue: gender,
                                      onChanged: (value) {
                                        setState(() {
                                          gender = value.toString();
                                        });
                                      },
                                    ),
                                    const Text(
                                      "General",
                                      style: TextStyle(fontSize: 13),
                                    )
                                  ],
                                ),
                              ),
                              Flexible(
                                flex: 1,
                                child: Row(
                                  children: [
                                    Radio(
                                      value: "S.C",
                                      groupValue: gender,
                                      onChanged: (value) {
                                        setState(() {
                                          gender = value.toString();
                                        });
                                      },
                                    ),
                                    const Text("S.C")
                                  ],
                                ),
                              ),
                              Flexible(
                                flex: 1,
                                child: Row(
                                  children: [
                                    Radio(
                                      value: "S.T",
                                      groupValue: gender,
                                      onChanged: (value) {
                                        setState(() {
                                          gender = value.toString();
                                        });
                                      },
                                    ),
                                    const Text("S.T")
                                  ],
                                ),
                              ),
                              Flexible(
                                flex: 1,
                                child: Row(
                                  children: [
                                    Radio(
                                      value: "O.B.C",
                                      groupValue: gender,
                                      onChanged: (value) {
                                        setState(() {
                                          gender = value.toString();
                                        });
                                      },
                                    ),
                                    const Text("O.B.C")
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(5.0),
              child: Text(
                "Family Detail (Same as Ratio Card)",
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: textColor,
                    fontSize: 18),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: SizeConfig.screenHeight,
                width: MediaQuery.of(context).size.width,
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  elevation: 4,
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(right: 220.0),
                        child: Text(
                          "Father Details",
                          style: TextStyle(color: textColor, fontSize: 18),
                        ),
                      ),
                      Helper().customTextField(
                        controller: _fnameCltr,
                        isEnabled: true,
                        obscureText: false,
                        context: context,
                        hintText: "Name",
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Helper().customTextField(
                        controller: _fOccupassionCltr,
                        isEnabled: true,
                        obscureText: false,
                        context: context,
                        hintText: "Occupation",
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Helper().customTextField(
                        controller: _feduCltr,
                        isEnabled: true,
                        obscureText: false,
                        context: context,
                        hintText: "Education",
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Helper().customTextField(
                        controller: _fpermobileCltr,
                        mLength: 10,
                        type: TextInputType.number,
                        isEnabled: true,
                        obscureText: false,
                        context: context,
                        hintText: "Permanent Mobile Number",
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: SizeConfig.screenHeight,
                width: MediaQuery.of(context).size.width,
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  elevation: 4,
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(right: 220.0),
                        child: Text(
                          "Mother Details",
                          style: TextStyle(color: textColor, fontSize: 18),
                        ),
                      ),
                      Helper().customTextField(
                        controller: _mnameCltr,
                        isEnabled: true,
                        obscureText: false,
                        context: context,
                        hintText: "Name",
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Helper().customTextField(
                        controller: _mOccupassionCltr,
                        isEnabled: true,
                        obscureText: false,
                        context: context,
                        hintText: "Occupation",
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Helper().customTextField(
                        controller: _meduCltr,
                        isEnabled: true,
                        obscureText: false,
                        context: context,
                        hintText: "Education",
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Helper().customTextField(
                        mLength: 10,
                        controller: _mpermobileCltr,
                        type: TextInputType.number,
                        isEnabled: true,
                        obscureText: false,
                        context: context,
                        hintText: "Permanent Mobile Number",
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: SizeConfig.screenHeight,
                width: MediaQuery.of(context).size.width,
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  elevation: 4,
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(right: 220.0),
                        child: Text(
                          "Wife Details",
                          style: TextStyle(color: textColor, fontSize: 18),
                        ),
                      ),
                      Helper().customTextField(
                        controller: _wnameCltr,
                        isEnabled: true,
                        obscureText: false,
                        context: context,
                        hintText: "Name",
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Helper().customTextField(
                        controller: _wOccupassionCltr,
                        isEnabled: true,
                        obscureText: false,
                        context: context,
                        hintText: "Occupation",
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Helper().customTextField(
                        controller: _weduCltr,
                        isEnabled: true,
                        obscureText: false,
                        context: context,
                        hintText: "Education",
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Helper().customTextField(
                        mLength: 10,
                        controller: _wpermobileCltr,
                        type: TextInputType.number,
                        isEnabled: true,
                        obscureText: false,
                        context: context,
                        hintText: "Permanent Mobile Number",
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: SizeConfig.screenHeight,
                width: MediaQuery.of(context).size.width,
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  elevation: 4,
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(right: 220.0),
                        child: Text(
                          "Brother Details",
                          style: TextStyle(color: textColor, fontSize: 18),
                        ),
                      ),
                      Helper().customTextField(
                        controller: _bnameCltr,
                        isEnabled: true,
                        obscureText: false,
                        context: context,
                        hintText: "Name",
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Helper().customTextField(
                        controller: _bOccupassionCltr,
                        isEnabled: true,
                        obscureText: false,
                        context: context,
                        hintText: "Occupation",
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Helper().customTextField(
                        controller: _beduCltr,
                        isEnabled: true,
                        obscureText: false,
                        context: context,
                        hintText: "Education",
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Helper().customTextField(
                        mLength: 10,
                        controller: _bpermobileCltr,
                        type: TextInputType.number,
                        isEnabled: true,
                        obscureText: false,
                        context: context,
                        hintText: "Permanent Mobile Number",
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: SizeConfig.screenHeight,
                width: MediaQuery.of(context).size.width,
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  elevation: 4,
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(right: 220.0),
                        child: Text(
                          "nominee Details",
                          style: TextStyle(color: textColor, fontSize: 18),
                        ),
                      ),
                      Helper().customTextField(
                        controller: _nnameCltr,
                        isEnabled: true,
                        obscureText: false,
                        context: context,
                        hintText: "Nominee Name",
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Helper().customTextField(
                        controller: _ndobCltr,
                        isEnabled: true,
                        obscureText: false,
                        context: context,
                        hintText: "Nominee DOB",
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Helper().customTextField(
                        controller: _nrelativeCltr,
                        isEnabled: true,
                        obscureText: false,
                        context: context,
                        hintText: "Nominee Relation",
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Helper().customTextField(
                        controller: _nageCltr,
                        isEnabled: true,
                        obscureText: false,
                        context: context,
                        hintText: "Nominee Age",
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(5.0),
              child: Text(
                "Educational Details (Not any Graduation below)",
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: textColor,
                    fontSize: 18),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: SizeConfig.screenHeight,
                width: MediaQuery.of(context).size.width,
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  elevation: 4,
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(right: 220.0),
                        child: Text(
                          "standard 10",
                          style: TextStyle(color: textColor, fontSize: 18),
                        ),
                      ),
                      Helper().customTextField(
                        controller: _10SubjectCltr,
                        isEnabled: true,
                        obscureText: false,
                        context: context,
                        hintText: "Subject",
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Helper().customTextField(
                        controller: _10yearCltr,
                        isEnabled: true,
                        obscureText: false,
                        context: context,
                        hintText: "Passing Year ",
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Helper().customTextField(
                        controller: _10gradeCltr,
                        isEnabled: true,
                        obscureText: false,
                        context: context,
                        hintText: "Grade Or Percentage",
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: SizeConfig.screenHeight,
                width: MediaQuery.of(context).size.width,
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  elevation: 4,
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(right: 220.0),
                        child: Text(
                          "standard 12",
                          style: TextStyle(color: textColor, fontSize: 18),
                        ),
                      ),
                      Helper().customTextField(
                        controller: _12SubjectCltr,
                        isEnabled: true,
                        obscureText: false,
                        context: context,
                        hintText: "Subject",
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Helper().customTextField(
                        controller: _12yearCltr,
                        isEnabled: true,
                        obscureText: false,
                        context: context,
                        hintText: "Passing Year ",
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Helper().customTextField(
                        controller: _12gradeCltr,
                        isEnabled: true,
                        obscureText: false,
                        context: context,
                        hintText: "Grade Or Percentage",
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: SizeConfig.screenHeight,
                width: MediaQuery.of(context).size.width,
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  elevation: 4,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left:32.0),
                        child: const Text(
                          "Graduation Or Diploma (BA, B.Com, B.Sc etc)",
                          style: TextStyle(color: textColor, fontSize: 18),
                        ),
                      ),
                      Helper().customTextField(
                        controller: _subgradeCltr,
                        isEnabled: true,
                        obscureText: false,
                        context: context,
                        hintText: "Subject",
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Helper().customTextField(
                        controller: _passgradeCltr,
                        isEnabled: true,
                        obscureText: false,
                        context: context,
                        hintText: "Passing Year ",
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Helper().customTextField(
                        controller: _GradegradeCltr,
                        isEnabled: true,
                        obscureText: false,
                        context: context,
                        hintText: "Grade Or Percentage",
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: SizeConfig.screenHeight,
                width: MediaQuery.of(context).size.width,
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  elevation: 4,
                  child: Column(
                    children: [
                      Padding(
                        padding:const EdgeInsets.only(left:32.0),
                        child: const Text(
                          "Post Graduate Or Degree (MA, M.Com, M.Sc etc)",
                          style: TextStyle(color: textColor, fontSize: 18),
                        ),
                      ),
                      Helper().customTextField(
                        controller: _subpostCltr,
                        isEnabled: true,
                        obscureText: false,
                        context: context,
                        hintText: "Subject",
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Helper().customTextField(
                        controller: _passpostcltr,
                        isEnabled: true,
                        obscureText: false,
                        context: context,
                        hintText: "Passing Year ",
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Helper().customTextField(
                        controller: _GradepostCltr,
                        isEnabled: true,
                        obscureText: false,
                        context: context,
                        hintText: "Grade Or Percentage",
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: SizeConfig.screenHeight,
                width: MediaQuery.of(context).size.width,
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  elevation: 4,
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(right: 220.0),
                        child: Text(
                          "ITI or Other",
                          style: TextStyle(color: textColor, fontSize: 18),
                        ),
                      ),
                      Helper().customTextField(
                        controller: _subITICltr,
                        isEnabled: true,
                        obscureText: false,
                        context: context,
                        hintText: "Subject",
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Helper().customTextField(
                        controller: _passITIcltr,
                        isEnabled: true,
                        obscureText: false,
                        context: context,
                        hintText: "Passing Year ",
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Helper().customTextField(
                        controller: _GradeITICltr,
                        isEnabled: true,
                        obscureText: false,
                        context: context,
                        hintText: "Grade Or Percentage",
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(5.0),
              child: Text(
                "Other Educational Details",
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: textColor,
                    fontSize: 18),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: SizeConfig.screenHeight,
                width: MediaQuery.of(context).size.width,
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  elevation: 4,
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(right: 180.0),
                        child: Text(
                          "Certificate Course",
                          style: TextStyle(color: textColor, fontSize: 18),
                        ),
                      ),
                      Helper().customTextField(
                        controller: _namecerCltr,
                        isEnabled: true,
                        obscureText: false,
                        context: context,
                        hintText: "Name",
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Helper().customTextField(
                        controller: _yearcerCltr,
                        isEnabled: true,
                        obscureText: false,
                        context: context,
                        hintText: "Year",
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: SizeConfig.screenHeight,
                width: MediaQuery.of(context).size.width,
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  elevation: 4,
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(right: 180.0),
                        child: Text(
                          "Training Or WorkShop",
                          style: TextStyle(color: textColor, fontSize: 18),
                        ),
                      ),
                      Helper().customTextField(
                        controller: _nametraingCltr,
                        isEnabled: true,
                        obscureText: false,
                        context: context,
                        hintText: "Name",
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Helper().customTextField(
                        controller: _yeartraingCltr,
                        isEnabled: true,
                        obscureText: false,
                        context: context,
                        hintText: "Year",
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: SizeConfig.screenHeight,
                width: MediaQuery.of(context).size.width,
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  elevation: 4,
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(right: 180.0),
                        child: Text(
                          "Received Medal or prize",
                          style: TextStyle(color: textColor, fontSize: 18),
                        ),
                      ),
                      Helper().customTextField(
                        controller: _nameprizCltr,
                        isEnabled: true,
                        obscureText: false,
                        context: context,
                        hintText: "Name",
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Helper().customTextField(
                        controller: _yearprizeCltr,
                        isEnabled: true,
                        obscureText: false,
                        context: context,
                        hintText: "Year",
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(5.0),
              child: Text(
                "Before company Details Information & Experience"
                "(Last Company First Mention)",
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: textColor,
                    fontSize: 18),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: SizeConfig.screenHeight,
                width: MediaQuery.of(context).size.width,
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  elevation: 4,
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(right: 200.0),
                        child: Text(
                          "First Company",
                          style: TextStyle(color: textColor, fontSize: 18),
                        ),
                      ),
                      Helper().customTextField(
                        controller: _fcompanyCltr,
                        isEnabled: true,
                        obscureText: false,
                        context: context,
                        hintText: "Company Name & Address ",
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Helper().customTextField(
                        controller: _fdesignationCltr,
                        isEnabled: true,
                        obscureText: false,
                        context: context,
                        hintText: "Designation",
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Helper().customTextField(
                        controller: _fyearCltr,
                        type: TextInputType.number,
                        isEnabled: true,
                        obscureText: false,
                        context: context,
                        hintText: "Experience (Total Year)",
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Helper().customTextField(
                        controller: _salaryCltr,
                        isEnabled: true,
                        obscureText: false,
                        context: context,
                        hintText: "Detail Of salary Last Drawn",
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: SizeConfig.screenHeight,
                width: MediaQuery.of(context).size.width,
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  elevation: 4,
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(right: 200.0),
                        child: Text(
                          "Second Company",
                          style: TextStyle(color: textColor, fontSize: 18),
                        ),
                      ),
                      Helper().customTextField(
                        controller: _scompanyCltr,
                        isEnabled: true,
                        obscureText: false,
                        context: context,
                        hintText: "Company Name & Address ",
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Helper().customTextField(
                        controller: _sdesignationCltr,
                        isEnabled: true,
                        obscureText: false,
                        context: context,
                        hintText: "Designation",
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Helper().customTextField(
                        type: TextInputType.number,
                        controller: _syearCltr,
                        isEnabled: true,
                        obscureText: false,
                        context: context,
                        hintText: "Experience (Total Year)",
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Helper().customTextField(
                        controller: _ssalaryCltr,
                        isEnabled: true,
                        obscureText: false,
                        context: context,
                        hintText: "Detail Of salary Last Drawn",
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: SizeConfig.screenHeight,
                width: MediaQuery.of(context).size.width,
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  elevation: 4,
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(right: 200.0),
                        child: Text(
                          "Third Company",
                          style: TextStyle(color: textColor, fontSize: 18),
                        ),
                      ),
                      Helper().customTextField(
                        controller: _tcompanyCltr,
                        isEnabled: true,
                        obscureText: false,
                        context: context,
                        hintText: "Company Name & Address ",
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Helper().customTextField(
                        controller: _tdesignationCltr,
                        isEnabled: true,
                        obscureText: false,
                        context: context,
                        hintText: "Designation",
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Helper().customTextField(
                        type: TextInputType.number,
                        controller: _tyearCltr,
                        isEnabled: true,
                        obscureText: false,
                        context: context,
                        hintText: "Experience (Total Year)",
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Helper().customTextField(
                        controller: _tsalaryCltr,
                        isEnabled: true,
                        obscureText: false,
                        context: context,
                        hintText: "Detail Of salary Last Drawn",
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 50.0),
              child: Helper().customTextField(
                controller: _experienceCltr,
                isEnabled: true,
                obscureText: false,
                context: context,
                hintText: "No Experience Details",
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(5.0),
              child: Text(
                "Before Document Uploaded This Form Attached ",
                // "(Attached Document Tick Mark)",
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: textColor,
                    fontSize: 18),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            const Padding(
              padding: EdgeInsets.all(5.0),
              child: Text(
                "Election Card & Aadhar Card (Both Mandatory)",
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: textColor,
                    fontSize: 16),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 25.0, left: 25),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        _pImageadharcard = null;
                        adharFileName = null;
                      });
                      _showMyDialog(() {
                        Get.back();
                        pickImage(source: ImageSource.camera);
                      }, () {
                        Get.back();
                        pickImage(source: ImageSource.gallery);
                      }, () {
                        Get.back();
                        pickFile();
                        // _selectResume(_pImageadharcard);
                      });
                    },
                    child: Card(
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                        ),
                        height: MediaQuery.of(context).size.width / 2,
                        width: MediaQuery.of(context).size.width / 2.7,
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              _pImageadharcard == null
                                  ? Text("")
                                  : Container(
                                      height: 130,
                                      child: Image.file(_pImageadharcard)),
                              adharFileName != null
                                  ? Text("File Name: $adharFileName")
                                  : const Text(""),
                              Center(
                                child: Helper().customText(
                                  fWeight: FontWeight.bold,
                                  text: _pImageadharcard == null
                                      ? "Aadharcard Image"
                                      : "",
                                ),
                              ),
                              // customAssetPath(imagePath: adharCard, size: 30)
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    right: 25.0,
                  ),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        _pImageelectioncard = null;
                        elecFileName = null;
                      });
                      _showMyDialog(() {
                        Get.back();
                        elecImage(source: ImageSource.camera);
                      }, () {
                        Get.back();
                        elecImage(source: ImageSource.gallery);
                      }, () {
                        Get.back();
                        pickelec();
                      });
                    },
                    child: Card(
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                        ),
                        height: MediaQuery.of(context).size.width / 2,
                        width: MediaQuery.of(context).size.width / 2.7,
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              _pImageelectioncard == null
                                  ? Text("")
                                  : Container(
                                      height: 130,
                                      child: Image.file(_pImageelectioncard)),
                              elecFileName != null
                                  ? Text("File Name: $elecFileName")
                                  : const Text(""),
                              Helper().customText(
                                fWeight: FontWeight.bold,
                                text: _pImageelectioncard == null
                                    ? "Election card Image"
                                    : "",
                              ),
                              // customAssetPath(imagePath: adharCard, size: 30)
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.all(5.0),
              child: Text(
                "Ration card(Mandatory)",
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: textColor,
                    fontSize: 16),
              ),
            ),
            Row(children: [
              Padding(
                padding: const EdgeInsets.only(right: 25.0, left: 25),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      _pImagerationcard1 = null;
                      rationFileName = null;
                    });
                    _showMyDialog(() {
                      Get.back();
                      ration1Image(source: ImageSource.camera);
                    }, () {
                      Get.back();
                      ration1Image(source: ImageSource.gallery);
                    }, () {
                      Get.back();
                      pickration();
                    });
                  },
                  child: Card(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                      ),
                      height: MediaQuery.of(context).size.width / 2,
                      width: MediaQuery.of(context).size.width / 2.7,
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            _pImagerationcard1 == null
                                ? Text("")
                                : Container(
                                    height: 130,
                                    child: Image.file(_pImagerationcard1)),
                            rationFileName != null
                                ? Text("File Name: $rationFileName")
                                : const Text(""),
                            Helper().customText(
                              fWeight: FontWeight.bold,
                              text: _pImagerationcard1 == null
                                  ? "Ration Card"
                                  : "",
                            ),
                            // customAssetPath(imagePath: adharCard, size: 30)
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  right: 25.0,
                ),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      _pImagerationcard2 = null;
                      ration1FileName = null;
                    });
                    _showMyDialog(() {
                      Get.back();
                      ration2Image(source: ImageSource.camera);
                    }, () {
                      Get.back();
                      ration2Image(source: ImageSource.gallery);
                    }, () {
                      Get.back();
                      pickration1();
                    });
                  },
                  child: Card(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                      ),
                      height: MediaQuery.of(context).size.width / 2,
                      width: MediaQuery.of(context).size.width / 2.7,
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            _pImagerationcard2 == null
                                ? Text("")
                                : Container(
                                    height: 130,
                                    child: Image.file(_pImagerationcard2)),
                            ration1FileName != null
                                ? Text("File Name: $ration1FileName")
                                : const Text(""),
                            Helper().customText(
                              fWeight: FontWeight.bold,
                              text: _pImagerationcard2 == null
                                  ? "Ration Card"
                                  : "",
                            ),
                            // customAssetPath(imagePath: adharCard, size: 30)
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ]),
            const Padding(
              padding: EdgeInsets.all(5.0),
              child: Text(
                "Pan Card & Passport Photo(1 Nos Mandatory)",
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: textColor,
                    fontSize: 16),
              ),
            ),
            Row(children: [
              Padding(
                padding: const EdgeInsets.only(right: 25.0, left: 25),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      _pImagepancard = null;
                      pancardFileName = null;
                    });
                    _showMyDialog(() {
                      Get.back();
                      pancardImage(source: ImageSource.camera);
                    }, () {
                      Get.back();
                      pancardImage(source: ImageSource.gallery);
                    }, () {
                      Get.back();
                      pickpancard();
                    });
                  },
                  child: Card(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                      ),
                      height: MediaQuery.of(context).size.width / 2,
                      width: MediaQuery.of(context).size.width / 2.7,
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            _pImagepancard == null
                                ? Text("")
                                : Container(
                                    height: 130,
                                    child: Image.file(_pImagepancard)),
                            pancardFileName != null
                                ? Text("File Name: $pancardFileName")
                                : const Text(""),
                            Helper().customText(
                              fWeight: FontWeight.bold,
                              text: _pImagepancard == null ? "Pan Card" : "",
                            ),
                            // customAssetPath(imagePath: adharCard, size: 30)
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  right: 25.0,
                ),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      _pImagepassphoto = null;
                      photoFileName = null;
                    });
                    _showMyDialog(() {
                      Get.back();
                      passphotoImage(source: ImageSource.camera);
                    }, () {
                      Get.back();
                      passphotoImage(source: ImageSource.gallery);
                    }, () {
                      Get.back();
                      pickphotot();
                    });
                  },
                  child: Card(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                      ),
                      height: MediaQuery.of(context).size.width / 2,
                      width: MediaQuery.of(context).size.width / 2.7,
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            _pImagepassphoto == null
                                ? Text("")
                                : Container(
                                    height: 130,
                                    child: Image.file(_pImagepassphoto)),
                            photoFileName != null
                                ? Text("File Name: $photoFileName")
                                : const Text(""),
                            Helper().customText(
                              fWeight: FontWeight.bold,
                              text: _pImagepassphoto == null
                                  ? "Passport Photo"
                                  : "",
                            ),
                            // customAssetPath(imagePath: adharCard, size: 30)
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ]),
            const Padding(
              padding: EdgeInsets.all(5.0),
              child: Text(
                "Education Details Proof(MarkSheet Or Certificate)",
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: textColor,
                    fontSize: 16),
              ),
            ),
            Row(children: [
              Padding(
                padding: const EdgeInsets.only(right: 25.0, left: 25),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      _pImageMarksheet = null;
                      marksheetFileName = null;
                      imageCache.clear();
                    });
                    _showMyDialog(() {
                      Get.back();
                      marksheetImage(source: ImageSource.camera);
                    }, () {
                      Get.back();
                      marksheetImage(source: ImageSource.gallery);
                    }, () {
                      Get.back();
                      pickmarksheet();
                    });
                  },
                  child: Card(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                      ),
                      height: MediaQuery.of(context).size.width / 2,
                      width: MediaQuery.of(context).size.width / 2.7,
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            _pImageMarksheet == null
                                ? Text("")
                                : Container(
                                    height: 130,
                                    child: Image.file(_pImageMarksheet)),
                            marksheetFileName != null
                                ? Text("File Name: $marksheetFileName")
                                : const Text(""),
                            Helper().customText(
                              fWeight: FontWeight.bold,
                              text:
                                  _pImageMarksheet == null ? "Mark Sheet" : "",
                            ),
                            // customAssetPath(imagePath: adharCard, size: 30)
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  right: 25.0,
                ),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      _pImageCertificate = null;
                      certyFileName = null;
                    });
                    _showMyDialog(() {
                      Get.back();
                      certificateImage(source: ImageSource.camera);
                    }, () {
                      Get.back();
                      certificateImage(source: ImageSource.gallery);
                    }, () {
                      Get.back();
                      pickcerty();
                    });
                  },
                  child: Card(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                      ),
                      height: MediaQuery.of(context).size.width / 2,
                      width: MediaQuery.of(context).size.width / 2.7,
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            _pImageCertificate == null
                                ? Text("")
                                : Container(
                                    height: 130,
                                    child: Image.file(_pImageCertificate)),
                            certyFileName != null
                                ? Text("File Name: $certyFileName")
                                : const Text(""),
                            Helper().customText(
                              fWeight: FontWeight.bold,
                              text: _pImageCertificate == null
                                  ? "Certificate"
                                  : "",
                            ),
                            // customAssetPath(imagePath: adharCard, size: 30)
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ]),
            const Padding(
              padding: EdgeInsets.all(5.0),
              child: Text(
                "School Leaving Certificate (Mandatory)",
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: textColor,
                    fontSize: 16),
              ),
            ),
            Row(children: [
              Padding(
                padding: const EdgeInsets.only(right: 25.0, left: 25),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      _pImageLC1 = null;
                      LC1FileName = null;
                    });
                    _showMyDialog(() {
                      Get.back();
                      LC1Image(source: ImageSource.camera);
                    }, () {
                      Get.back();
                      LC1Image(source: ImageSource.gallery);
                    }, () {
                      Get.back();
                      pickLC1();
                    });
                  },
                  child: Card(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                      ),
                      height: MediaQuery.of(context).size.width / 2,
                      width: MediaQuery.of(context).size.width / 2.7,
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            _pImageLC1 == null
                                ? Text("")
                                : Container(
                                    height: 130, child: Image.file(_pImageLC1)),
                            LC1FileName != null
                                ? Text("File Name: $LC1FileName")
                                : const Text(""),
                            Helper().customText(
                              fWeight: FontWeight.bold,
                              text: _pImageLC1 == null ? "School leaving" : "",
                            ),
                            // customAssetPath(imagePath: adharCard, size: 30)
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  right: 25.0,
                ),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      _pImageLc2 = null;
                      LC2FileName = null;
                    });
                    _showMyDialog(() {
                      Get.back();
                      LC2Image(source: ImageSource.camera);
                    }, () {
                      Get.back();
                      LC2Image(source: ImageSource.gallery);
                    }, () {
                      Get.back();
                      pickLC2();
                    });
                  },
                  child: Card(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                      ),
                      height: MediaQuery.of(context).size.width / 2,
                      width: MediaQuery.of(context).size.width / 2.7,
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            _pImageLc2 == null
                                ? Text("")
                                : Container(
                                    height: 130, child: Image.file(_pImageLc2)),
                            LC2FileName != null
                                ? Text("File Name: $LC2FileName")
                                : const Text(""),
                            Helper().customText(
                              fWeight: FontWeight.bold,
                              text: _pImageLc2 == null ? "School leaving" : "",
                            ),
                            // customAssetPath(imagePath: adharCard, size: 30)
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ]),
            const Padding(
              padding: EdgeInsets.all(5.0),
              child: Text(
                "Last Salary Slip Or Appointment Letter",
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: textColor,
                    fontSize: 16),
              ),
            ),
            Row(children: [
              Padding(
                padding: const EdgeInsets.only(right: 25.0, left: 25),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      _pImagesalary = null;
                      salaryFileName = null;
                    });
                    _showMyDialog(() {
                      Get.back();
                      salaryImage(source: ImageSource.camera);
                    }, () {
                      Get.back();
                      salaryImage(source: ImageSource.gallery);
                    }, () {
                      Get.back();
                      picksalary();
                    });
                  },
                  child: Card(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                      ),
                      height: MediaQuery.of(context).size.width / 2,
                      width: MediaQuery.of(context).size.width / 2.7,
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            _pImagesalary == null
                                ? Text("")
                                : Container(
                                    height: 130,
                                    child: Image.file(_pImagesalary)),
                            salaryFileName != null
                                ? Text("File Name: $salaryFileName")
                                : const Text(""),
                            Helper().customText(
                              fWeight: FontWeight.bold,
                              text: _pImagesalary == null
                                  ? "Last salary Slip"
                                  : "",
                            ),
                            // customAssetPath(imagePath: adharCard, size: 30)
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  right: 25.0,
                ),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      _pappointment = null;
                      appointmentFileName = null;
                    });
                    _showMyDialog(() {
                      Get.back();
                      appointImage(source: ImageSource.camera);
                    }, () {
                      Get.back();
                      appointImage(source: ImageSource.gallery);
                    }, () {
                      Get.back();
                      pickapp();
                    });
                  },
                  child: Card(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                      ),
                      height: MediaQuery.of(context).size.width / 2,
                      width: MediaQuery.of(context).size.width / 2.7,
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            _pappointment == null
                                ? Text("")
                                : Container(
                                    height: 130,
                                    child: Image.file(_pappointment)),
                            appointmentFileName != null
                                ? Text("File Name: $appointmentFileName")
                                : const Text(""),
                            Helper().customText(
                              fWeight: FontWeight.bold,
                              text: _pappointment == null
                                  ? "Appointment Letter"
                                  : "",
                            ),
                            // customAssetPath(imagePath: adharCard, size: 30)
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ]),
            const SizedBox(
              height: 15,
            ),
            const Padding(
              padding: EdgeInsets.all(5.0),
              child: Text(
                "Any Refernce Person Details (Refernce Person Sign is Mandatory)",
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: textColor,
                    fontSize: 16),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: SizeConfig.screenHeight,
                width: MediaQuery.of(context).size.width,
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  elevation: 4,
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 30.0),
                        child: Text(
                          "Duke Company any Manager, Supervisor, Refernce",
                          style: TextStyle(color: textColor, fontSize: 18),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Helper().customTextField(
                        mLength: 10,
                        controller: _dukenameCltr,
                        isEnabled: true,
                        obscureText: false,
                        context: context,
                        hintText: "Name, Punch No Or Mobile Number",
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Helper().customTextField(
                        controller: _signCltr,
                        isEnabled: true,
                        obscureText: false,
                        context: context,
                        hintText: "Sign",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(right: 0.0),
                        child: Text(
                          "Our Village/ City/ any Person Reference",
                          style: TextStyle(color: textColor, fontSize: 18),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Helper().customTextField(
                        controller: _personrefCltr,
                        isEnabled: true,
                        obscureText: false,
                        context: context,
                        hintText: "Name & Mobile Number",
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Helper().customTextField(
                        controller: _signrefCltr,
                        isEnabled: true,
                        obscureText: false,
                        context: context,
                        hintText: "Sign",
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Center(
              child: Helper().customMaterialButton(
                bName: "Submit",
                context: context,
                fSize: 26,
                fweight: FontWeight.bold,
                press: () {
                  setState(() {
                    uploadInterviewAPI();
                    print(dateinput.text);
                    print(gender.toString());
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
