import 'package:flutter/material.dart';
import 'package:resume_web/src/components/app_text_size.dart';
import 'package:resume_web/src/controller/screen_layout_controller.dart';

class ExperiencePage extends StatelessWidget {
  const ExperiencePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(60),
      key: ScreenLayoutController.to.experienceKey,
      color: Colors.green.shade100,
      child: ConstrainedBox(
        constraints: BoxConstraints(minHeight: 900),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "My Projects",
              style: titleTextStyle,
            ),
            SizedBox(
              height: 30,
            ),
            Wrap(
              runSpacing: 30,
              children: ScreenLayoutController.to.projectList.map((i) {
                return Card(
                    elevation: 0,
                    color: Colors.transparent,
                    child: _project(i));
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _project(i) {
    return ScreenLayoutController.to.type.value == ScreenSizeType.DESKTOP
        ? Row(
            mainAxisAlignment:
                ScreenLayoutController.to.projectList.indexOf(i).isOdd
                    ? MainAxisAlignment.end
                    : MainAxisAlignment.start,
            children: [
              ScreenLayoutController.to.projectList.indexOf(i).isOdd
                  ? Expanded(child: _sectionData(i))
                  : _sectionImg(i),
              ScreenLayoutController.to.projectList.indexOf(i).isOdd
                  ? _sectionImg(i)
                  : Expanded(child: _sectionData(i)),
            ],
          )
        : Column(
            children: [
              _sectionImg(i),

              _sectionData(i)
            ],
          );
  }

  Widget _sectionImg(i) {
    return Placeholder();
  }

  Widget _sectionData(i) {
    return Container(
      padding: EdgeInsets.all(30),
      child: Column(
        children: [
          Text(
            i["title"],
            style: projectTitleTextStyle,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            i["subTitle"],
            style: projectSubTitleTextStyle,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            i["content"],
            style: projectContentTextStyle,
          ),
          SizedBox(
            height: 10,
          ),
          Text("Skills Used"),
          SizedBox(
            height: 10,
          ),
          Wrap(
            children: List.generate(
                i["techUsed"].length,
                (index) => Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Chip(label: Text("$index")),
                    )),
          )
        ],
      ),
    );
  }
}
