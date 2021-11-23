import 'package:flutter/material.dart';
/// Uno spacer verticale di dimensioni: width dispositivo/128
class LargeVSpacer extends StatelessWidget {
  const LargeVSpacer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return SizedBox(height: _width/128,);
  }
}
