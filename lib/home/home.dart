import 'package:flutter/material.dart';
import 'package:quizme/routes.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: const Text('home'),
          onPressed: () => {
            Navigator.pushNamed(context, '/topics')
          },
          ),
      ),
    );
  }
}
