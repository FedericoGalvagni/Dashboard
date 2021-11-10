// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interface_example1/controllers/counterController.dart';
import 'package:interface_example1/screens/other.dart';

class HomeScreen extends StatelessWidget {
  final CounterController counterController = Get.put(CounterController());

  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                  child: Text("Clicks: ${counterController.counter.value} ")),
              SizedBox(height: 10),
              Center(
                  child: ElevatedButton(
                      onPressed: () {
                        Get.to(OtherScreen());
                      },
                      child: Text("Open Other Screen")))
            ],
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          counterController.increment();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
