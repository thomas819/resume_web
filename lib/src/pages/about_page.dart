import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resume_web/src/components/app_text_size.dart';
import 'package:resume_web/src/controller/screen_layout_controller.dart';

class AboutPage extends GetView<ScreenLayoutController> {
  AboutPage();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red.shade50,
      padding: EdgeInsets.all(30),
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
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: _introduction(),
          flex: 3,
        ),
        SizedBox(
          width: 100,
        ),
        Expanded(
          child: _education(),
          flex: 2,
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
        _education(),
      ],
    );
  }

  Widget _education() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "Education",
            style: subTitleTextStyle,
          ),
          SizedBox(
            height: 30,
          ),
          Wrap(
              children: ScreenLayoutController.to.education
                  .map((i) => _educations(i))
                  .toList()),
          //ScreenLayoutController.to.education.map((i) => _educations(i)).toList(),
        ],
      ),
    );
  }

  Widget _educations(i) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        FittedBox(
          alignment: Alignment.centerLeft,
          fit: BoxFit.scaleDown,
          child: Text(
            i["name"],
            style: projectTitleTextStyle,
          ),
        ),
        SizedBox(
          height: 8,
        ),
        FittedBox(
          alignment: Alignment.centerLeft,
          fit: BoxFit.scaleDown,
          child: Text(
            i["date"],
            style: projectSubTitleTextStyle,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          i["content"],
          style: projectContentTextStyle,
        ),
        SizedBox(
          height: 25,
        ),
      ],
    );
  }

  Widget _introduction() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        FittedBox(
          alignment: Alignment.centerLeft,
          fit: BoxFit.scaleDown,
          child: Text(
            "Mobile Application Developer\nfrom the Republic of Korea",
            style: subTitleTextStyle,
          ),
        ),
        SizedBox(height: 30),
        Text(
          "I have 5 years of experience developing mobile applications in the IT industry. I have 3 years of experience developing Android apps and 2 years of experience developing Flutter apps. I am proficient in Java, Kotlin, Dart, Python, SQL, and PostgreSQL. I have experience developing apps for Android, Flutter (aos,ios), the Play Store, the App Store, FastAPI, and AWS Build. I have experience in schedule management, collaborating with designers and server developers, and working in a startup company. I am a responsible and hard-working person who is committed to fulfilling my duties.",
          style: contentTextStyle,
        ),
        SizedBox(
          height: 60,
        ),
        FittedBox(
          alignment: Alignment.centerLeft,
          fit: BoxFit.scaleDown,
          child: Text(
            "What Skills I Experience",
            style: subTitleTextStyle,
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Wrap(
          children: List.generate(
              controller.skills.length,
              (index) => Padding(
                    padding: const EdgeInsets.only(right: 6, bottom: 6),
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
}
