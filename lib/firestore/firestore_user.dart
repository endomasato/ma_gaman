class FirestoreUser {
  final String userName;
  final String uid;
  int? counter;
  final String email;
  final DateTime createdAt;

  FirestoreUser({required this.uid, required this.email, required this.createdAt, required this.userName, required this.counter});

  Map<String, dynamic> toMap() {
    return{
      "userName": userName,
      "uid": uid,
      "counter": counter,
      "email": email,
      "createdAt": createdAt,
    };
  }


}