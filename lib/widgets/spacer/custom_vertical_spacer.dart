import 'package:flutter/material.dart';

/// Uno spacer orizzontale di dimensioni custom
// ignore: must_be_immutable
class CustomVspacer extends StatelessWidget {
  /// Fattore di divisione della larghezza del dispositivo di cui il risultato è
  /// l'altezza dello spacer
  int factor;
  CustomVspacer({required this.factor, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return SizedBox(
      height: _width / factor,
    );
  }
}
