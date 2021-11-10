// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:interface_example1/helpers/local_navigator.dart';

class SmallScreen extends StatelessWidget {
  const SmallScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return localNavigator();
  }
}
