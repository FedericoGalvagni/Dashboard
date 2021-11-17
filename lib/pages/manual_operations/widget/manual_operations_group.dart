import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:interface_example1/constants/controllers.dart';
import 'package:interface_example1/constants/style.dart';
import 'package:interface_example1/data_models/config.dart';
import 'package:interface_example1/data_models/manual_operation_data.dart';
import 'package:interface_example1/pages/manual_operations/widget/manual_operation_card.dart';
import 'package:interface_example1/routing/routes.dart';
import 'package:interface_example1/widgets/custom_text.dart';

class ManualOperationsGroup extends StatelessWidget {
  final int groupIndex;
  final int mControllPerRow;
  const ManualOperationsGroup(
      {Key? key, required this.groupIndex, required this.mControllPerRow})
      : super(key: key);

  @override
  Widget build(
    BuildContext context,
  ) {
    double _width = MediaQuery.of(context).size.width;

    //print(mechanicalGroup.groups[0].actuators[2].name);

    List<Widget> actuatorsWidget = [];
    actuatorsWidget.add(
      Container(
        height: 30,
        margin: EdgeInsets.only(left: _width / 64, right: _width / 64),
        decoration: BoxDecoration(
          color: Colors.blue,
          border: Border.all(color: Colors.blue),
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
                offset: const Offset(6, 6),
                color: lightGrey.withOpacity(0.5),
                blurRadius: 12)
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            hoverColor: Colors.blue.withOpacity(0.1),
            splashColor: Colors.blue,
            highlightColor: Colors.blue.withOpacity(0.3),
            onTap: () {
              mechanicalGroupSelector = -1;
              navigationController.navigateTo(manualOperationsPageRoute);
            },
            child: const Center(
              child: CustomText(text: "Go Back", color: Colors.white),
            ),
          ),
        ),
      ),
    );
    actuatorsWidget.add(Row(children: const [SizedBox(height: 20)]));
    if (mechanicalGroup.groups[groupIndex].actuators.isEmpty) {
      actuatorsWidget.add(Container());
    } else {
      for (var i = 0;
          i < mechanicalGroup.groups[groupIndex].actuators.length - 1;
          i = i + mControllPerRow) {
        debugPrint("lenght: " +
            mechanicalGroup.groups[groupIndex].actuators.length.toString());
        actuatorsWidget.add(Row(
            children: _getActuatorsRow(
                mechanicalGroup.groups[groupIndex].actuators, i, context)));
        actuatorsWidget.add(Row(children: const [SizedBox(height: 20)]));
      }
    }

    return Column(children: actuatorsWidget);
  }

  List<Widget> _getActuatorsRow(List<Actuator> list, int index, context) {
    double _width = MediaQuery.of(context).size.width;
    List<Widget> row = [];

    // Here the row is being built: check if the index is pointing on the last
    // actuator in the List<Actuator> list, if so we only need to add an actuator
    // instead of two
    for (var i = 0; i < mControllPerRow; i++) {
      debugPrint("i" + i.toString());
      debugPrint("index" + index.toString());
      if (index + i == list.length - 1) {
        debugPrint("true");
        row.add(SizedBox(
          width: _width / 64,
        ));
        row.add(Expanded(child: Container()));
        row.add(SizedBox(
          width: _width / 64,
        ));
      } else {
        debugPrint("false");
        row.add(SizedBox(
          width: _width / 64,
        ));
        row.add(ManualOperationCard(
          type: list[index + i].type,
          id: list[index + i].id,
          title: list[index + i].name,
          value: list[index + i].value,
          onTap: () {},
          backgroundColor:
              Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
                  .withOpacity(0.6),
        ));
      }
    }
    row.add(SizedBox(
      width: _width / 64,
    ));
    return row;
  }
}
