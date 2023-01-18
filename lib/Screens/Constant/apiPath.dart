String baseUrl = "http://110.227.253.77:90/DeltaFitToJob/API/";
String baseUrlExam = "http://110.227.253.77:90/FitToJobExam/API/";

String registerAPIURL = "${baseUrl}API_Registrations.aspx";
String loginAPIURL = "${baseUrl}API_LoginScreen.aspx";
String verifyAPIURL = "${baseUrl}API_VerifyOTP.aspx";
String jobprofileAPIURL = "${baseUrl}API_SelectJobProfile.aspx";
String subprofileAPIURL = "${baseUrl}API_SubSelectJobProfile.aspx";
String profileAPIURL = "${baseUrl}API_SendDataStartExam.aspx";
String updateprofileURL = "${baseUrl}API_UpdateJobOfferingIdRegistrations.aspx";
String interviewformAPIURL = "${baseUrl}API_InsertInterview.aspx";
String identityCardAPIURL = "${baseUrl}API_IdentityCard.aspx";

String testListAPIURL = "${baseUrlExam}API_Timetable.aspx";
String assessmentAPIURL = "${baseUrlExam}API_TestDetails.aspx";
String questionListURL = "${baseUrlExam}API_GetSubjectWiseQnList.aspx";
String viewSummaryAPIURL = "${baseUrlExam}API_JEESummary.aspx";
String insertExamAPIURL = "${baseUrlExam}API_insertExam.aspx";
String finalSubmitAPIURL = "${baseUrlExam}API_FinalSubmit.aspx";
String getanslistAPIURL = "${baseUrlExam}API_GetSubjectWiseQnListWithAns.aspx";
String questionresultAPIURL = "${baseUrlExam}API_GetQnListWithAns.aspx";
String checkexamtimeAPIURL = "${baseUrlExam}API_GetTestTime.aspx";
String InsertsignlocationAPIURL =
    "${baseUrlExam}API_InsertSignAndLocation.aspx";
String ValidUserAPIURL = "${baseUrlExam}API_ValidUser.aspx"; //not define key
String getprofileAPIURL = "${baseUrlExam}API_GetProfile.aspx"; // pending
String versionAPIURL = "${baseUrlExam}API_Version.aspx";

String subjectListAPIURL = "${baseUrlExam}API_SubjectList.aspx";
String chapterListAPIURL = "${baseUrlExam}API_ChapterList.aspx";
String chapterPDFListAPIURL = "${baseUrlExam}API_ChapterPDFList.aspx";
String chapterVideoListAPIURL = "${baseUrlExam}API_ChapterVideoList.aspx";
String chapterReferenceLinkListAPIURL =
    "${baseUrlExam}API_ChapterLinkList.aspx";




//String dat
//http://110.227.253.77:90/FitToJobExam/API/API_GetParams.aspx
// http://110.227.253.77:90/FitToJobExam/API/API_GetTestTime.aspx For Time checking 