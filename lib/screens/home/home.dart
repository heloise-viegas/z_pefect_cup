import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:z_pefect_cup/modals/tea.dart';
import 'package:z_pefect_cup/screens/home/teaList.dart';
import 'package:z_pefect_cup/services/auth.dart';
import 'package:z_pefect_cup/services/database.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Tea>>.value(
      value: DatabaseService().dataStream,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.brown[100],
          centerTitle: true,
          title: Text('Home'),
          actions: <Widget>[
            TextButton(
              onPressed: () async {
                await _auth.signOut();
              },
              child: Icon(
                Icons.close_outlined,
                color: Colors.brown,
              ),
            )
          ],
        ),
        body: Container(
          child: TeaList(),
        ),
      ),
    );
  }
}

//
