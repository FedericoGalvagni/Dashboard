import 'package:flutter/material.dart';
import 'package:interface_example1/helpers/responsivness.dart';
import 'package:interface_example1/pages/manual_operations/widget/manual_operation_large.dart';
import 'package:interface_example1/pages/manual_operations/widget/manual_operations_medium.dart';
import 'widget/manual_operations_small.dart';

class ManualOperationsPage extends StatelessWidget {
  const ManualOperationsPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /*Center(
          child: Container(
            height: 30,
            width: 200,
            color:  Colors.red,
            child: CustomText(
              text: title,
              align: TextAlign.center,
              size: 24,
              weight: FontWeight.bold,
              color: primary,
            ),
          ),
        ),*/
        Expanded(
            child: ListView(
          children: [
            if (ResponsiveWidget.isLargeScreen(context) ||
                ResponsiveWidget.isMediumScreen(context))
              if (ResponsiveWidget.isCustomSize(context))
                const ManualOperationsMedium()
              else
                const ManualOperationsLarge()
            else
              const ManualOperationsSmall(),
          ],
        ))
      ],
    );
  }
}
