import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resume_web/src/controller/screen_layout_controller.dart';
import 'package:resume_web/src/pages/main_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialBinding: BindingsBuilder(() {
        Get.put(ScreenLayoutController());
      }),
      initialRoute: "/",
      getPages: [
        GetPage(name: "/", page: () => MainPage()),
      ],
    );
  }
}
