import 'package:flutter/material.dart';
import 'package:interface_example1/constants/style.dart';
import 'package:interface_example1/data_models/config.dart';
import 'package:interface_example1/data_models/manual_operation_data.dart';
import 'package:interface_example1/pages/manual_operations/widget/manual_operations_group.dart';
import 'package:interface_example1/pages/manual_operations/widget/mechanical_group_icon.dart';

class ManualOperationIconsGrid extends StatefulWidget {
  const ManualOperationIconsGrid(
      {Key? key, required this.iconsPerRow, required this.aControllPerRow})
      : super(key: key);
  final int iconsPerRow;
  final int aControllPerRow;

  @override
  State<ManualOperationIconsGrid> createState() =>
      _ManualOperationIconsGridState();
}

class _ManualOperationIconsGridState extends State<ManualOperationIconsGrid> {
  @override
  Widget build(BuildContext context) {
    //print("length: " + mechanicalGroup.groups.length.toString());
    if (mechanicalGroupSelector == -1) {
      return Column(children: buildColumn(context));
    } else {
      return ManualOperationsGroup(
        indiceGruppi: mechanicalGroupSelector,
        attuatoriPerRiga: widget.aControllPerRow,
      );
    }
  }

  List<Widget> buildColumn(context) {
    List<Widget> mechanicalGroupIcons = [];
    double _width = MediaQuery.of(context).size.width;
    if (gruppi.isEmpty) {
      mechanicalGroupIcons.add(Container());
      return mechanicalGroupIcons;
    }
    for (var i = 0;
        i < gruppi.length;
        i = i + widget.iconsPerRow) {
      //print("buildIndex: " + i.toString());
      mechanicalGroupIcons.add((Row(children: [
        Container(
          height: _width / 64,
        )
      ])));
      mechanicalGroupIcons.add(Row(children: buildRow(i, context)));
      mechanicalGroupIcons.add((Row(children: [
        Container(
          height: _width / 64,
        )
      ])));
    }

    return mechanicalGroupIcons;
  }

  List<Widget> buildRow(int i, context) {
    double _width = MediaQuery.of(context).size.width;
    List<Widget> row = [];
    int ii;
    for (ii = 0; ii < widget.iconsPerRow; ii++) {
      if (i + ii >= gruppi.length) {
        row.add(Container(
          width: _width / 64,
        ));
        row.add(Expanded(child: Container(color: primary)));
        //print("true" + ii.toString());
      } else {
        row.add(SizedBox(
          width: _width / 64,
          height: _width / 128,
        ));

        row.add(MechanicalGroupIcon(
          indiceGruppi: i + ii,
        ));
        //print("false" + ii.toString());
      }
    }
    row.add(SizedBox(
      width: _width / 64,
      height: _width / 128,
    ));
    return row;
  }
}
