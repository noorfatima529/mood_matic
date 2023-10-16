import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserModel {
  String? uid;
  String? username;
  String? email;

  UserModel({
    required this.uid,
    required this.username,
    required this.email,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'uid': uid, 'username': username, 'email': email};
  }

  factory UserModel.fromSnapshot(DocumentSnapshot snapshot) {
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;

    print('Bookmarks from Firestore: ${data['bookmarks']}');

    return UserModel(
      uid: snapshot.id,
      username: data['username'] ?? '',
      email: data['email'] ?? '',
    );
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'] as String,
      username: map['username'] as String,
      email: map['email'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
