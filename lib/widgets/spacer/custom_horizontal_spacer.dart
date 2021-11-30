import 'package:flutter/material.dart';

/// Uno spacer orizzontale di dimensioni custom
// ignore: must_be_immutable
class CustomHspacer extends StatelessWidget {
  /// Fattore di divisione della larghezza del dispositivo di cui il risultato è
  /// la larghezza dello spacer
  int factor;
  CustomHspacer({required this.factor, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return SizedBox(
      width: _width / factor,
    );
  }
}
