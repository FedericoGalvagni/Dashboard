import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:interface_example1/constants/style.dart';
import 'package:interface_example1/data_models/config.dart';
import 'package:interface_example1/widgets/custom_text.dart';
import 'package:interface_example1/widgets/stepper.dart';

enum Prova { motors, pneumatic }

class ManualOperationCard extends StatelessWidget {
  final String? title;
  final String id;
  final String value;
  final Color? backgroundColor;
  final bool isActive;
  final String type;
  final VoidCallback onTap;

  const ManualOperationCard({
    Key? key,
    this.title,
    required this.id,
    this.backgroundColor,
    required this.value,
    this.isActive = false,
    required this.type,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      height: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              offset: const Offset(6, 6),
              color: lightGrey.withOpacity(0.5),
              blurRadius: 12)
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                        width: 5,
                        height: 50,
                        color: Colors.blue.withOpacity(0.8)),
                    const SizedBox(
                      width: 10,
                      height: 50,
                    ),
                    SizedBox(
                        height: 50,
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: CustomText(
                            text: title,
                            color: dark,
                            size: 30,
                            weight: FontWeight.bold,
                          ),
                        )),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        width: 5,
                        height: 50,
                        color: Colors.blue.withOpacity(0.8)),
                    Container(
                      width: 10,
                    ),
                    SizedBox(
                      height: 50,
                      child: CustomText(
                        text: "max: 200, min: 200",
                        color: dark.withOpacity(0.7),
                        size: 15,
                        weight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ]),
          ValueStepper(
            id: id,
            sendData: true,
            nodeUrl: nodeUrl,
            newValue: (newValue) {
              
            },
            value: value,
          )
        ],
      ),
    ));
  }
}
