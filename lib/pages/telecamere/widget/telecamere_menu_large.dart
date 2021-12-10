import 'package:flutter/material.dart';
import 'package:interface_example1/classes/models/global_variable.dart';
import 'package:interface_example1/pages/telecamere/widget/telecamere_immagine.dart';
import 'package:interface_example1/pages/telecamere/widget/telecamere_menu.dart';

class TelecamereLarge extends StatelessWidget {
  const TelecamereLarge({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ValueListenableBuilder(
            valueListenable: indiceTelecamere,
            builder: (context, value, child) {
              if (indiceTelecamere.value == -1) {
                return TelecamereMenu(
                  itemPerRow: 4,
                );
              } else {
                return const TelecamereImmagine();
              }
            }),
      ],
    );
  }
}
