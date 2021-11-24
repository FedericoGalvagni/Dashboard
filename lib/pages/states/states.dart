import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interface_example1/constants/controllers.dart';
import 'package:interface_example1/constants/style.dart';
import 'package:interface_example1/helpers/responsivness.dart';
import 'package:interface_example1/pages/states/widgets/states_large.dart';
import 'package:interface_example1/pages/states/widgets/states_medium.dart';
import 'package:interface_example1/pages/states/widgets/states_small.dart';
import 'package:interface_example1/widgets/custom/custom_text.dart';

/// Classe [StatesPage] contiene gli elementi grafici della pagina di
/// visualizzazione dinamica delle tabelle.
/// In base alla dimensione del dispositivo
/// ritorna [StatesLarge], [StatesMedium], [StatesSmall]

class StatesPage extends StatelessWidget {
  const StatesPage({Key? key}) : super(key: key);
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
                      color: onBackground)),
            ],
          ),
        ),
        Expanded(
            child: ListView(
          children: [
            if (ResponsiveWidget.isLargeScreen(context) ||
                ResponsiveWidget.isMediumScreen(context))
              if (ResponsiveWidget.isCustomSize(context))
                StatesLarge()
              else
                StatesLarge()
            else
              StatesLarge(),
          ],
        ))
      ],
    );
  }
}
