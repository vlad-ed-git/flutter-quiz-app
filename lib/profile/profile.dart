import 'package:flutter/material.dart';
import 'package:quizme/theme.dart';


class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile", style: appTheme.textTheme.headline6,),),
    );
  }
}
