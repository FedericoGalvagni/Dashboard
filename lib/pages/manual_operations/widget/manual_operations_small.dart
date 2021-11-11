import 'package:flutter/material.dart';
import 'package:interface_example1/pages/manual_operations/widget/manual_operations_grid.dart';

class ManualOperationsSmall extends StatelessWidget {
  const ManualOperationsSmall({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ManualOperationIconsGrid(iconsPerRow: 2);
  }
}
