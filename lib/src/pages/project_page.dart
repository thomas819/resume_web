import 'package:auto_size_text/auto_size_text.dart';
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
      padding: EdgeInsets.all(30),
      key: ScreenLayoutController.to.experienceKey,
      color: Colors.green.shade50,
      child: ConstrainedBox(
        constraints: BoxConstraints(minHeight: 900),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AutoSizeText(
              "Work Experience",
              style: titleTextStyle,
              maxLines: 1,
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
          SizedBox(
            height: 30,
          ),
          CachedNetworkImage(
            imageUrl: i["image"],
            height: 500,
          ),
          SizedBox(
            height: 10,
          ),
          Container(
              height: 80,
              child:
                  ScreenLayoutController.to.type.value == ScreenSizeType.DESKTOP
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            i["googleStore"] != null
                                ? InkWell(
                                    onTap: () => launch(i["googleStore"]),
                                    child: SvgPicture.network(
                                      "https://firebasestorage.googleapis.com/v0/b/thomas-resume.appspot.com/o/google_play.svg?alt=media&token=482083c2-8fa1-44c5-be02-b29ae6205618",
                                      width: 100,
                                    ))
                                : Container(),
                            SizedBox(
                              width: 10,
                            ),
                            i["appleStore"] != null
                                ? InkWell(
                                    onTap: () => launch(i["appleStore"]),
                                    child: SvgPicture.network(
                                      "https://firebasestorage.googleapis.com/v0/b/thomas-resume.appspot.com/o/app_store.svg?alt=media&token=e5eabac8-e94c-43b8-a23c-01883bc01c67",
                                      width: 100,
                                    ),
                                  )
                                : Container()
                          ],
                        )
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [],
                        ))
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
          AutoSizeText(
            i["appSummary"],
            style: projectSubTitleTextStyle,
            maxLines: 1,
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
          AutoSizeText(
            "Professional experience",
            style: projectSubTitleTextStyle,
            maxLines: 1,
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
                      padding: const EdgeInsets.only(right: 6, bottom: 6),
                      child: Chip(label: Text(i["techUsed"][index])),
                    )),
          )
        ],
      ),
    );
  }
}
