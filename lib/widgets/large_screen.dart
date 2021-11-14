import 'package:flutter/material.dart';
import 'package:interface_example1/helpers/local_navigator.dart';

import 'side_menu.dart';

class LargeScreen extends StatelessWidget {
  const LargeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: SideMenu()),
        Expanded(
          flex: 5,
          child: localNavigator()
        ),
      ],
    );
  }
}
