import 'package:flutter/material.dart';
import 'package:interface_example1/pages/manual_operations/widget/operazioni_manuali_grid.dart';

class OperazioniManualiSmall extends StatelessWidget {
  const OperazioniManualiSmall({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const OperazioniManualiIconsGrid(
      iconsPerRow: 3,
      aControllPerRow: 2,
    );
  }
}
