import 'package:flutter/material.dart';
import 'package:interface_example1/classes/data_models/global_variable.dart';
import 'package:interface_example1/classes/data_models/manual_operation_data.dart';
import 'package:interface_example1/constants/controllers.dart';
import 'package:interface_example1/constants/style.dart';
import 'package:interface_example1/routing/routes.dart';
import 'package:interface_example1/widgets/custom/custom_text.dart';

class MechanicalGroupIcon extends StatelessWidget {
  final int indiceGruppi;
  const MechanicalGroupIcon({Key? key, required this.indiceGruppi})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;

    return Expanded(
      child: AspectRatio(
        aspectRatio: 1,
        child: Container(
          decoration: BoxDecoration(
            color: surface(4),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Material(
            color: Colors.transparent,
            
            child: InkWell(
              hoverColor: hovered(surface(4), Colors.white),
              splashColor: pressed(surface(4), Colors.white),
              highlightColor: pressed(surface(4), Colors.white),
              borderRadius: BorderRadius.circular(10),
              onTap: () {
                //print(groupIndex);
                mechanicalGroupSelector = indiceGruppi;
                navigationController.navigateTo(manualOperationsPageRoute);
              },
              child: Center(
                child: Stack(
                  children: [
                    Center(
                      child: Container(
                        margin: const EdgeInsets.all(20),
                        child: Image.asset(
                            "assets/icons/" + indiceGruppi.toString() + ".png",
                            color: getEmphasis(onSurface, emphasis.medium)),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  margin: const EdgeInsets.only(
                                      left: 10, right: 10),
                                  height: 5,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(2),
                                    color: primary,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                height: _width / 256,
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomText(
                                text: gruppi[indiceGruppi].nome,
                                size: 13,
                                weight: FontWeight.w600,
                                color: getEmphasis(onSurface, emphasis.high),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                height: _width / 256,
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
