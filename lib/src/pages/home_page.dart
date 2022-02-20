import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:resume_web/src/components/app_text_size.dart';
import 'package:resume_web/src/controller/screen_layout_controller.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatelessWidget {
  HomePage();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue.shade100,
      padding: EdgeInsets.all(60),
      key: ScreenLayoutController.to.homeKey,
      child: ConstrainedBox(
        constraints: BoxConstraints(minHeight: 900),
        child: ScreenLayoutController.to.type.value == ScreenSizeType.DESKTOP
            ? deskTopMode()
            : mobileMode(),
      ),
    );
  }

  Widget deskTopMode() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _getImg(),
        Expanded(child: _introduction()),
      ],
    );
  }

  Widget mobileMode() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _getImg(),
        SizedBox(
          height: 30,
        ),
        _introduction(),
      ],
    );
  }

  Widget _getImg() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CachedNetworkImage(
          imageUrl:
              "https://firebasestorage.googleapis.com/v0/b/thomas-resume.appspot.com/o/thomas.png?alt=media&token=ec066515-7e6a-4ec2-8105-8615a4a9bd39",
          width: ScreenLayoutController.to.type.value == ScreenSizeType.DESKTOP
              ? Get.width * 0.3
              : Get.width * 0.6,
          height: ScreenLayoutController.to.type.value == ScreenSizeType.DESKTOP
              ? Get.width * 0.3
              : Get.width * 0.6,
        ),
        SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
                onTap: () => launch("https://github.com/thomas819"),
                child: SvgPicture.asset("icon/github_icon.svg")),
            SizedBox(
              width: 15,
            ),
            InkWell(
                onTap: () => launch("https://www.instagram.com/minhyun.e/"),
                child: SvgPicture.asset("icon/instagram_icon.svg")),
            SizedBox(
              width: 15,
            ),
            InkWell(
                onTap: () =>
                    launch("https://www.linkedin.com/in/thomas-lee-abb253231/"),
                child: SvgPicture.asset("icon/linkedin_icon.svg")),
            SizedBox(
              width: 15,
            ),
            InkWell(
                onTap: () => launch("https://thomass.tistory.com/"),
                child: Text("Blog")),
            SizedBox(
              width: 15,
            ),
            InkWell(
                onTap: () => launch("https://blog.naver.com/min819"),
                child: Text("Blog2")),
            SizedBox(
              width: 15,
            ),
            InkWell(
                onTap: () => launch(
                    "https://docs.google.com/document/d/1nY61njYLk3-EykObWnE3TcFcLnUxx20_kfsylZSOhns/edit?usp=sharing"),
                child: Text("resume")),
          ],
        ),
      ],
    );
  }

  Widget _introduction() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          "Thomas Lee",
          style: titleTextStyle,
          textAlign:
              ScreenLayoutController.to.type.value == ScreenSizeType.DESKTOP
                  ? TextAlign.start
                  : TextAlign.center,
        ),
        SizedBox(
          height: 30,
        ),
        Text("I'm an app developer who\ncontinues to challenge and grow.",
            style: subTitleTextStyle),
        SizedBox(height: 30),
        Text(
          "It's only one-time life, so I think we should live happily ever after.\nI think happiness comes from thinking.\nIf you think positively and positively in any situation, you can enjoy it.\nIt's meaningful to have a dream in life, and I think one of the processes is to work hard on something.\nI want to join a company that I need to have the ability to work with and help each other and have fun.",
          style: contentTextStyle,
        )
      ],
    );
  }
}
