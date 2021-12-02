import 'package:flutter/material.dart';
import 'package:interface_example1/constants/spacer.dart';

/// Uno spacer verticale di dimensioni: width dispositivo/64
class SmallVSpacer extends StatelessWidget {
  const SmallVSpacer({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return SizedBox(
      height: _width / SpacerC.smallRateo,
    );
  }

}
