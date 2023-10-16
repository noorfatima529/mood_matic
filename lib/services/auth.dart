import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mood_matic/models/usermodel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Auth {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  //singup user using email and password
  Future<Map> signup(
    String username,
    String email,
    String password,
  ) async {
    if (email.isNotEmpty && password.isNotEmpty) {
      try {
        UserCredential userCredential =
            await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        await _firestore
            .collection('users')
            .doc(userCredential.user!.uid)
            .set({'username': username});
        SharedPreferences prefes = await SharedPreferences.getInstance();
        prefes.setBool('isLoggedin', true);
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          return {'error': 'The password provided is too weak.'};
        } else if (e.code == 'email-already-in-use') {
          return {'error': 'The account already exists for that email.'};
        }
      } catch (e) {
        return {'error': e.toString()};
      }
    }
    return {
      'success': true,
    };
  }

  //login user using email and password
  Future<Map> login(String email, String password) async {
    if (email.isNotEmpty && password.isNotEmpty) {
      try {
        UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );

        SharedPreferences prefes = await SharedPreferences.getInstance();
        prefes.setBool('isLoggedin', true);
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          return {'error': 'No user found for that email.'};
        } else if (e.code == 'wrong-password') {
          return {'error': 'Wrong password provided for that user.'};
        }
      } catch (e) {
        return {'error': e.toString()};
      }
    }

    return {
      'success': true,
    };
  }

  //get user details from firebase future
  Future<UserModel> getUserDetails() async {
    DocumentSnapshot usersnpashot =
        await _firestore.collection('users').doc(_auth.currentUser?.uid).get();
    return UserModel.fromSnapshot(usersnpashot);
  }
}
