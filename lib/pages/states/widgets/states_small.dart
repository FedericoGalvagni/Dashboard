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
          SizedBox(
              width: _width / 2,
              height: 40,
              child: TextField(
                controller: comandController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter a search term',
                ),
              )),
          SizedBox(
              width: 60,
              height: 40,
              child: ElevatedButton(
                  onPressed: () {
                    HttpService(id:comandController.text).get();
                    debugPrint(comandController.text);
                  },
                  child: const CustomText(
                      text: "GO", size: 18, weight: FontWeight.bold)))
        ]),
        Row(
          children: const [DataTableD()],
        )
      ],
    );
  }
}
