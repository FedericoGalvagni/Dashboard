// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:interface_example1/constants/style.dart';
import 'package:interface_example1/data/manual_operation_data.dart';
import 'package:interface_example1/data/settings_parameters.dart';
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
                mechanicalGroupSelector.value = groupIndex;
              },
              child: const Center(
                child: CustomText(
                  text: "we",
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
