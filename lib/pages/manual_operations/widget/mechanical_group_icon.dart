// ignore_for_file: avoid_print

import 'dart:html';

import 'package:flutter/material.dart';
import 'package:interface_example1/constants/controllers.dart';
import 'package:interface_example1/constants/style.dart';
import 'package:interface_example1/data/manual_operation_data.dart';
import 'package:interface_example1/data/settings_parameters.dart';
import 'package:interface_example1/routing/routes.dart';
import 'package:interface_example1/widgets/custom_text.dart';

class MechanicalGroupIcon extends StatelessWidget {
  int groupIndex;
  MechanicalGroupIcon({Key? key, required this.groupIndex});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: AspectRatio(
        aspectRatio: 1,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(3),
            border: Border.all(
              color: Colors.blue.withOpacity(0.7),
              width: 2,
            ),
            boxShadow: [
              BoxShadow(
                  offset: const Offset(6, 6),
                  color: lightGrey.withOpacity(0.5),
                  blurRadius: 12)
            ],
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              hoverColor: Colors.blue.withOpacity(0.1),
              splashColor: Colors.blue,
              highlightColor: Colors.blue.withOpacity(0.3),
              onTap: () {
                print(groupIndex);
                mechanicalGroupSelector = groupIndex;
                navigationController.navigateTo(manualOperationsPageRoute);
              },
              child: Center(
                child: Stack(
                  children: [
                    Center(
                      child: Container(
                        margin: EdgeInsets.all(20),
                        child: Image.asset(
                            "assets/icons/" + groupIndex.toString() + ".png",
                            color: Colors.black.withOpacity(0.8)),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  margin: EdgeInsets.only(left: 10, right: 10),
                                  height: 5,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(2),
                                    color: Colors.blue,
                                    boxShadow: [
                                      BoxShadow(
                                          offset: const Offset(1, 1),
                                          color: Colors.blue.withOpacity(0.1),
                                          blurRadius: 5)
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                height: 10,
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomText(
                                text: mechanicalGroup.groups[groupIndex].name,
                                size: 15,
                                weight: FontWeight.w600,
                                color: dark,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                height: 10,
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
