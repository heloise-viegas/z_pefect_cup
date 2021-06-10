import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:z_pefect_cup/modals/tea.dart';

class TeaList extends StatefulWidget {
  @override
  _TeaListState createState() => _TeaListState();
}

class _TeaListState extends State<TeaList> {
  @override
  Widget build(BuildContext context) {
    final teas = Provider.of<List<Tea>>(context);
    teas.forEach((tea) {
      print(tea.name);
      print(tea.sugars);
    });

    return ListView.builder(
      itemCount: teas.length,
      itemBuilder: (context, index) {
        return TeaTile(brew: teas[index]);
      },
    );
  }
}
