import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:resume_web/src/components/app_text_size.dart';
import 'package:resume_web/src/controller/screen_layout_controller.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber.shade50,
      padding: EdgeInsets.all(30),
      key: ScreenLayoutController.to.contactKey,
      child: ConstrainedBox(
        constraints: BoxConstraints(minHeight: 900),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text("Contact",
                style: titleTextStyle,
                textAlign: ScreenLayoutController.to.type.value ==
                        ScreenSizeType.DESKTOP
                    ? TextAlign.start
                    : TextAlign.center),
            SizedBox(
              height: 30,
            ),
            ScreenLayoutController.to.type.value == ScreenSizeType.DESKTOP
                ? Row(
                    children: [
                      _bloc(Icons.call, "korea : 010-4688-8886\ncanada : ?"),
                      _bloc(Icons.email, "thomass0819@gmail.com"),
                    ],
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      _bloc(Icons.call, "korea : 010-4688-8886\ncanada : ?"),
                      _bloc(Icons.email, "thomass0819@gmail.com"),
                    ],
                  )
          ],
        ),
      ),
    );
  }

  Widget _bloc(IconData icon, String text) {
    return Container(
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0.0, 1.0), //(x,y)
            blurRadius: 6.0,
          ),
        ]),
        margin: EdgeInsets.only(right: 15, bottom: 30, left: 15),
        child: Container(
          width: 400,
          height: 400,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 100,
              ),
              SizedBox(
                height: 100,
              ),
              SelectableText(
                text,
                style: TextStyle(fontSize: 20),
              )
            ],
          ),
        ));
  }
}
