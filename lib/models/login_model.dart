import 'dart:js';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ma_gaman/view/home.dart';
import 'package:ma_gaman/view/login_screen.dart';

import '../firestore/firestore_user.dart';


final LoginModelProvider = ChangeNotifierProvider((ref) => LoginModel());
class LoginModel extends ChangeNotifier {
  String email = "";
  String password = "";
  String userName = "";
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
  Future<void> createFirestoreUser({required BuildContext context,required String uid}) async{
    final newUser = FirestoreUser(
        uid: uid,
        email: email,
        createdAt: Timestamp.now(),
        userName: userName,
        // counter: counter
    ).toMap();
    await FirebaseFirestore.instance.collection("users").doc(uid).set(newUser);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('ユーザーが作成できました')));
    notifyListeners();
  }
  Future<void> createUser(BuildContext context) async {
    try {
      UserCredential result = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
      final User? user = result!.user;
      final String uid = user!.uid;
      await createFirestoreUser(context: context, uid: uid);
      toMyApp(context: context);
    } on FirebaseException catch (e) {
      debugPrint(e.toString());
    }
  }

}

