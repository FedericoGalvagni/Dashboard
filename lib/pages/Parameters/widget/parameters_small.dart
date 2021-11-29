import 'package:flutter/material.dart';
import 'package:interface_example1/constants/style.dart';
import 'package:interface_example1/data_models/parameters_data.dart';
import 'package:interface_example1/pages/Parameters/widget/parameters_tree.dart';
import 'package:interface_example1/widgets/custom/custom_text.dart';
import 'package:interface_example1/widgets/spacer/small_horizontal_spacer.dart';
import 'package:interface_example1/widgets/spacer/small_vertical_spacer.dart';
import 'parameters_view.dart';

class ParametersSmall extends StatelessWidget {
  const ParametersSmall({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    ParametersTree parametersTree = ParametersTree(
      title: "",
      width: _width - (2 * (_width / 64)),
    );
    return Column(
      children: [
        const SmallVSpacer(),
        ValueListenableBuilder(
            valueListenable: selected,
            builder: (context, widget, value) {
              if (selected.value == "") {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SmallHSpacer(),
                    Container(
                        decoration: BoxDecoration(
                            color: surface(4),
                            borderRadius: BorderRadius.circular(10)),
                        child: parametersTree),
                    const SmallHSpacer(),
                  ],
                );
              } else {
                return Column(
                  children: [
                    Container(
                      height: 30,
                      margin: EdgeInsets.only(
                          left: _width / 64, right: _width / 64),
                      decoration: BoxDecoration(
                          color: primary,
                          border: Border.all(color: primary),
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: boxShadow),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          hoverColor: primary.withOpacity(0.1),
                          splashColor: primary,
                          highlightColor: primary.withOpacity(0.3),
                          onTap: () {
                            selected.value = "";
                          },
                          child: Center(
                            child:
                                CustomText(text: "Go Back", color: surface(4)),
                          ),
                        ),
                      ),
                    ),
                    const SmallVSpacer(),
                    Container(
                      margin: const EdgeInsets.only(left: 10, right: 10),
                      decoration: BoxDecoration(
                          color: surface(4),
                          borderRadius: BorderRadius.circular(10)),
                      child: ParametersView(
                          treeviewKey: selected.value,
                          width: _width - (2 * (_width / 64))),
                    )
                  ],
                );
              }
            }),
      ],
    );
  }
}
