import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../LocalStorage/SaveCredential.dart';
import '../Authentication/registration_screen.dart';
import '../Constant/Colorpath.dart';
import '../Constant/imagePath.dart';
import '../Widgets/hepler.dart';


class SelectLanguage extends StatefulWidget {
  const SelectLanguage({Key key}) : super(key: key);

  @override
  State<SelectLanguage> createState() => _SelectLanguageState();
}

class _SelectLanguageState extends State<SelectLanguage> {
  final List locale = [
    {'name': 'ENGLISH', 'locale': const Locale('en', 'US')},
    {'name': 'ગુજરાતી', 'locale': const Locale('gu', 'IN')},
    {'name': 'हिंदी', 'locale': const Locale('hi', 'IN')},
  ];
  
  updateLanguage(Locale locale) {
    Get.updateLocale(locale);
    Get.back();
  }

  buildLanguageDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (builder) {
          return AlertDialog(
            content: SizedBox(
              width: double.maxFinite,
              child: ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        child: Text(locale[index]['name']),
                        onTap: () {
                          debugPrint(locale[index]['name']);
                          updateLanguage(locale[index]['locale']);
                          
                          LocalStorage().saveLangauge(
                            local: locale[index]['locale'],
                          );
                        },
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const Divider(
                      color: Colors.blue,
                    );
                  },
                  itemCount: locale.length),
            ),
          );
        });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 80,
              ),
              customAssetPath(imagePath: logoImage, size: 100),
              const SizedBox(
                height: 50,
              ),
              Helper().customText(
                  text: "Select Language",
                  fontSize: 24,
                  fWeight: FontWeight.bold),
              const SizedBox(
                height: 50,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 1.5,
                height: 65,
                child: SizedBox(
                  height: MediaQuery.of(context).size.height / 15,
                  width: MediaQuery.of(context).size.width / 1.5,
                  child: MaterialButton(
                    shape:const UnderlineInputBorder(
                      borderSide: BorderSide(color: textColor),
                    ),
                    textColor: Colors.black,
                    onPressed: () {
                      buildLanguageDialog(context);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        customAssetPath(imagePath: language, size: 30),
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "English",
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                        const Icon(Icons.keyboard_arrow_down_sharp)
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 90,
              ),
              Helper().customMaterialButton(bName: "Continue",
              context: context,
              fSize: 26,
              fweight: FontWeight.bold,
              press: () {Navigator.push(context, MaterialPageRoute(builder: (context)=> const Registrationscreen()));}
              
              )
            ],
          ),
        ),
      ),
    );
  }
}



