import 'package:flutter/material.dart';
import 'package:interface_example1/constants/style.dart';
import 'package:interface_example1/data_models/parameters_data.dart';
import 'package:interface_example1/pages/Parameters/widget/parameters_tree.dart';
import 'package:interface_example1/widgets/custom/custom_text.dart';
import 'package:interface_example1/widgets/spacer/medium_horizontal_spacer.dart';
import 'package:interface_example1/widgets/spacer/medium_vertical_spacer.dart';

import 'parameters_view.dart';

class ParametersMedium extends StatelessWidget {
  const ParametersMedium({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    ParametersTree parametersTree = ParametersTree(
      title: "",
      width: (_width / 4),
    );
    return Column(
      children: [
        const MediumVSpacer(),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const MediumHSpacer(),
            Container(
              decoration: BoxDecoration(
                  color: surface(4), borderRadius: BorderRadius.circular(10)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const MediumVSpacer(),
                  Container(
                    margin: const EdgeInsets.only(left: 20),
                    child: CustomText(
                        text: "Explorer",
                        align: TextAlign.left,
                        weight: FontWeight.w600,
                        size: 20,
                        color: getEmphasis(onSurface, emphasis.high)),
                  ),
                  const MediumVSpacer(),
                  parametersTree,
                  const MediumVSpacer(),
                  Container(
                    margin: const EdgeInsets.only(left: 20),
                    child: CustomText(
                        align: TextAlign.left,
                        text: "Tool",
                        weight: FontWeight.w600,
                        size: 20,
                        color: getEmphasis(onSurface, emphasis.high)),
                  ),
                  Container(),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      //margin: EdgeInsets.only(left: 20),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.restore,
                            color: Colors.green,
                          ),
                          Container(
                            width: 5,
                          ),
                          //TODO: implement restore function
                          CustomText(
                            text: "Restore",
                            size: 15,
                            color: getEmphasis(onSurface, emphasis.high),
                            weight: FontWeight.normal,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const MediumHSpacer(),
            ValueListenableBuilder(
                valueListenable: selected,
                builder: (context, widget, value) {
                  return Container(
                      decoration: BoxDecoration(
                          color: surface(4),
                          borderRadius: BorderRadius.circular(10)),
                      child: ParametersView(
                          treeviewKey: selected.value,
                          width: _width -
                              (3 * (_width / 128) //spacer
                              ) -
                              (_width / 6) -
                              _width / 4));
                }),
          ],
        ),
      ],
    );
  }
}
