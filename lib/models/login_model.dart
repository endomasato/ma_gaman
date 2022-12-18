import 'dart:js';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ma_gaman/view/home.dart';
import 'package:ma_gaman/view/login_screen.dart';

import '../firestore/firestore_user.dart';


final LoginModelProvider = ChangeNotifierProvider((ref) => LoginModel());
class LoginModel extends ChangeNotifier {
  String email = "endo@test.com";
  String password = "endoendo";
  User? currentUser;
  void toMyApp({required BuildContext context}) => Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
  Future<void> login(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email, password: password);
          toMyApp(context: context);
    } on FirebaseException catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> createUser(BuildContext context) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
      toMyApp(context: context);
    } on FirebaseException catch (e) {
      debugPrint(e.toString());
    }
  }

}

