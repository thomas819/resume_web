import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Footer extends StatelessWidget {
  const Footer();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
      padding: EdgeInsets.all(7),
      width: double.infinity,
      child: Text(
        "copyright 2022 thomas lee All Rights Reserved",
        style: TextStyle(fontSize: 11),
        textAlign: TextAlign.center,
      ),
    );
  }
}
