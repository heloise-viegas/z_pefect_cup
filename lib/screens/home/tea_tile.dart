import 'package:flutter/material.dart';
import 'package:z_pefect_cup/modals/tea.dart';

class TeaTile extends StatelessWidget {
  final Tea tea;
  TeaTile({this.tea});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25.0,
            backgroundColor: Colors.brown[tea.strength],
          ),
          title: Text(tea.name),
          subtitle: Text('Takes ${tea.sugars} sugar(s)'),
        ),
      ),
    );
  }
}
