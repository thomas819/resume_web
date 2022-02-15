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
      color: Colors.green,
      child: ConstrainedBox(
        constraints: BoxConstraints(minHeight: 900),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "My Projects",
              style: titleTextStyle,
            ),
            SizedBox(height: 30,),
            Wrap(
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
    return Row(
      children: [
         Expanded(child: Placeholder()),
        Expanded(
          child: Column(
            children: [
              Text(i["title"],style: contentTextStyle,),
              SizedBox(height: 10,),
              Text(i["text"]),
              SizedBox(height: 10,),
              Text(i["summary"]),
              SizedBox(height: 10,),
              Text("Skills Used"),
              Wrap(children: List.generate(i["techUsed"].length, (index) => Chip(label: Text("${index}"))),)
            ],
          ),
        )
      ],
    );
  }
}
