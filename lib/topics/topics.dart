import 'package:flutter/material.dart';
import 'package:quizme/shared/bottom_nav.dart';
import 'package:quizme/theme.dart';


class TopicsScreen extends StatelessWidget {
  const TopicsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Topics", style: appTheme.textTheme.headline6,),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
