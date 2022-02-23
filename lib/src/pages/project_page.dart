import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:resume_web/src/components/app_text_size.dart';
import 'package:resume_web/src/controller/screen_layout_controller.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectPage extends StatelessWidget {
  const ProjectPage({Key? key}) : super(key: key);

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
              "Work Experience",
              style: titleTextStyle,
            ),
            SizedBox(
              height: 60,
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
                  : Expanded(child: _sectionImg(i)),
              ScreenLayoutController.to.projectList.indexOf(i).isOdd
                  ? Expanded(child: _sectionImg(i))
                  : Expanded(child: _sectionData(i)),
            ],
          )
        : Column(
            children: [_sectionImg(i), _sectionData(i)],
          );
  }

  Widget _sectionImg(i) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CachedNetworkImage(
            imageUrl: i["image"],
            height: 500,
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 80,
            child: ScreenLayoutController.to.type.value == ScreenSizeType.DESKTOP ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                    onTap: () => launch(i["googleStore"]),
                    child: SvgPicture.asset("icon/google_play.svg",width: 100,)),
                SizedBox(
                  width: 10,
                ),
                i["appleStore"] != null
                    ? GestureDetector(onTap: () => launch(i["appleStore"]),
                      child: SvgPicture.asset(
                          "icon/app_store.svg",width: 100
                        ),
                    )
                    : Container()
              ],
            ):Column(mainAxisAlignment: MainAxisAlignment.center,children: [

            ],)
          )
        ],
      ),
    );
  }

  Widget _sectionData(i) {
    return Container(
      padding: EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            i["appName"],
            style: projectTitleTextStyle,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            i["appSummary"],
            style: projectSubTitleTextStyle,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            i["AppInfo"],
            style: projectContentTextStyle,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Responsibilities",
            style: projectSubTitleTextStyle,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            i["responsibilities"],
            style: projectContentTextStyle,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Skills Used",
            style: projectSubTitleTextStyle,
          ),
          SizedBox(
            height: 10,
          ),
          Wrap(
            children: List.generate(
                i["techUsed"].length,
                (index) => Padding(
                      padding: const EdgeInsets.only(right: 8, bottom: 8),
                      child: Chip(label: Text("$index")),
                    )),
          )
        ],
      ),
    );
  }
}
