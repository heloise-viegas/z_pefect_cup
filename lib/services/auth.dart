import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future signInAno() async {
    UserCredential userCredential = await _auth.signInAnonymously();
    User user = userCredential.user; //
    return user;
  }

  //Error signing in
  Future signInWitGoogle() async {
    try {
      final GoogleSignIn _googleSignIn = GoogleSignIn();
      final GoogleSignInAccount googleSignInAccount =
          await _googleSignIn.signIn();
      print('v');
      GoogleSignInAuthentication googleAuth =
          await googleSignInAccount.authentication; //-Xmx1536M
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
