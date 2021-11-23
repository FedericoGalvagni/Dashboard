import 'package:flutter/material.dart';
/// Uno spacer verticale di dimensioni: width dispositivo/64
class MediumVSpacer extends StatelessWidget {
  const MediumVSpacer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return SizedBox(height: _width/64,);
  }
}
