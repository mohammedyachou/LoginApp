import 'package:firebase_auth/firebase_auth.dart';
import 'package:dio/dio.dart';
import '../../constants/strings.dart';
import '../../data/models/user_model.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/material.dart';

class UserLogin {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );

  Future<UserModel?> login(String email, String password) async {
    try {
      const api = baseUrl;
      final data = {"email": email, "password": password};
      final dio = Dio();
      Response response;
      response = await dio.post(api, data: data);
      if (response.statusCode == 200) {
        return UserModel(email: email, token: response.data.toString());
      } else {
        return null;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<UserModel?> googleSignIn(BuildContext context) async {
    try {
      GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();
      GoogleSignInAuthentication? googleSignInAuthentication =
      await googleSignInAccount?.authentication;
      AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication?.accessToken,
        idToken: googleSignInAuthentication?.idToken,
      );
      if (googleSignInAccount != null) {
        UserCredential userCredential =
        await _auth.signInWithCredential(credential);
        final snackBar = SnackBar(content: Text(userCredential.user!.displayName!));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        return UserModel(email: userCredential.user!.email!, token: userCredential.user!.displayName!);
      }
    } catch (e) {
      print("here---->");
      final snackBar = SnackBar(content: Text(e.toString()));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }



}
