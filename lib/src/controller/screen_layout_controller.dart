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
    "image": "https://firebasestorage.googleapis.com/v0/b/thomas-resume.appspot.com/o/reviewduck.png?alt=media&token=25d866d5-03f6-4f67-977d-e638439565d7",
    "appName": "ReviewDuck",
    "appSummary": "Cafe Reviews Service",
    "AppInfo":
    "Artbandhu app helps millions of creative professionals/artist succeed with upskilling and on-demand creative jobs & monetization opportunities, around the world",
      "responsibilities":"worked on front end for the app with Dart and flutter",
    "techUsed" : ["1","2","3","4","5","1","2","3","4","5","1","2","3","4","5","1","2","3","4","5","1","2","3","4","5"],
    "googleStore": "https://play.google.com/store/apps/details?id=com.reviewduck.alphabase.review_duck",
    "appleStore": "https://apps.apple.com/us/app/%EB%A6%AC%EB%B7%B0%EB%8D%95/id1579481417",
  },
    {
      "image": "https://firebasestorage.googleapis.com/v0/b/thomas-resume.appspot.com/o/cashdd.png?alt=media&token=df5adc6b-01b3-461c-9920-af3041cd4ce3",
      "appName": "Cash DungDung",
      "appSummary": "Popup Banner Reward Service",
      "AppInfo":
      "Artbandhu app helps millions of creative professionals/artist succeed with upskilling and on-demand creative jobs & monetization opportunities, around the world",
      "responsibilities":"worked on front end for the app with Dart and flutter",
      "techUsed" : ["1","2","3","4","5","1","2","3","4","5","1","2","3","4","5","1","2","3","4","5","1","2","3","4","5"],
      "googleStore": "https://play.google.com/store/apps/details?id=com.alphabase.cashdungdung",
      "appleStore": null,
    },
    {
      "image": "https://firebasestorage.googleapis.com/v0/b/thomas-resume.appspot.com/o/flybook.png?alt=media&token=a86b9c62-9e22-43e5-99cd-da2a36a89f55",
      "appName": "FlyBook",
      "appSummary": "book platform",
      "AppInfo":
      "Artbandhu app helps millions of creative professionals/artist succeed with upskilling and on-demand creative jobs & monetization opportunities, around the world",
      "responsibilities":"worked on front end for the app with Dart and flutter",
      "techUsed" : ["1","2","3","4","5","1","2","3","4","5","1","2","3","4","5","1","2","3","4","5","1","2","3","4","5"],
      "googleStore": "https://play.google.com/store/apps/details?id=com.flybook.flybook&hl=ko",
      "appleStore": null,
    },
    {
      "image": "https://firebasestorage.googleapis.com/v0/b/thomas-resume.appspot.com/o/plumboard.jpg?alt=media&token=7b6680ed-8a50-4f6c-b099-4260858fcf86",
      "appName": "PlumBoard",
      "appSummary": "book platform",
      "AppInfo":
      "Artbandhu app helps millions of creative professionals/artist succeed with upskilling and on-demand creative jobs & monetization opportunities, around the world",
      "responsibilities":"worked on front end for the app with Dart and flutter",
      "techUsed" : ["1","2","3","4","5","1","2","3","4","5","1","2","3","4","5","1","2","3","4","5","1","2","3","4","5"],
      "googleStore": "https://play.google.com/store/apps/details?id=com.imhc2.plumboard&hl=ko&gl=US",
      "appleStore": null,
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
  } else
  if (constraints.biggest.width >= 480 && constraints.biggest.width < 768) {
    _screenType(ScreenSizeType.TABLET);
  } else {
    _screenType(ScreenSizeType.DESKTOP);
  }
}}
