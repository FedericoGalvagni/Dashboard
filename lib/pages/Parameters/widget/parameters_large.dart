import 'package:flutter/material.dart';
import 'package:interface_example1/data_models/config.dart';
import 'package:interface_example1/pages/Parameters/widget/parameters_tree.dart';
import 'package:interface_example1/pages/Parameters/widget/parameters_view.dart';

class ParametersLarge extends StatelessWidget {
  const ParametersLarge({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;

    return Row(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
            width: _width / 4,
            //color: Colors.green,
            child: const ParametersTree(title: "title")),
        Expanded(
          child: ValueListenableBuilder(
              valueListenable: treeviewKey,
              builder: (context, value, widget) {
                return const ParametersView();
              }),
        )
      ],
    );
  }
}
