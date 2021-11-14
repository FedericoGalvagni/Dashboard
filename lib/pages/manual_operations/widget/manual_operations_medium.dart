import 'package:flutter/material.dart';
import 'package:interface_example1/pages/manual_operations/widget/manual_operations_grid.dart';

class ManualOperationsMedium extends StatelessWidget {
  const ManualOperationsMedium({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ManualOperationIconsGrid(
      iconsPerRow: 4,aControllPerRow: 2,
    );
  }
}
