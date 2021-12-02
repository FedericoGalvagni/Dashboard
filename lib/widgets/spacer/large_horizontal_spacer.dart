import 'package:flutter/material.dart';
import 'package:interface_example1/constants/spacer.dart';
/// Uno spacer orizzontale di dimensioni: width dispositivo/128
class LargeHSpacer extends StatelessWidget {
  const LargeHSpacer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return SizedBox(width: _width/SpacerC.largeRateo ,);
  }
}
