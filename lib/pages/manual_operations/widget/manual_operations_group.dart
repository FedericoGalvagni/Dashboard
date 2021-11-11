// ignore_for_file: unnecessary_new
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:interface_example1/constants/controllers.dart';
import 'package:interface_example1/constants/style.dart';
import 'package:interface_example1/data/manual_operation_data.dart';
import 'package:interface_example1/data/settings_parameters.dart';
import 'package:interface_example1/pages/manual_operations/widget/manual_operation_card.dart';
import 'package:interface_example1/routing/routes.dart';
import 'package:interface_example1/widgets/custom_text.dart';

class ManualOperationsGroup extends StatelessWidget {
  int groupIndex;
  ManualOperationsGroup({Key? key, required this.groupIndex}) : super(key: key);

  @override
  Widget build(
    BuildContext context,
  ) {
    double _width = MediaQuery.of(context).size.width;
    print(mechanicalGroup.groups[0].actuators[2].name);

    List<Widget> actuatorsWidget = [];
    /*String responseBody =
        '{"Gruppo1": [{"name": "Motore", "type": "motor", "value": "10"},{"name": "Motore", "type": "motor", "value": "10"},{"name": "Motore", "type": "motor", "value": "10"},{"name": "Motore", "type": "motor", "value": "10"},{"name": "Motore", "type": "motor", "value": "10"},{"name": "Motore", "type": "motor", "value": "10"},{"name": "Motore 1", "type": "motor", "value": "-25"},{"name": "Motore X", "type": "motor", "value": "125"},  {"name": "Motore Y", "type": "motor", "value": "10"},  {"name": "Motore Z", "type": "motor", "value": "-67"}          ]    }';
    var actuatorsObjsJson = jsonDecode(responseBody)['Gruppo1'] as List;
    List<Actuator> actuatorsList = actuatorsObjsJson
        .map((actuatorJson) => Actuator.fromJson(actuatorJson))
        .toList();*/
    actuatorsWidget.add(
      new Container(
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
              child: CustomText(
                text: "Go Back",
              ),
            ),
          ),
        ),
      ),
    );
    actuatorsWidget.add(new Row(children: [SizedBox(height: 20)]));
    if (mechanicalGroup.groups[groupIndex].actuators.length == 0) {
      actuatorsWidget.add(Container());
    } else {
      for (var i = 0;
          i < mechanicalGroup.groups[groupIndex].actuators.length;) {
        if (i.floor().isEven) {
          actuatorsWidget.add(new Row(
              children: _getActuatorsRow(
                  mechanicalGroup.groups[groupIndex].actuators, i, context)));
          actuatorsWidget.add(new Row(children: [SizedBox(height: 20)]));
        }
        // Because of how the row is built the i (index) must be increased by two
        i = i + 2;
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
    if (index == list.length - 1) {
      row.add(new SizedBox(
        width: _width / 64,
      ));
      row.add(new ManualOperationCard(
        type: list[index].type,
        id: "0",
        title: list[index].name,
        value: list[index].value,
        onTap: () {},
        backgroundColor: Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
            .withOpacity(0.6),
      ));
      row.add(new SizedBox(
        width: _width / 64,
      ));
      row.add(new Expanded(child: Container()));
      row.add(new SizedBox(
        width: _width / 64,
      ));
      return row;
    } else {
      row.add(new SizedBox(
        width: _width / 64,
      ));
      row.add(new ManualOperationCard(
        type: list[index].type,
        id: "0",
        title: list[index].name,
        value: list[index].value,
        onTap: () {},
        backgroundColor: Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
            .withOpacity(0.6),
      ));
      row.add(new SizedBox(
        width: _width / 64,
      ));
      row.add(new ManualOperationCard(
        type: list[index + 1].type,
        id: "0",
        title: list[index + 1].name,
        value: list[index + 1].value,
        onTap: () {},
        backgroundColor: Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
            .withOpacity(0.6),
      ));
      row.add(new SizedBox(
        width: _width / 64,
      ));
      return row;
    }
  }
}
