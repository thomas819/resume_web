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
            FittedBox(
              alignment: Alignment.centerLeft,
              fit: BoxFit.scaleDown,
              child: Text(
                "Work Experience",
                style: titleTextStyle,
              ),
            ),
            SizedBox(
              height: 60,
            ),
            Wrap(
              runSpacing: 30,
              children: ScreenLayoutController.to.projectList.map((i) {
                return _project(i);
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
                       Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            i["googleStore"] != null
                                ? InkWell(
                                    onTap: () => launch(i["googleStore"]),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey.withOpacity(0.5),
                                              blurRadius: 3.0, // has the effect of softening the shadow
                                              spreadRadius: 0.0, // has the effect of extending the shadow
                                              offset: Offset(
                                                2.0, // horizontal, move right 10
                                               2.0, // vertical, move down 10
                                              ),
                                            )
                                          ]
                                      ),
                                      child: SvgPicture.network(
                                        "https://firebasestorage.googleapis.com/v0/b/thomas-resume.appspot.com/o/google_play.svg?alt=media&token=482083c2-8fa1-44c5-be02-b29ae6205618",
                                        width: 100,
                                      ),
                                    ))
                                : Container(),
                            SizedBox(
                              width: 10,
                            ),
                            i["appleStore"] != null
                                ? InkWell(
                                    onTap: () => launch(i["appleStore"]),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey.withOpacity(0.5),
                                              blurRadius: 3.0, // has the effect of softening the shadow
                                              spreadRadius: 0.0, // has the effect of extending the shadow
                                              offset: Offset(
                                                2.0, // horizontal, move right 10
                                                2.0, // vertical, move down 10
                                              ),
                                            )
                                          ]
                                      ),
                                      child: SvgPicture.network(
                                        "https://firebasestorage.googleapis.com/v0/b/thomas-resume.appspot.com/o/app_store.svg?alt=media&token=e5eabac8-e94c-43b8-a23c-01883bc01c67",
                                        width: 100,
                                      ),
                                    ),
                                  )
                                : Container()
                          ],
                        )
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
          FittedBox(
            alignment: Alignment.centerLeft,
            fit: BoxFit.scaleDown,
            child: Text(
              i["appSummary"],
              style: projectSubTitleTextStyle,
            ),
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
          FittedBox(
            alignment: Alignment.centerLeft,
            fit: BoxFit.scaleDown,
            child: Text(
              "Professional experience",
              style: projectSubTitleTextStyle,
            ),
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
