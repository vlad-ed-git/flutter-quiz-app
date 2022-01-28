import 'package:flutter/material.dart';
import 'package:quizme/routes.dart';
import 'package:quizme/services/auth.dart';
import 'package:quizme/login/login.dart';
import 'package:quizme/topics/topics.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: AuthService().userStream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text('loading...');
          } else if (snapshot.hasError) {
            return const Center(
              child: Text('Authentication error'),
            );
          } else if (snapshot.hasData) {
            return const TopicsScreen();
          } else {
            return const LoginScreen();
          }
        });
  }
}
