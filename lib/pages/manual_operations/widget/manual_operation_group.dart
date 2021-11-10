// ignore_for_file: avoid_print, prefer_const_constructors

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:interface_example1/constants/style.dart';
import 'package:interface_example1/widgets/custom_text.dart';

enum Prova { motors, pneumatic }

class ManualOperationGroup extends StatelessWidget {
  final String? title;
  final String id;
  final String value;
  final Color? backgroundColor;
  final bool isActive;
  final String type;
  final VoidCallback onTap;

  const ManualOperationGroup({
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
    double _width = MediaQuery.of(context).size.width;
    String leftButtonTitle;
    String rightButtonTitle;
    switch (type) {
      case "motor":
        leftButtonTitle = "-";
        rightButtonTitle = "+";
        break;
      case "pneumatic":
        leftButtonTitle = "-";
        rightButtonTitle = "+";
        break;
      /*case "onOff":
        leftButtonTitle = "off";
        rightButtonTitle = "on";
        break;
      case "zAxis":
        leftButtonTitle = "down";
        rightButtonTitle = "up";
        break;*/
      default:
        leftButtonTitle = "-";
        rightButtonTitle = "+";
    }
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
      child: Container(
        //color: Colors.orange,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(children: [
              //WIDTH SPACER

              Row(
                children: [
                  Container(
                      width: 5,
                      height: 50,
                      color: Colors.blue.withOpacity(0.8)),
                  Container(
                    width: 10,
                    height: 50,
                  ),
                  Container(
                      width: _width / 8,
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
                children: [
                  Container(
                      width: 5,
                      height: 50,
                      color: Colors.blue.withOpacity(0.8)),
                  Container(
                    width: 10,
                    height: 50,
                  ),
                  Container(
                    height: 50,
                    width: _width / 8,
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
            Container(
              //color: Colors.red,
              child: Row(children: [
                Container(
                    height: 30,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(6),
                                  bottomLeft: Radius.circular(6),
                                  topRight: Radius.zero,
                                  bottomRight: Radius.zero)),
                        ),
                        child: Icon(Icons.remove),
                        onPressed: () {})),
                Container(
                    height: 30,
                    width: 50,
                    //color: Colors.red,
                    child: TextField(
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(10.0),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.zero),
                          hintText: '20',
                        ))),
                Container(
                    //color: Colors.blue,
                    height: 30,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.zero,
                                  bottomLeft: Radius.zero,
                                  topRight: Radius.circular(6),
                                  bottomRight: Radius.circular(6))),
                        ),
                        child: Icon(
                          Icons.add,
                          size: 30,
                          color: Colors.white,
                        ),
                        onPressed: () {})),
                SizedBox(width: 5),
              ]),
            )
          ],
        ),
      ),
    ));
    //OLD MANUAL OPERATION ACTUATOR WIDGET
    /*return Expanded(
      child: Container(
        height: 100,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                offset: const Offset(0, 6),
                color: lightGrey.withOpacity(.1),
                blurRadius: 12)
          ],
        ),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                    child: Container(
                  color: backgroundColor ?? active,
                  height: 5,
                ))
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    alignment: Alignment.center,
                    child: CustomText(
                      text: title,
                      size: 30,
                      weight: FontWeight.w300,
                      color: dark,
                    ))
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              children: [
                SizedBox(
                  width: _width / 128,
                ),
                Expanded(
                    child: ElevatedButton(
                  onPressed: () {
                    HttpService.get(id + ".0");
                  },
                  child: Text(leftButtonTitle),
                )),
                SizedBox(
                  width: _width / 128,
                ),
                Container(
                    decoration: BoxDecoration(
                      color: insert,
                      boxShadow: [
                        BoxShadow(
                          offset: const Offset(0, 1),
                          color: insert.withOpacity(.1),
                        )
                      ],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                        child: CustomText(
                      text: value.toString(),
                      size: 20,
                    ))),
                SizedBox(
                  width: _width / 128,
                ),
                Expanded(
                    child: ElevatedButton(
                  onPressed: () {
                    print("pulsante premuto");
                    HttpService.get(id + ".1");
                  },
                  child: Text(rightButtonTitle),
                )),
                SizedBox(
                  width: _width / 128,
                ),
              ],
            ),
            Expanded(child: Container()),
          ],
        ),
      ),
    );*/
  }
}
