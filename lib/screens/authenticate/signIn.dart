import 'package:flutter/material.dart';
import 'package:z_pefect_cup/modals/user.dart';
import 'package:z_pefect_cup/services/auth.dart';
import 'package:z_pefect_cup/services/database.dart';
import 'package:z_pefect_cup/shared/loading.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  AuthService _authService = AuthService();
  bool loader = true;
  @override
  Widget build(BuildContext context) {
    return loader == false
        ? Loading()
        : Scaffold(
            body: GestureDetector(
              onTap: () async {
                setState(() {
                  loader = false;
                });
                BasicUser basicUser = await _authService.signInWitGoogle();

                if (basicUser == null) {
                  print('Null when signing in');
                } else {
                  print(basicUser);
                  //create new doc in firebase
                  await DatabaseService(uid: basicUser.uid)
                      .addDoc('sugar', 'name', 100);
                  setState(() {
                    loader = true;
                  });
                }
              },
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.grey,
                  ),
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image(
                        image: AssetImage("asset/google_logo.png"),
                        height: 35.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Text(
                          'Sign in with Google',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}
