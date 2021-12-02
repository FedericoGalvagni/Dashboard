import 'package:flutter/material.dart';
import 'package:interface_example1/constants/spacer.dart';
/// Uno spacer verticale di dimensioni: width dispositivo/128
class LargeVSpacer extends StatelessWidget {
  const LargeVSpacer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return SizedBox(height: _width/SpacerC.largeRateo,);
  }
}
