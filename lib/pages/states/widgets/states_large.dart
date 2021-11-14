import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:interface_example1/classes/http/http_service.dart';
import 'package:interface_example1/data_models/config.dart';
import 'package:interface_example1/data_models/states_data.dart';
import 'package:interface_example1/pages/states/widgets/states_datatable.dart';
import 'package:interface_example1/widgets/custom_text.dart';

class StatesLarge extends StatefulWidget {
  const StatesLarge({Key? key}) : super(key: key);

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
        SizedBox(
            width: _width / 4,
            height: 50,
            child: TextField(
              controller: comandController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter a search term',
              ),
            )),
        SizedBox(
            width: 60,
            height: 50,
            child: ElevatedButton(
                onPressed: () {
                  showTableIndicator = true;
                  HttpService.get(comandController.text);
                  debugPrint(comandController.text);
                  setState(() {});
                },
                child:
                    const CustomText(text: "GO", size: 18, weight: FontWeight.bold))),
        Expanded(child: Container()),
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
      Row(
        children: [
          Container(
            height: 5,
          )
        ],
      ),
      ValueListenableBuilder(
          valueListenable: comandsList,
          builder: (context, value, widget) {
            return _progressIndicator();
          }),
      Row(
        children: [
          Container(
            height: 5,
          )
        ],
      ),
      Row(children: [
        Expanded(
            flex: 1,
            child: ValueListenableBuilder(
                valueListenable: comandsList,
                builder: (context, value, widget) {
                  showTableIndicator = false;
                  debugPrint("we");
                  return const DataTableD();
                })),
      ])
    ]);
  }

  Widget _progressIndicator() {
    if (showTableIndicator) {
      return Container(
          margin: const EdgeInsets.only(left: 5, right: 5),
          child: const LinearProgressIndicator(
            minHeight: 10,
          ));
    } else {
      return Container();
    }
  }
}
