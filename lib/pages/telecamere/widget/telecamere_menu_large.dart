import 'package:flutter/material.dart';
import 'package:interface_example1/data_models/config.dart';
import 'package:interface_example1/pages/telecamere/widget/telecamere_galleria.dart';
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
                  itemPerRow: 6,
                );
              } else {
                return const TelecamereGalleria(
                    itemPerRow: 6);
              }
            }),
      ],
    );
  }
}
