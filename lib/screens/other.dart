// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interface_example1/controllers/counterController.dart';
import 'package:interface_example1/screens/home.dart';

// ignore: use_key_in_widget_constructors
class OtherScreen extends StatelessWidget {
  final CounterController _counterController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Screen was clicked ${_counterController.counter.value} times"),
        SizedBox(height: 10),
        ElevatedButton(
            onPressed: () {
              Get.to(HomeScreen());
            },
            child: Text("Open HomeScreen"))
      ],
    ));
  }
}
