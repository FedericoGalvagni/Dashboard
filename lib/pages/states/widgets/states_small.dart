// ignore_for_file: prefer_const_constructors

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:interface_example1/classes/http/http_service.dart';
import 'package:interface_example1/pages/states/widgets/states_datatable.dart';
import 'package:interface_example1/widgets/custom_text.dart';

class StatesSmall extends StatelessWidget {
  final comandController = TextEditingController();
  StatesSmall({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Row(children: [
          SizedBox(
            width: _width / 50,
          ),
          Container(
              width: _width / 2,
              height: 40,
              child: TextField(
                controller: comandController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter a search term',
                ),
              )),
          Container(
              width: 60,
              height: 40,
              child: ElevatedButton(
                  onPressed: () {
                    HttpService.get(comandController.text);
                    print(comandController.text);
                  },
                  child: CustomText(
                      text: "GO", size: 18, weight: FontWeight.bold)))
        ]),
        Row(
          children: [DataTableD()],
        )
      ],
    );
  }
}
