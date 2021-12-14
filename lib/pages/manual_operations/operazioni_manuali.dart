import 'package:flutter/material.dart';
import 'package:interface_example1/helpers/responsivness.dart';
import 'package:interface_example1/pages/manual_operations/widget/operazioni_manuali_large.dart';
import 'package:interface_example1/pages/manual_operations/widget/operazioni_manuali_medium.dart';
import 'widget/operazioni_manuali_small.dart';

class OperazioniManualiPage extends StatelessWidget {
  const OperazioniManualiPage({Key? key}) : super(key: key);
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
                const OperazioniManualiMedium()
              else
                const OperazioniManualiLarge()
            else
              const OperazioniManualiSmall(),
          ],
        ))
      ],
    );
  }
}
