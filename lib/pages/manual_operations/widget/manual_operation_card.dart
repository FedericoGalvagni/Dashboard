import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:interface_example1/constants/style.dart';
import 'package:interface_example1/data_models/config.dart';
import 'package:interface_example1/widgets/custom/custom_text.dart';
import 'package:interface_example1/widgets/custom/stepper.dart';
import 'package:interface_example1/widgets/spacer/custom_horizontal_spacer.dart';

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
          borderRadius: BorderRadius.circular(10),
          color: surface(4),
          boxShadow: boxShadow),
      child: Row(
        
        children: [
          customHspacer(factor: 256),
          Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: Container()),
                RichText(
                    textAlign: TextAlign.left,
                    text: TextSpan(children: [
                      TextSpan(
                          text: "$title\n",
                          style: TextStyle(
                              fontSize: 40,
                              color: getEmphasis(onSurface, emphasis.high))),
                      TextSpan(
                          text: "max 200 min 175",
                          style: TextStyle(
                              fontSize: 16,
                              color: getEmphasis(onSurface, emphasis.medium))),
                    ])),
                Expanded(child: Container()),

                /*

                Row(
                  children: [
                    
                    SizedBox(
                        height: 50,
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: CustomText(
                            text: title,
                            color: getEmphasis(onSurface, emphasis.high),
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
                      width: 10,
                    ),
                    SizedBox(
                      height: 50,
                      child: CustomText(
                        text: "max: 200, min: 200",
                        color: getEmphasis(onSurface, emphasis.medium),
                        size: 15,
                        weight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),*/
              ]),
          ValueStepper(
            id: id,
            sendData: true,
            nodeUrl: "http",
            newValue: (newValue) {},
            value: value,
          ),
          customHspacer(factor: 256),
        ],
      ),
    ));
  }
}
