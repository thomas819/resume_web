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
    precacheImage(
      CachedNetworkImageProvider(
          'https://firebasestorage.googleapis.com/v0/b/thomas-resume.appspot.com/o/thomas.png?alt=media&token=ec066515-7e6a-4ec2-8105-8615a4a9bd39'),
      context,
    );

    return Container(
      color: Colors.blue.shade50,
      padding: EdgeInsets.all(30),
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
    print("@@${ScreenLayoutController.to.type.value}");
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
            _icon("https://github.com/thomas819",
                "https://firebasestorage.googleapis.com/v0/b/thomas-resume.appspot.com/o/github_icon.svg?alt=media&token=a41bf255-7be3-4e5d-bcbc-c519beea270d"),
            SizedBox(
              width: 15,
            ),
            _icon("https://www.instagram.com/minhyun.e/",
                "https://firebasestorage.googleapis.com/v0/b/thomas-resume.appspot.com/o/instagram_icon.svg?alt=media&token=801602fc-1437-4e99-b239-daa09dd4b724"),
            SizedBox(
              width: 15,
            ),
            _icon("https://www.linkedin.com/in/thomas-lee-abb253231/",
                "https://firebasestorage.googleapis.com/v0/b/thomas-resume.appspot.com/o/linkedin_icon.svg?alt=media&token=6a0aad73-0ee6-4007-b453-ccc468be2803"),
            SizedBox(
              width: 15,
            ),
            _textIcon("https://thomass.tistory.com/", "Blog"),
            SizedBox(
              width: 15,
            ),
            _textIcon("https://blog.naver.com/min819", "Blog2"),
            SizedBox(
              width: 15,
            ),
            _textIcon(
                "https://docs.google.com/document/d/1i8EJOfk-yTO_3d9CVtoKRPFeUnf0s2KVuVy713Ks1_w/edit?usp=sharing",
                "RESUME"),
          ],
        ),
      ],
    );
  }

  Widget _icon(url, img) {
    return InkWell(
        onTap: () => launch(url),
        child: SvgPicture.network(
          img,
        ));
  }

  Widget _textIcon(url, name) {
    return InkWell(
        onTap: () => launch(url),
        child: Card(
          elevation: 0,
          clipBehavior: Clip.antiAlias,
          child: Container(
            padding: EdgeInsets.all(5),
            child: Text(
              name,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ));
  }

  Widget _introduction() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        FittedBox(
          alignment: Alignment.centerLeft,
          fit: BoxFit.scaleDown,
          child: Text(
            "Thomas Lee",
            style: titleTextStyle,
            textAlign:
                ScreenLayoutController.to.type.value == ScreenSizeType.DESKTOP
                    ? TextAlign.start
                    : TextAlign.center,
          ),
        ),
        SizedBox(
          height: 30,
        ),
        FittedBox(
          alignment: Alignment.centerLeft,
          fit: BoxFit.scaleDown,
          child: Text(
            "I'm an app developer who\ncontinues to challenge and grow.",
            style: subTitleTextStyle,
          ),
        ),
        SizedBox(height: 30),
        Text(
          "It's only one-time life, so I think we should live happily ever after.\nI think happiness comes from thinking.\nIf you think positively and positively in any situation, you can enjoy it.\nIt's meaningful to have a dream in life, and I think one of the processes is to work hard on something.\nI want to join a company that I need to have the ability to work with and help each other and have fun.\nEven if I'm not good at English, I'll learn quickly!",
          style: contentTextStyle,
        )
      ],
    );
  }
}
