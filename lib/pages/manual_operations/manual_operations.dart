import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interface_example1/constants/controllers.dart';
import 'package:interface_example1/data/manual_operation_data.dart';
import 'package:interface_example1/data/settings_parameters.dart';
import 'package:interface_example1/helpers/responsivness.dart';
import 'package:interface_example1/pages/manual_operations/widget/manual_operations_group.dart';
import 'package:interface_example1/widgets/custom_text.dart';

import 'widget/manual_operations_large.dart';

class ManualOperationsPage extends StatelessWidget {
  const ManualOperationsPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: mechanicalGroupSelector,
        builder: (context, widget, value) {
          String title;
          if (mechanicalGroupSelector.value == -1) {
            title = menuController.activeItem.value;
          } else {
            title = "test";
            title = mechanicalGroup.groups[mechanicalGroupSelector.value].name;
          }
          return Column(
            children: [
              Row(
                children: [
                  Container(
                      margin: EdgeInsets.only(
                          top:
                              ResponsiveWidget.isSmallScreen(context) ? 56 : 6),
                      child: CustomText(
                        text: title,
                        size: 24,
                        weight: FontWeight.bold,
                      )),
                ],
              ),
              Expanded(
                  child: ListView(
                children: [
                  if (ResponsiveWidget.isLargeScreen(context) ||
                      ResponsiveWidget.isMediumScreen(context))
                    if (ResponsiveWidget.isCustomSize(context))
                      ManualOperationsLarge()
                    else
                      ManualOperationsLarge()
                  else
                    ManualOperationsLarge(),
                ],
              ))
            ],
          );
        });
  }
}
