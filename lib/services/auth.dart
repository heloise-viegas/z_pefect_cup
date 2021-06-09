import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future signInWitGoogle() async {
    try {
      print('v');
      final GoogleSignIn _googleSignIn = GoogleSignIn(); //4.5.9
      final googleSignInAccount = await _googleSignIn.signIn();
      GoogleSignInAuthentication googleAuth =
          await googleSignInAccount!.authentication;
      AuthCredential authCredential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
      UserCredential authResult =
          await _auth.signInWithCredential(authCredential);

      print(authCredential);
      return authResult.user;
    } catch (e) {
      print('Error in sign in with google');
      print(e.toString());
    }
  }
}
