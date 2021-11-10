import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interface_example1/constants/controllers.dart';
import 'package:interface_example1/helpers/responsivness.dart';
import 'package:interface_example1/pages/manual_operations/widget/manual_operations_large.dart';
import 'package:interface_example1/widgets/custom_text.dart';

class ManualOperationsPage extends StatelessWidget {
  const ManualOperationsPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Obx(
          () => Row(
            children: [
              Container(
                  margin: EdgeInsets.only(
                      top: ResponsiveWidget.isSmallScreen(context) ? 56 : 6),
                  child: CustomText(
                    text: menuController.activeItem.value,
                    size: 24,
                    weight: FontWeight.bold,
                  )),
            ],
          ),
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
  }
}
