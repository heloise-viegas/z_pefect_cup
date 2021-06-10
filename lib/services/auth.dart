import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:z_pefect_cup/modals/user.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //get uid from firebaseUser
  BasicUser _userFromFirebaseUser(User firebaseUser) {
    return firebaseUser != null ? BasicUser(uid: firebaseUser.uid) : null;
  }

  //signInAno
  Future signInAno() async {
    UserCredential userCredential = await _auth.signInAnonymously();
    return _userFromFirebaseUser(userCredential.user);
  }

//signInWitGoogle
  Future signInWitGoogle() async {
    try {
      final GoogleSignIn _googleSignIn = GoogleSignIn();
      final GoogleSignInAccount googleSignInAccount =
          await _googleSignIn.signIn();
      GoogleSignInAuthentication googleAuth =
          await googleSignInAccount.authentication;
      AuthCredential authCredential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
      UserCredential authResult =
          await _auth.signInWithCredential(authCredential);
      return _userFromFirebaseUser(authResult.user);
    } catch (e) {
      print('Error in sign in with google');
      print(e.toString());
      return null;
    }
  }

  //
  Stream<BasicUser> get userStream {
    return _auth
        .authStateChanges()
        .map((User firebaseUser) => _userFromFirebaseUser(firebaseUser));
  }

  //signout
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
//gradlew proprties -XX:MaxHeapSize=256m -Xmx256m
