import 'package:flutter/material.dart';
import 'package:interface_example1/helpers/responsivness.dart';
import 'package:interface_example1/pages/tabelle/widgets/tabelle_large.dart';

/// Classe [TabellePage] contiene gli elementi grafici della pagina di
/// visualizzazione dinamica delle tabelle.
/// In base alla dimensione del dispositivo
/// ritorna [TabelleLarge], [TabelleMedium], [TabelleSmall]

class TabellePage extends StatelessWidget {
  const TabellePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /*Obx(
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
        ),*/
        Expanded(
            child: ListView(
          children: [
            if (ResponsiveWidget.isLargeScreen(context) ||
                ResponsiveWidget.isMediumScreen(context))
              if (ResponsiveWidget.isCustomSize(context))
                TabelleLarge()
              else
                TabelleLarge()
            else
              TabelleLarge(),
          ],
        ))
      ],
    );
  }
}
