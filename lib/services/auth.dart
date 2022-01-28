import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

//TODO -- user agreement -> see flutterfire phone auth
//TODO 2 -- setup phone auth for ios

class AuthService {
  final userStream = FirebaseAuth.instance.authStateChanges();
  final user = FirebaseAuth.instance.currentUser;
}
