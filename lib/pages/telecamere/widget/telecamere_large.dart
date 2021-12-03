import 'package:flutter/material.dart';
import 'package:interface_example1/data_models/config.dart';

class TelecamereLarge extends StatelessWidget {
  const TelecamereLarge({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return ValueListenableBuilder(
      valueListenable: image,
      builder: (context, widget, value) {
        return Container(
          color: Colors.red,
          width: 500,
          height: 500,
          child:  image.value
        );
      }
    );
  }
}