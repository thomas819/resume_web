import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resume_web/src/components/app_text_size.dart';
import 'package:resume_web/src/controller/screen_layout_controller.dart';

class AboutPage extends GetView<ScreenLayoutController> {
  AboutPage();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      padding: EdgeInsets.all(60),
      key: ScreenLayoutController.to.aboutKey,
      child: ConstrainedBox(
        constraints: BoxConstraints(minHeight: 900),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text("About",
                style: titleTextStyle,
                textAlign: ScreenLayoutController.to.type.value ==
                        ScreenSizeType.DESKTOP
                    ? TextAlign.start
                    : TextAlign.center),
            SizedBox(
              height: 30,
            ),
            ScreenLayoutController.to.type.value == ScreenSizeType.DESKTOP
                ? _deskTopMode()
                : _mobileMode(),
          ],
        ),
      ),
    );
  }

  Widget _deskTopMode() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(child: _introduction()),
        Expanded(
          child: _skill(),
        ),
      ],
    );
  }

  Widget _mobileMode() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _introduction(),
        SizedBox(
          height: 30,
        ),
        _skill(),
      ],
    );
  }

  Widget _skill() {
    return Column(
      children: [
        Text(
          "What Skills I Experience",
          style: subTitleTextStyle,
        ),
        SizedBox(
          height: 30,
        ),
        Wrap(
          children: List.generate(
              controller.skills.length,
              (index) => Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Chip(
                      label: Text(
                        controller.skills[index],
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      backgroundColor: Colors.white,
                    ),
                  )),
        ),
      ],
    );
  }

  Widget _introduction() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          "Mobile Application Developer\nfrom the Republic of Korea",
          style: subTitleTextStyle,
        ),
        SizedBox(height: 30),
        Text(
          "3 years and 9 months of experience in mobile application development in the it industry.\n3 years is the development of Android apps, 9 months is the flutter and Android.\nHaving Knowledge languages of java, kotlin, dart, python, mysql\nWorking experience in developing android, flutter (aos,ios) playstore, appptore app, and distribution.\nI have the ability to manage schedules, collaborate with designers, and experience working at a startup company.\nI will continue to work hard in a responsible manner and fulfill my duties faithfully.",
          style: contentTextStyle,
        ),
      ],
    );
  }
}
