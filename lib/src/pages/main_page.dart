import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resume_web/src/components/footer.dart';
import 'package:resume_web/src/controller/screen_layout_controller.dart';
import 'package:resume_web/src/pages/about_page.dart';
import 'package:resume_web/src/pages/contact_page.dart';
import 'package:resume_web/src/pages/home_page.dart';

import 'project_page.dart';

class MainPage extends GetView<ScreenLayoutController> {
  MainPage();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        LayoutBuilder(
          builder: (context, constraints) {
            controller.builder(constraints);
            return Container();
          },
        ),
        Obx(() => _layout()),
      ],
    );
  }

  Widget _layout() {
    return Scaffold(
      appBar: _appBar(),
      body: _body(),
      bottomNavigationBar: _bottomNavigation(),
    );
  }

  PreferredSizeWidget _appBar() {
    return AppBar(
      titleSpacing: 10.0,
      centerTitle:
          controller.type.value == ScreenSizeType.MOBILE ? true : false,
      title: Text(
        "Thomas Lee",
        style: TextStyle(
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
            color: Colors.black,
            fontSize: 35),
      ),
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      actions:
          controller.type.value == ScreenSizeType.DESKTOP ? _actions() : null,
    );
  }

  List<Widget> _actions() {
    return <Widget>[
      menuBtn("Home", () {
        returnSelectedTab(0);
      }),
      menuBtn("About", () {
        returnSelectedTab(1);
      }),
      menuBtn("Projects", () {
        returnSelectedTab(2);
      }),
      menuBtn("Contact", () {
        returnSelectedTab(3);
      }),
    ];
  }

  Widget menuBtn(String name, VoidCallback onTap) {
    return MaterialButton(
      // textColor:  controller.selectedIndex.value==count ? Colors.lightBlue: Colors.black,
      padding: EdgeInsets.only(right: 25, left: 25),
      child: Text(
        name,
        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
      ),
      onPressed: onTap,
    );
  }

  BottomNavigationBar? _bottomNavigation() {
    return controller.type.value == ScreenSizeType.DESKTOP
        ? null
        : BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.account_circle_outlined), label: 'About'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.article_outlined), label: 'Experience'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.phone_outlined), label: 'Contact'),
            ],
            currentIndex: controller.selectedIndex.value,
            onTap: (index) => returnSelectedTab(index),
            selectedItemColor: Colors.blueGrey,
            unselectedItemColor: Colors.blueGrey,
            selectedFontSize: 12,
            unselectedFontSize: 12,
          );
  }

  Widget _body() {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            HomePage(),
            AboutPage(),
            ProjectPage(),
            ContactPage(),
            Footer(),
          ],
        ),
      ),
    );
  }

  returnSelectedTab(_selectedIndex) {
    controller.selectedIndex.value = _selectedIndex;
    if (_selectedIndex == 0) {
      Scrollable.ensureVisible(controller.homeKey.currentContext!,
          duration: Duration(milliseconds: 400), curve: Curves.easeInOut);
    } else if (_selectedIndex == 1) {
      Scrollable.ensureVisible(controller.aboutKey.currentContext!,
          alignment: 0.0,
          duration: Duration(milliseconds: 400),
          curve: Curves.easeInOut);
    } else if (_selectedIndex == 2) {
      Scrollable.ensureVisible(controller.experienceKey.currentContext!,
          alignment: 0.0,
          duration: Duration(milliseconds: 400),
          curve: Curves.easeInOut);
    } else {
      Scrollable.ensureVisible(controller.contactKey.currentContext!,
          alignment: 0.0,
          duration: Duration(milliseconds: 400),
          curve: Curves.easeInOut);
    }
  }
}
