import 'package:flutter/material.dart';
import 'package:interface_example1/pages/manual_operations/widget/manual_operations_grid.dart';

class ManualOperationsLarge extends StatelessWidget {
  const ManualOperationsLarge({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ManualOperationIconsGrid(
      iconsPerRow: 6,
      aControllPerRow: 3,
    );
  }
}
