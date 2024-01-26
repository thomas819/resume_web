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
    "fastapi",
    "crawling",
    "rest api",
    "git",
    "SourceTree",
    "Github Action",
    "Firebase",
    "aws ec2",
    "aws s3",
    "aws route53",
    "admob",
    "unity ad",
    "figma",
    "zeplin",
    "jira",
    "notion",
    "slack",
  ];

  //
  final projectList = [
    {
      "image":
          "https://firebasestorage.googleapis.com/v0/b/thomas-resume.appspot.com/o/benzamin.png?alt=media&token=f83b5229-7979-4c75-9aac-5c8f9ce6a96a",
      "appName": "benzamin",
      "appSummary": "ai Smart Bed Service",
      "AppInfo": "- ai bed that helps stabilize the heart rate",
      "responsibilities":
          "- I was in charge of partial development of the Benjamin app.\n"
              "- Onboarding, Set-up, Home Development\n"
              "- Interworking aqara api test for Homeiot, distributing fastapi docker\n",
      "techUsed": ["GetX", "graphql", "hasura", "firebase"],
      "googleStore":
          "https://play.google.com/store/apps/details?id=app.dayna.sleep&pcampaignid=web_share",
    },
    {
      "image":
          "https://firebasestorage.googleapis.com/v0/b/thomas-resume.appspot.com/o/lovel.png?alt=media&token=5e82ec1f-0b7f-48ac-94aa-82c4fbc2e6c3",
      "appName": "lovel",
      "appSummary": "Video guide platform",
      "AppInfo": "- A video guide service when you go to a designated place",
      "responsibilities":
          "- All apps, servers and DBs designed and built exclusively by the full stack\n"
              "- Developed Flutter application and deployed release version to App Store and Play Store\n"
              "- Deploying servers to aws using fastapi\n"
              "- db design and rds deployment using postgres\n"
              "- Performed testing on Physical device ios,aos",
      "techUsed": [
        "GetX",
        "auth(apple,google,kakao,naver)",
        "fastapi",
        "aws ec2",
        "aws rds",
        "aws s3",
        "aws mediaconvert",
        "aws lambda",
        "aws route53",
        "postgresql",
        "fcm",
        "rest api",
        "firebase"
      ],
      "googleStore":
          "https://play.google.com/store/apps/details?id=com.nanarism.lovel&pcampaignid=web_share",
      "appleStore":
          "https://apps.apple.com/kr/app/%EB%A1%9C%EB%B8%94-lovel-%EC%98%81%EC%83%81%EA%B0%80%EC%9D%B4%EB%93%9C-%EC%98%A4%EB%94%94%EC%98%A4%EA%B0%80%EC%9D%B4%EB%93%9C-%EC%9B%8C%ED%82%B9%ED%88%AC%EC%96%B4-%EC%97%AC%ED%96%89/id6444922430",
    },
    {
      "image":
          "https://firebasestorage.googleapis.com/v0/b/thomas-resume.appspot.com/o/reviewduck.png?alt=media&token=25d866d5-03f6-4f67-977d-e638439565d7",
      "appName": "ReviewDuck",
      "appSummary": "Cafe reviews platform",
      "AppInfo": "- Cafe platform service that collects and shows cafe reviews",
      "responsibilities":
          "- Worked in all phases of the project including design, development, testing and deployment\n"
              "- Developed Flutter application and deployed release version to App Store and Play Store\n"
              "- Integrated client side application with server API via asynchronous tasks\n"
              "- Worked closely with product managers and designers to define a rich iOS,AOS experience for the user\n"
              "- Performed testing on Physical device ios,aos",
      "techUsed": [
        "GetX",
        "auth(apple)",
        "image upload(aws)",
        "fcm",
        "rest api",
        "github action",
        "firebase"
      ],
      "googleStore":
          "https://play.google.com/store/apps/details?id=com.reviewduck.alphabase.review_duck",
      "appleStore":
          "https://apps.apple.com/us/app/%EB%A6%AC%EB%B7%B0%EB%8D%95/id1579481417",
    },
    {
      "image":
          "https://firebasestorage.googleapis.com/v0/b/thomas-resume.appspot.com/o/cashdd.png?alt=media&token=df5adc6b-01b3-461c-9920-af3041cd4ce3",
      "appName": "CashDungDung",
      "appSummary": "Rewards Advertising App",
      "AppInfo":
          "- It's a service that accumulates points when you watch pop-up ads",
      "responsibilities":
          "- Implemented of multiple advertising services (google ads and video, unity ads, coupang)\n"
              "- Implemented Clean Architecture using MVVM design pattern, Dagger Hilt ,databinding,coroutine\n"
              "- Successfully deployed the app on the Android Marketplace and different of store",
      "techUsed": [
        "mvvm",
        "dagger hilt",
        "google auth",
        "WindowManager",
        "databinding",
        "rest api",
        "github action",
        "firebase"
      ],
      "googleStore":
          "https://play.google.com/store/apps/details?id=com.alphabase.cashdungdung",
      "appleStore": null,
    },
    {
      "image":
          "https://firebasestorage.googleapis.com/v0/b/thomas-resume.appspot.com/o/flybook.png?alt=media&token=a86b9c62-9e22-43e5-99cd-da2a36a89f55",
      "appName": "FlyBook",
      "appSummary": "Book Platform",
      "AppInfo":
          "- It is a service that helps you read books, such as recommending books, purchasing books, and writing book reports (like goodreads)",
      "responsibilities":
          "- Responsible for updating the existing code, fixing bugs, and adding new features to the existing apps Android and then re-publish these apps to Play Store\n"
              "- Collaborated with designers, engineers, and product managers to build great experiences\n"
              "- Tested the application on device and used firebase test lab and Firebase Crashlytics to debug the issues that were found\n"
              "- Developed JSON API for the inventory management app using Django\n"
              "- Developed a book inventory management app using barcode\n"
              "- Experienced project manager",
      "techUsed": [
        "rxjava2",
        "jectpack",
        "paging",
        "navigation",
        "databinding",
        "lifecycles",
        "room",
        "livedata",
        "viewmodel",
        "image upload",
        "github action",
        "fcm",
        "rest api",
        "django",
        "mysql"
      ],
      "googleStore":
          "https://play.google.com/store/apps/details?id=com.flybook.flybook&hl=ko",
      "appleStore": null,
    },
    {
      "image":
          "https://firebasestorage.googleapis.com/v0/b/thomas-resume.appspot.com/o/plumboard.jpg?alt=media&token=7b6680ed-8a50-4f6c-b099-4260858fcf86",
      "appName": "PlumBoard",
      "appSummary": "Survey Rewards Platform",
      "AppInfo":
          "A service that obtains rewards when a customer who needs a survey requests a survey and a user conducts a survey(service is over)",
      "responsibilities":
          "- Responsible for the design, build, deployment, debug & maintenance of Android applications for Google play\n"
              "- Followed up by testing (user interface, errors with all possible inputs, debugging, publishing) apps after project completion\n"
              "- Implemented  most of the firebase functions",
      "techUsed": [
        "firestore",
        "storage",
        "dynamicLink",
        "auth(email)",
        "exoplayer",
        "fcm",
        "vimeo api",
        "crashlytics",
        "testLab",
        "java",
        "kotlin",
        "rxjava",
        "git",
        "zeplin",
        "jira"
      ],
      "googleStore":
          "https://play.google.com/store/apps/details?id=com.imhc2.plumboard&hl=ko&gl=US",
      "appleStore": null,
    },
    {
      "image":
          "https://firebasestorage.googleapis.com/v0/b/thomas-resume.appspot.com/o/esr.png?alt=media&token=eb39abd1-e7f0-41c8-9290-68e5fe1daeb9",
      "appName": "BankBox",
      "appSummary": "Golf course reservation platform",
      "AppInfo": "A platform that supports golf course reservations",
      "responsibilities": "- developed an android phone call screen application\n"
          "- Developed a function where video and image advertisements come out when you get a call\n"
          "- Implement a Broadcast receiver framework, register receiver to receive phone call broadcast events from the Android system\n"
          "- Handles multiple connections and multiple data processing with ble",
      "techUsed": [
        "BroadCastReceiver",
        "Service",
        "WindowManager",
        "bluetooth BLE"
      ],
      "googleStore": null,
      "appleStore": null,
    },
  ];

  final education = [
    {
      "name": "Korea National Open University",
      "date": "2024.02 ~ , Seoul, Korea",
      "content": "Department of Computer Science",
    },
    {
      "name": "Acorn Academy",
      "date": "2015.10 ~ 2016.02, Seoul, Korea",
      "content":
          "completed smart content development course using mobile devices\n(html,css,javascript,java,jsp,oracle,android,spring)",
    },
    {
      "name": "Global Human Resources Development Institute",
      "date": "2016.07 ~ 2016.12, Seoul, Korea",
      "content": "completed Internet of Things course(Android, Arduino)",
    },
    {
      "name": "Korea Software Industry Association",
      "date": "2019.10 ~ 2019.11, Seoul, Korea",
      "content":
          "completed Python web programming django training(Python,Django)",
    },
    {
      "name": "Korea Software Industry Association",
      "date": "2019.11 ~ 2019.12, Seoul, Korea",
      "content":
          "completed Statistics-based machine learning data analysis course Tensorflow\n(Python,Tensorflow,LinearRegression,ANN,DNN..)",
    },
    {
      "name": "Korea Software Industry Association",
      "date": "2020.05 ~ 2020.05, Seoul, Korea",
      "content":
          "Completed the python data analysis course.(Crawling. Numpy...)",
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
