import 'package:flutter/material.dart';
import 'package:interface_example1/classes/http/http_service.dart';
import 'package:interface_example1/constants/style.dart';
import 'package:interface_example1/classes/models/global_variable.dart';
import 'package:interface_example1/classes/models/parameters_data.dart';
import 'package:interface_example1/pages/Parameters/widget/parameters_tree.dart';
import 'package:interface_example1/pages/Parameters/widget/parameters_view.dart';
import 'package:interface_example1/widgets/custom/custom_text.dart';
import 'package:interface_example1/widgets/spacer/large_horizontal_spacer.dart';
import 'package:interface_example1/widgets/spacer/large_vertical_spacer.dart';

class ParametersLarge extends StatelessWidget {
  const ParametersLarge({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    ParametersTree parametersTree = ParametersTree(
      title: "",
      width: (_width / 4),
    );

    return Column(
      children: [
        const LargeVSpacer(),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const LargeHSpacer(),
            Container(
              decoration: BoxDecoration(
                  color: surface(4), borderRadius: BorderRadius.circular(10)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const LargeVSpacer(),
                  Container(
                    margin: const EdgeInsets.only(left: 20),
                    child: CustomText(
                        text: "Explorer",
                        align: TextAlign.left,
                        weight: FontWeight.w600,
                        size: 20,
                        color: getEmphasis(onSurface, emphasis.high)),
                  ),
                  const LargeVSpacer(),
                  parametersTree,
                  const LargeVSpacer(),
                  Container(
                    margin: const EdgeInsets.only(left: 20),
                    child: CustomText(
                        align: TextAlign.left,
                        text: "Tool",
                        weight: FontWeight.w600,
                        size: 20,
                        color: getEmphasis(onSurface, emphasis.high)),
                  ),
                  const LargeVSpacer(),
                  SizedBox(
                    width: (_width / 4),
                    child: Row(
                      children: [
                        const LargeHSpacer(),
                        Expanded(
                          child: Container(
                            height: 1,
                            color: divider,
                          ),
                        ),
                        const LargeHSpacer(),
                        const LargeHSpacer(),
                      ],
                    ),
                  ),
                  const LargeVSpacer(),
                  Row(
                    children: [
                      const LargeHSpacer(),
                      ValueListenableBuilder(
                          valueListenable: selected,
                          builder: (context, widget, value) {
                            return ValueListenableBuilder(
                                valueListenable: changed,
                                builder: (context, widget, value) {
                                  itCanBeRestored();
                                  return TextButton.icon(
                                      style: ButtonStyle(
                                          splashFactory:
                                              InkSplash.splashFactory,
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  (SurfaceContainer()
                                                      .container)),
                                          overlayColor:
                                              MaterialStateProperty.all(
                                                  SurfaceContainer().hovered()),
                                          foregroundColor:
                                              MaterialStateProperty.all(
                                                  SurfaceContainer()
                                                      .container)),
                                      label: CustomText(
                                        text: "Restore",
                                        size: 15,
                                        weight: FontWeight.w300,
                                        color: getEmphasis(
                                            onSurface, emphasis.high),
                                      ),
                                      onPressed: () {
                                        debugPrint(indiceGruppi.toString());
                                        restore();
                                      },
                                      icon: Icon(
                                        Icons.restore,
                                        color: canBeRestored.value
                                            ? warning
                                            : valid,
                                      ));
                                });
                          }),
                      const LargeHSpacer(),
                      const LargeHSpacer(),
                    ],
                  ),
                  const LargeVSpacer(),
                ],
              ),
            ),
            const LargeHSpacer(),
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

  restore() {
    debugPrint("Restore started");
    debugPrint(indiceGruppi.toString() + indiceAttuatori.toString());
    if (indiceGruppi == -1 || indiceAttuatori == -1) {
      return;
    }
    for (var i = 0;
        i <
            parametriOriginali[indiceGruppi]
                .attuatori[indiceAttuatori]
                .parametri
                .length;
        i++) {
      if (parametri.value[indiceGruppi].attuatori[indiceAttuatori].parametri[i]
              .valore !=
          parametriOriginali[indiceGruppi]
              .attuatori[indiceAttuatori]
              .parametri[i]
              .valore) {
        parametri.value[indiceGruppi].attuatori[indiceAttuatori].parametri[i]
                .valore =
            parametriOriginali[indiceGruppi]
                .attuatori[indiceAttuatori]
                .parametri[i]
                .valore;
        HttpService(id: "modifica_parametro",percorso: "/parametri", parametriHeaders: {
          "indicegruppi": indiceGruppi,
          "indicemotori": indiceAttuatori,
          "indiceparametri": i,
          "nuovovalore": double.parse(parametriOriginali[indiceGruppi]
              .attuatori[indiceAttuatori]
              .parametri[i]
              .valore),
        }).post();
      }
    }
  }

  itCanBeRestored() {
    debugPrint("check if it can be restored");
    if (indiceGruppi == -1 || indiceAttuatori == -1) {
      canBeRestored.value = false;
    } else {
      List<Parametri> parametriUI =
          parametri.value[indiceGruppi].attuatori[indiceAttuatori].parametri;
      List<Parametri> parametriOrigin =
          parametriOriginali[indiceGruppi].attuatori[indiceAttuatori].parametri;
      canBeRestored.value = false;
      for (var i = 0; i < parametriUI.length; i++) {
        if (parametriOrigin[i].valore != parametriUI[i].valore) {
          canBeRestored.value = true;
        } else {}
      }
    }
  }
}
