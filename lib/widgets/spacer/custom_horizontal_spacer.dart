import 'package:flutter/material.dart';

/// Uno spacer orizzontale di dimensioni custom
class customHspacer extends StatelessWidget {
  /// Fattore di divisione della larghezza del dispositivo di cui il risultato è
  /// la larghezza dello spacer
  int factor;
  customHspacer({required this.factor, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return SizedBox(
      width: _width / factor,
    );
  }
}
