import 'dart:async';

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:fit_to_job/Screens/Constant/imagePath.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../Constant/colorPath.dart';
import 'select_Language.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({Key key}) : super(key: key);

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 4), () => const Splashscreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: const BoxDecoration(color: splashBGColor),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(
                    height: 250,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 4,
                    child: AnimatedSplashScreen(
                      centered: true,
                      splashIconSize: 150,
                      duration: 2000,
                      splash: customAssetPath(
                        imagePath: logoImage,
                      ),
                      nextScreen: const SelectLanguage(),
                      splashTransition: SplashTransition.fadeTransition,
                      animationDuration: const Duration(seconds: 3),
                      pageTransitionType: PageTransitionType.bottomToTop,
                      backgroundColor: splashBGColor,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 15,
                    // width: 450,
                    child:const Text(
                        "Online iExam",
                        style: TextStyle(
                            color: textColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 28),
                        softWrap: true,
                        textAlign: TextAlign.center,
                      ),
                    // AnimatedSplashScreen(
                    //   centered: true,
                    //   splashIconSize: 150,
                    //   duration: 2000,
                    //   splash: const Text(
                    //     "Online iExam",
                    //     style: TextStyle(
                    //         color: textColor,
                    //         fontWeight: FontWeight.bold,
                    //         fontSize: 28),
                    //     softWrap: true,
                    //     textAlign: TextAlign.center,
                    //   ),
                    //   nextScreen: const SelectLanguage(),
                    //   splashTransition: SplashTransition.fadeTransition,
                    //   animationDuration: const Duration(seconds: 3),
                    //   pageTransitionType: PageTransitionType.bottomToTop,
                    //   backgroundColor: splashBGColor,
                    // ),
                  ),
               
                ],
              ),
             
            ],
          )
        ],
      ),
    );
  }
}
