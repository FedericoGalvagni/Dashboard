// ignore_for_file: unnecessary_new

import 'package:flutter/material.dart';
import 'package:interface_example1/data/manual_operation_data.dart';
import 'package:interface_example1/data/settings_parameters.dart';
import 'package:interface_example1/pages/manual_operations/widget/manual_operations_group.dart';
import 'package:interface_example1/pages/manual_operations/widget/mechanical_group_icon.dart';

class ManualOperationsLarge extends StatelessWidget {
  const ManualOperationsLarge({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //print("length: " + mechanicalGroup.groups.length.toString());
    if (mechanicalGroupSelector == -1) {
      return Column(children: buildColumn(context));
    } else {
      return ManualOperationsGroup(groupIndex: mechanicalGroupSelector);
    }
  }

  List<Widget> buildColumn(context) {
    List<Widget> mechanicalGroupIcons = [];

    if (mechanicalGroup.groups.isEmpty) {
      mechanicalGroupIcons.add(Container());
      return mechanicalGroupIcons;
    }
    for (var i = 0; i < mechanicalGroup.groups.length; i = i + iconPerRow) {
      //print("buildIndex: " + i.toString());
      mechanicalGroupIcons.add((Row(children: [
        Container(
          height: 30,
        )
      ])));
      mechanicalGroupIcons.add(Row(children: buildRow(i, context)));
      mechanicalGroupIcons.add((Row(children: [
        Container(
          height: 30,
        )
      ])));
    }

    return mechanicalGroupIcons;
  }

  List<Widget> buildRow(int i, context) {
    double _width = MediaQuery.of(context).size.width;
    List<Widget> row = [];
    int ii;
    for (ii = 0; ii < iconPerRow; ii++) {
      if (i + ii >= mechanicalGroup.groups.length) {
        row.add(Container(width: _width / 64, ));
        row.add(Expanded(child: Container(color: Colors.blue)));
        //print("true" + ii.toString());
      } else {
        row.add(Container(width: _width / 64, height: 10,));

        row.add(MechanicalGroupIcon(
          groupIndex: i + ii,
        ));
        //print("false" + ii.toString());
      }
    }
    row.add(Container(width: _width / 64, height: 10, ));
    return row;
  }
}
