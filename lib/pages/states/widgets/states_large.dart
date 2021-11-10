// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:interface_example1/classes/http/http_service.dart';
import 'package:interface_example1/data/settings_parameters.dart';
import 'package:interface_example1/pages/states/widgets/states_datatable.dart';
import 'package:interface_example1/widgets/custom_text.dart';

class StatesLarge extends StatefulWidget {
  @override
  StatesLargeState createState() => StatesLargeState();
}

class StatesLargeState extends State<StatesLarge> {
  final comandController = TextEditingController();
  final comandController2 = TextEditingController();
  int dropdownValue = 10;

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return Column(children: [
      Row(children: [
        SizedBox(
          width: _width / 100,
        ),
        Container(
            width: _width / 4,
            height: 50,
            child: TextField(
              controller: comandController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter a search term',
              ),
            )),
        Container(
            width: 60,
            height: 50,
            child: ElevatedButton(
                onPressed: () {
                  HttpService.get(comandController.text);
                  print(comandController.text);
                },
                child:
                    CustomText(text: "GO", size: 18, weight: FontWeight.bold))),
        Expanded(child: Container()), // Responsive Spacer
        //Old itemPerPage textfield
        /*Container(
            alignment: Alignment.centerLeft,
            width: _width / 16,
            height: 50,
            child: TextField(
              enableInteractiveSelection: true,
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
              onChanged: (text) {
                itemPerPage.value = int.parse(comandController2
                    .text); //int.parse(comandController2.text);
              },
              textAlign: TextAlign.center,
              controller: comandController2,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            )),*/
        //-------
        // SPACER
        //-------
        SizedBox(
          width: _width / 100,
        )
      ]),
      //-------
      // TABLE
      //-------
      Row(children: [
        Expanded(flex: 1, child: DataTableD()),
      ])
    ]);
  }
}
