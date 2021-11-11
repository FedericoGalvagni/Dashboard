// ignore_for_file: unnecessary_new

import 'dart:convert';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:interface_example1/data/actuators_model.dart';
import 'package:interface_example1/pages/manual_operations/widget/manual_operation_group.dart';

class ManualOperationsLarge extends StatelessWidget {
  const ManualOperationsLarge({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;

    List<Widget> actuatorsWidget = [];
    String responseBody =
        '{"Gruppo1": [{"name": "Motore", "type": "motor", "value": "10"},{"name": "Motore", "type": "motor", "value": "10"},{"name": "Motore", "type": "motor", "value": "10"},{"name": "Motore", "type": "motor", "value": "10"},{"name": "Motore", "type": "motor", "value": "10"},{"name": "Motore", "type": "motor", "value": "10"},{"name": "Motore 1", "type": "motor", "value": "-25"},{"name": "Motore X", "type": "motor", "value": "125"},  {"name": "Motore Y", "type": "motor", "value": "10"},  {"name": "Motore Z", "type": "motor", "value": "-67"}          ]    }';
    var actuatorsObjsJson = jsonDecode(responseBody)['Gruppo1'] as List;
    List<Actuator> actuatorsList = actuatorsObjsJson
        .map((actuatorJson) => Actuator.fromJson(actuatorJson))
        .toList();
    if (actuatorsList.length == 0) {
      actuatorsWidget.add(Container());
    } else {
      for (var i = 0; i < actuatorsList.length;) {
        if (i.floor().isEven) {
          actuatorsWidget.add(
              new Row(children: _getActuatorsRow(actuatorsList, i, context)));
          actuatorsWidget.add(new Row(children: [SizedBox(height: 20)]));
        }
        // Because of how the row is built the i (index) must be increased by two
        i = i + 2;
      }
    }

    return Column(
        children:
            actuatorsWidget /*[
      Row(
        children: [
          ManualOperationGroup(
            type: "Prova.motors",
            id: "0",
            title: "Motore 1",
            value: 0,
            onTap: () {},
            backgroundColor: Colors.orange,
          ),
          SizedBox(
            width: _width / 64,
          ),
          ManualOperationGroup(
            type: "Prova.pneumatic",
            id: "1",
            title: "Pistone",
            value: 0,
            backgroundColor: Colors.lightGreen,
            onTap: () {},
          )
        ],
      ),
      Row(
        children: [
          ManualOperationGroup(
            type: "Prova.motors",
            id: "0",
            title: "Motore 1",
            value: 0,
            onTap: () {},
            backgroundColor: Colors.orange,
          ),
          SizedBox(
            width: _width / 64,
          ),
          ManualOperationGroup(
            type: "Prova.pneumatic",
            id: "1",
            title: "Pistone",
            value: 0,
            backgroundColor: Colors.lightGreen,
            onTap: () {},
          )
        ],
      )*/
        );
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
      row.add(new ManualOperationGroup(
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
      row.add(new ManualOperationGroup(
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
      row.add(new ManualOperationGroup(
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
