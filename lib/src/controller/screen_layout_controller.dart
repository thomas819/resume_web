import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum ScreenSizeType { MOBILE, TABLET, DESKTOP }

class ScreenLayoutController extends GetxController {
  static ScreenLayoutController get to => Get.find();

  Rx<ScreenSizeType> _screenType = ScreenSizeType.DESKTOP.obs;
  Rx<ScreenSizeType> type = ScreenSizeType.DESKTOP.obs;

  final homeKey = new GlobalKey();
  final aboutKey = new GlobalKey();
  final experienceKey = new GlobalKey();
  final contactKey = new GlobalKey();

  RxInt selectedIndex = 0.obs;

  final skills = [
    "java",
    "kotlin",
    "dart",
    "python",
    "android",
    "flutter",
    "mysql",
    "django",
    "crawling",
    "rest api",
    "git",
    "SourceTree",
    "Github Action",
    "Firebase",
    "firestore",
    "firebase Crashlytics",
    "firebase Test Lab",
    "firebase App Distribution",
    "firebase Events",
    "FCM",
    "firebase Remote config",
    "firebase Dynamic Links",
    "admob",
    "unity ad",
    "figma",
    "zeplin",
    "jira",
    "notion",
    "slack",
  ];
  final projectList = [
    {
      "title": "Artbandhu - Career Discovery Platform",
      "image": "",
      "text": "Social Art Feed Application for local artist and community",
      "summary":
          "Artbandhu app helps millions of creative professionals/artist succeed with upskilling and on-demand creative jobs & monetization opportunities, around the world",
      "summary2":
          "Worked on front end for the app with Dart and Flutter \nSocial Logins using firebase authentication \nUsed Firebase storage for file uploads \nEnsuring project quality and timely resolution of issues.",
      "techUsed" : ["1","2"],
      "storeLink": "",
    },
    {
      "title": "Artbandhu - Career Discovery Platform",
      "image": "",
      "text": "Social Art Feed Application for local artist and community",
      "summary":
      "Artbandhu app helps millions of creative professionals/artist succeed with upskilling and on-demand creative jobs & monetization opportunities, around the world",
      "summary2":
      "Worked on front end for the app with Dart and Flutter \nSocial Logins using firebase authentication \nUsed Firebase storage for file uploads \nEnsuring project quality and timely resolution of issues.",
      "techUsed":
      ["1","2","3","4"],
      "storeLink": "",
    },
  ];

  @override
  void onInit() {
    debounce(_screenType, (_) {
      type(_screenType.value);
    }, time: Duration(milliseconds: 200));
    super.onInit();
  }

  void builder(BoxConstraints constraints) {
    if (constraints.biggest.width <= 480) {
      _screenType(ScreenSizeType.MOBILE);
    } else if (constraints.biggest.width >= 480 &&
        constraints.biggest.width < 768) {
      _screenType(ScreenSizeType.TABLET);
    } else {
      _screenType(ScreenSizeType.DESKTOP);
    }
  }
}
