import 'package:fit_to_job/Localization/Custom_Localization.dart';
import 'package:fit_to_job/Screens/Authentication/login_screen.dart';
import 'package:fit_to_job/Screens/CommonScreen/home_screen.dart';
import 'package:fit_to_job/Screens/CommonScreen/questionresult_screen.dart';
import 'package:fit_to_job/Screens/CommonScreen/rules_screen.dart';
import 'package:fit_to_job/Screens/CommonScreen/select_language.dart';
import 'package:fit_to_job/Screens/CommonScreen/subjob_profile.dart';
import 'package:fit_to_job/Screens/CommonScreen/test_screen.dart';
import 'package:fit_to_job/Screens/CommonScreen/testlist.dart';
import 'package:fit_to_job/Screens/Connection/InitialBind.dart';
import 'package:fit_to_job/Screens/Constant/Colorpath.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Screens/CommonScreen/Splash_Screen.dart';
import 'Screens/CommonScreen/interviewform_screen.dart';
import 'Screens/CommonScreen/job_profile.dart';
import 'Screens/CommonScreen/result_screen.dart';
import 'Screens/CommonScreen/uploaddoc_screen.dart';
import 'Screens/CommonScreen/uploaddone_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
    statusBarBrightness: Brightness.dark,
    systemNavigationBarColor: Colors.white,
    systemNavigationBarIconBrightness: Brightness.dark,
  ));
  SharedPreferences prefs = await SharedPreferences.getInstance();
    var mobileNo = prefs.getString('mobileNo');
    debugPrint(mobileNo.toString());
  Locale local;

  local = prefs.getString('lang') == null
      ? const Locale('en')
      : Locale(prefs.getString('lang'));

  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    locale: local,
    translations: LocaleString(),
    initialBinding: NetworkBinding(),
    defaultTransition: Transition.rightToLeft,
    transitionDuration: const Duration(milliseconds: 250),
    getPages: [
      GetPage(name: '/language', page: () => const SelectLanguage()),
      GetPage(name: '/login', page: () => const LoginScreen()),
      GetPage(name: '/selectjob', page: () => const Jobprofile()),
      GetPage(name: '/subjobprofile', page: () => const SubJobProfile()),
      GetPage(name: '/homescreen', page: () => const HomeScreen()),
      GetPage(name: '/rulescreen', page: () => const RuleScreen()),
      GetPage(name: '/testscreen', page: () => const TestScreen()),
      // GetPage(name: '/resultscreen', page: () => const ResultScreen()),
      GetPage(name: '/uploadscreen', page: () => const UploadScreen()),
      GetPage(name: '/donescreen', page: () => const DoneScreen()),
      GetPage(name: '/interviewform', page: () => const InterviewScreen()),
      GetPage(name: '/questionresult', page: () => const Questionresult()),
      // GetPage(name: '/testlist', page: () => const testlist()),

    ],
    theme: ThemeData(
      scaffoldBackgroundColor: Colors.white,
      primarySwatch: buildMaterialColor(textColor),
      tabBarTheme: TabBarTheme(labelColor: buildMaterialColor(textColor)),
      textTheme: GoogleFonts.nunitoSansTextTheme(),
    ),
    home: mobileNo == null ? const Splashscreen() : const HomeScreen(),
    // home: const RuleScreen(),
  ));
}
