import 'package:flutter/material.dart';
import 'package:interface_example1/classes/modelli/variabili_globali.dart';
import 'package:interface_example1/pages/telecamere/widget/telecamere_immagine.dart';
import 'package:interface_example1/pages/telecamere/widget/telecamere_menu.dart';

class TelecamereMedium extends StatelessWidget {
  const TelecamereMedium({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ValueListenableBuilder(
            valueListenable: indiceTelecamere,
            builder: (context, value, child) {
              if (indiceTelecamere.value == -1) {
                return TelecamereMenu(
                  itemPerRow: 3,
                );
              } else {
                return const TelecamereImmagine();
              }
            }),
      ],
    );
  }
}
