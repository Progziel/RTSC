import 'package:boxing/terms.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleAuth{
  final googleSignIn = GoogleSignIn();
  GoogleSignInAccount? _user;
  GoogleSignInAccount? get user => _user;
  Future googleLogin( context) async {
    try {
      final googleUser = await googleSignIn.signIn();
      if (googleUser == null) return;
      _user = googleUser;
      final googleAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      var check = await FirebaseAuth.instance.signInWithCredential(credential);
      if(!check.user!.isAnonymous){
        Get.to(()=> TermsandConditions());
      }
    } catch (e){
      print((e).toString());
    }

  }


  Future logout()async{
   // await googleSignIn.disconnect();
    FirebaseAuth.instance.signOut();
  }

}



