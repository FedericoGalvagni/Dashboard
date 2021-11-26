import 'package:flutter/material.dart';
import 'package:interface_example1/constants/style.dart';
import 'package:interface_example1/data_models/parameters_data.dart';
import 'package:interface_example1/pages/Parameters/widget/parameters_tree.dart';
import 'package:interface_example1/pages/Parameters/widget/parameters_view.dart';
import 'package:interface_example1/widgets/spacer/large_horizontal_spacer.dart';

class ParametersLarge extends StatelessWidget {
  const ParametersLarge({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ParametersTree parametersTree = ParametersTree(title: "");

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start  ,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const LargeHSpacer(),
        parametersTree,
        const LargeHSpacer(),
        ValueListenableBuilder(
            valueListenable: selected,
            builder: (context, widget, value) {
              return Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      color: surface(4),
                      borderRadius: BorderRadius.circular(10)),
                  child: Container(
                      margin: const EdgeInsets.only(left: 10, right: 10),
                      decoration: BoxDecoration(
                          color: surface(4),
                          borderRadius: BorderRadius.circular(10)),
                      child: ParametersView(treeviewKey: selected.value)),
                ),
              );
            }),
        const LargeHSpacer(),
      ],
    );
  }
}
