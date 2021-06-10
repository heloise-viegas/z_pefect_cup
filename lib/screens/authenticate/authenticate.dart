import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:z_pefect_cup/screens/authenticate/signIn.dart';
import 'package:z_pefect_cup/services/auth.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({Key key}) : super(key: key);

  @override
  _AuthenticateState createState() => _AuthenticateState();
}

//
class _AuthenticateState extends State<Authenticate> {
  @override
  Widget build(BuildContext context) {
   return Container(
     child: SignIn(),
   );
  }
}
