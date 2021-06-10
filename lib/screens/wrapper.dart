import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:z_pefect_cup/modals/user.dart';
import 'package:z_pefect_cup/screens/home/home.dart';

import 'authenticate/authenticate.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<BasicUser>(context);
    print(user);
    return user == null ? Authenticate() : Home();
  }
}
//
