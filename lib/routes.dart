//navigator 1.0 approach
import 'package:quizme/home/home.dart';
import 'package:quizme/about/about.dart';
import 'package:quizme/login/login.dart';
import 'package:quizme/profile/profile.dart';
import 'package:quizme/topics/topics.dart';
import 'package:quizme/quiz/quiz.dart';

//quizScreen requires id from database
var appRoutes = {
  '/': (context) => const HomeScreen(),
  '/login': (context) => const LoginScreen(),
  '/profile': (context) => const ProfileScreen(),
  '/topics': (context) => const TopicsScreen(),
  '/about': (context) => const AboutScreen(),
};
