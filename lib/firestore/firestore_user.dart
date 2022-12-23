import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreUser {
  final String userName;
  final String uid;
  int? counter;
  final String email;
  final Timestamp createdAt;

  FirestoreUser({required this.uid, required this.email, required this.createdAt, required this.userName});

  Map<String, dynamic> toMap() {
    return{
      "userName": userName,
      "uid": uid,
      // "counter": counter,
      "email": email,
      "createdAt": createdAt,
    };
  }


}