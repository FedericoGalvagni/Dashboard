import 'package:flutter/material.dart';
import 'package:interface_example1/classes/modelli/variabili_globali.dart';
import 'package:interface_example1/classes/modelli/operazioni_manuali_modello.dart';
import 'package:interface_example1/constants/style.dart';
import 'package:interface_example1/pages/manual_operations/widget/operazioni_manuali_group.dart';
import 'package:interface_example1/pages/manual_operations/widget/operazioni_manuali_icon.dart';

class OperazioniManualiIconsGrid extends StatefulWidget {
  const OperazioniManualiIconsGrid(
      {Key? key, required this.iconsPerRow, required this.aControllPerRow})
      : super(key: key);
  final int iconsPerRow;
  final int aControllPerRow;

  @override
  State<OperazioniManualiIconsGrid> createState() =>
      _OperazioniManualiIconsGridState();
}

class _OperazioniManualiIconsGridState
    extends State<OperazioniManualiIconsGrid> {
  @override
  Widget build(BuildContext context) {
    //print("length: " + mechanicalGroup.groups.length.toString());
    if (mechanicalGroupSelector == -1) {
      return Column(children: buildColumn(context));
    } else {
      return OperazioniManualiGroup(
        iGruppi: mechanicalGroupSelector,
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
    for (var i = 0; i < gruppi.length; i = i + widget.iconsPerRow) {
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
