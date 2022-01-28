import 'package:flutter/material.dart';
import 'package:quizme/theme.dart';


class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About", style: appTheme.textTheme.headline6,),),
    );
  }
}
