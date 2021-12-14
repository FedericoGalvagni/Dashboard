import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:interface_example1/classes/http/http_service.dart';
import 'package:interface_example1/classes/modelli/operazioni_manuali_modello.dart';
import 'package:interface_example1/classes/modelli/parametri_modello.dart';
import 'package:interface_example1/constants/style.dart';
import 'package:interface_example1/classes/modelli/variabili_globali.dart';
import 'package:interface_example1/controllers/navigation_controller.dart';
import 'package:interface_example1/helpers/local_navigator.dart';
import 'package:interface_example1/pages/parametri/widget/parametri_tree.dart';
import 'package:interface_example1/pages/parametri/widget/parametri_view.dart';
import 'package:interface_example1/routing/routes.dart';
import 'package:interface_example1/widgets/custom/custom_container.dart';
import 'package:interface_example1/widgets/custom/custom_dropdownmenu.dart';
import 'package:interface_example1/widgets/custom/custom_text.dart';
import 'package:interface_example1/widgets/menu_controller.dart';
import 'package:interface_example1/widgets/spacer/auto_horizontal_spacer.dart';
import 'package:interface_example1/widgets/spacer/auto_vertical_spacer.dart';
import 'package:interface_example1/widgets/spacer/large_horizontal_spacer.dart';
import 'package:interface_example1/widgets/spacer/large_vertical_spacer.dart';

class ParametriLarge extends StatefulWidget {
  const ParametriLarge({Key? key}) : super(key: key);

  @override
  State<ParametriLarge> createState() => _ParametriLargeState();
}

class _ParametriLargeState extends State<ParametriLarge> {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;

    debugPrint("gruppi: " +
        indiceGruppi.toString() +
        "attuatori: " +
        indiceAttuatori.toString());
    debugPrint("Numero di gruppi: " + parametri.value.length.toString());
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
                  ValueListenableBuilder(
                      valueListenable: updateParameterTree,
                      builder: (context, widget, value) {
                        return ParametriTree(
                          width: _width / 4,
                          title: "",
                        );
                      }),
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
                          valueListenable: selezionato,
                          builder: (context, widget, value) {
                            return ValueListenableBuilder(
                                valueListenable: changed,
                                builder: (context, widget, value) {
                                  itCanBeRestored();
                                  return Row(
                                    children: [
                                      const LargeHSpacer(),
                                      CustomInkWell(
                                        style: ContainerStyle.primary,
                                        onTap: () {
                                          debugPrint(indiceGruppi.toString());
                                          restore();
                                        },
                                        radius: 3,
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.restore,
                                              color: canBeRestored.value
                                                  ? warning
                                                  : valid,
                                            ),
                                            const LargeHSpacer(),
                                            CustomText(
                                              text: "Valori iniziali",
                                              size: 18,
                                              weight: FontWeight.w600,
                                              color: getEmphasis(
                                                  onPrimary, emphasis.high),
                                            ),
                                            const LargeHSpacer(),
                                          ],
                                        ),
                                      ),
                                      const LargeHSpacer(),
                                      const LargeHSpacer(),
                                    ],
                                  );
                                });
                          }),
                      const LargeHSpacer(),
                      const LargeHSpacer(),
                    ],
                  ),
                  const LargeVSpacer(),
                  Row(
                    children: [
                      const LargeHSpacer(),
                      CustomInkWell(
                        style: ContainerStyle.primary,
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return _inputGruppo(context);
                              });
                          setState(() {});
                        },
                        radius: 3,
                        child: Row(
                          children: [
                            Icon(Icons.add_box_outlined),
                            const LargeHSpacer(),
                            CustomText(
                              text: "Aggiungi gruppo",
                              size: 18,
                              weight: FontWeight.w600,
                              color: getEmphasis(onPrimary, emphasis.high),
                            ),
                            const LargeHSpacer(),
                          ],
                        ),
                      ),
                      const LargeHSpacer(),
                      const LargeHSpacer(),
                    ],
                  ),
                  const LargeVSpacer(),
                  Row(
                    children: [
                      const LargeHSpacer(),
                      CustomInkWell(
                        style: ContainerStyle.primary,
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return _inputAttuatore(context);
                              });
                        },
                        radius: 3,
                        child: Row(
                          children: [
                            Icon(Icons.add_box_outlined),
                            const LargeHSpacer(),
                            CustomText(
                              text: "Aggiungi attuatore",
                              size: 18,
                              weight: FontWeight.w600,
                              color: getEmphasis(onPrimary, emphasis.high),
                            ),
                            const LargeHSpacer(),
                          ],
                        ),
                      ),
                      const LargeHSpacer(),
                      const LargeHSpacer(),
                    ],
                  ),
                ],
              ),
            ),
            const LargeVSpacer(),
            const LargeVSpacer(),
            ValueListenableBuilder(
                valueListenable: selezionato,
                builder: (context, widget, value) {
                  return Row(
                    children: [
                      const LargeHSpacer(),
                      Container(
                          decoration: BoxDecoration(
                              color: surface(4),
                              borderRadius: BorderRadius.circular(10)),
                          child: ParametriView(
                              treeviewKey: selezionato.value,
                              width: _width -
                                  (3 * (_width / 128) //spacer
                                  ) -
                                  (_width / 6) -
                                  _width / 4)),
                    ],
                  );
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
        HttpService(
            id: "modifica_parametro",
            percorso: "/parametri",
            parametriHeaders: {
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
    } else if (parametri.value[indiceGruppi].attuatori.isNotEmpty) {
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

  _aggiungiGruppo(String nomeGruppo) {
    parametri.value.add(ParametriAttuatori(gruppo: nomeGruppo, attuatori: []));
    parametriOriginali
        .add(ParametriAttuatori(gruppo: nomeGruppo, attuatori: []));
    parametriDatabase.value
        .add(ParametriAttuatori(gruppo: nomeGruppo, attuatori: []));
    HttpService(
            id: "ModificaFileParametri",
            percorso: "/editparametri",
            parametriHeaders: {"nuovi_parametri": jsonEncode(parametri.value)})
        .post();
    debugPrint(parametri.value.length.toString());
  }

  Widget _inputGruppo(BuildContext context) {
    TextEditingController _nomeGruppo = TextEditingController();

    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
          width: 500,
          height: 180,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: surface(4),
          ),
          padding: const EdgeInsets.all(20.0),
          child: Column(children: <Widget>[
            CustomText(
              color: getEmphasis(onSurface, emphasis.medium),
              text: "Scegli il nome per il nuovo gruppo",
              size: 13,
              weight: FontWeight.w400,
            ),
            const Divider(),
            TextField(
                textAlign: TextAlign.left,
                controller: _nomeGruppo,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(
                      // ignore: todo
                      // TODO: filtro textfield solo decimal

                      RegExp(r'^[A-Za-z0-9 _-]*$')),
                ],
                style: TextStyle(
                    color: getEmphasis(
                  onSurface,
                  emphasis.high,
                )),
                decoration: InputDecoration(
                  labelText: "Nome",
                  labelStyle: loginFailed.value
                      ? TextStyle(color: error)
                      : TextStyle(color: primary),
                  enabledBorder: loginFailed.value
                      ? OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                          borderSide: BorderSide(
                              color: getEmphasis(error, emphasis.medium),
                              width: 1))
                      : OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                          borderSide: BorderSide(
                              color: getEmphasis(onSurface, emphasis.medium),
                              width: 1)),
                  focusedBorder: loginFailed.value
                      ? OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                          borderSide: BorderSide(color: error, width: 2))
                      : OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                          borderSide: BorderSide(color: primary, width: 2)),
                  border: OutlineInputBorder(
                      borderSide: loginFailed.value
                          ? BorderSide(color: error)
                          : BorderSide(color: primary)),
                )),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                TextButton(
                  child: CustomText(
                    color: primary,
                    text: "Annulla",
                    size: 13,
                    weight: FontWeight.w400,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                const SizedBox(width: 8),
                TextButton(
                  child: CustomText(
                    color: primary,
                    text: "Ok",
                    size: 13,
                    weight: FontWeight.w400,
                  ),
                  onPressed: () {
                    _aggiungiGruppo(_nomeGruppo.text);
                    costruzioneGruppi(parametri.value);
                    Navigator.of(context).pop();
                    setState(() {});
                    updateParameterTree.value = !updateParameterTree.value;
                  },
                ),
                const SizedBox(width: 8),
              ],
            ),
          ])),
    );
  }

  _inputAttuatore(BuildContext context) {
    TextEditingController _nomeAttuatore = TextEditingController();
    String tipo = "motore";
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
          width: 500,
          height: 360,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: surface(4),
          ),
          padding: const EdgeInsets.all(20.0),
          child: Column(children: <Widget>[
            CustomText(
              color: getEmphasis(onSurface, emphasis.medium),
              text: "Scegli il nome per il nuovo gruppo",
              size: 13,
              weight: FontWeight.w400,
            ),
            const Divider(),
            TextField(
                textAlign: TextAlign.left,
                controller: _nomeAttuatore,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(
                      // ignore: todo
                      // TODO: filtro textfield solo decimal

                      RegExp(r'^[A-Za-z0-9 _-]*$')),
                ],
                style: TextStyle(
                    color: getEmphasis(
                  onSurface,
                  emphasis.high,
                )),
                decoration: InputDecoration(
                  labelText: "Nome",
                  labelStyle: loginFailed.value
                      ? TextStyle(color: error)
                      : TextStyle(color: primary),
                  enabledBorder: loginFailed.value
                      ? OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                          borderSide: BorderSide(
                              color: getEmphasis(error, emphasis.medium),
                              width: 1))
                      : OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                          borderSide: BorderSide(
                              color: getEmphasis(onSurface, emphasis.medium),
                              width: 1)),
                  focusedBorder: loginFailed.value
                      ? OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                          borderSide: BorderSide(color: error, width: 2))
                      : OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                          borderSide: BorderSide(color: primary, width: 2)),
                  border: OutlineInputBorder(
                      borderSide: loginFailed.value
                          ? BorderSide(color: error)
                          : BorderSide(color: primary)),
                )),
            AutoVerticalSpacer(),
            CustomDDMenu(
                dropdownValue: tipo,
                items: ["motore", "pistone"],
                selectedValue: (str) {
                  tipo = str;
                }),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                TextButton(
                  child: CustomText(
                    color: primary,
                    text: "Annulla",
                    size: 13,
                    weight: FontWeight.w400,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                const SizedBox(width: 8),
                TextButton(
                  child: CustomText(
                    color: primary,
                    text: "Ok",
                    size: 13,
                    weight: FontWeight.w400,
                  ),
                  onPressed: () {
                    _aggiungiAttuatore(tipo, _nomeAttuatore.text);
                    costruzioneGruppi(parametri.value);
                    Navigator.of(context).pop();
                    setState(() {});
                    updateParameterTree.value = !updateParameterTree.value;
                  },
                ),
                const SizedBox(width: 8),
              ],
            ),
          ])),
    );
  }

  _aggiungiAttuatore(String tipo, String nomeAttuatore) {
    var splittedSel = expandedNode.split(".");
    int iGruppi = int.parse(splittedSel[1]);

    debugPrint("Aggiunto nodo al gruppo: " + iGruppi.toString());
    parametri.value[iGruppi].attuatori.add(Attuatori(
        nome: nomeAttuatore, parametri: parametriDefault(tipo), tipo: tipo));
    parametriOriginali[iGruppi].attuatori.add(Attuatori(
        nome: nomeAttuatore, parametri: parametriDefault(tipo), tipo: tipo));
    parametriDatabase.value[iGruppi].attuatori.add(Attuatori(
        nome: nomeAttuatore, parametri: parametriDefault(tipo), tipo: tipo));
    debugPrint(jsonEncode(parametri.value));
    HttpService(
            id: "ModificaFileParametri",
            percorso: "/editparametri",
            parametriHeaders: {"nuovi_parametri": jsonEncode(parametri.value)})
        .post();
  }

  List<Parametri> parametriDefault(String tipo) {
    List<Parametri> parametriDefault = [];
    switch (tipo) {
      case "motore":
        parametriDefault
            .add(Parametri(nomeParametro: "Limite Postivo", valore: "0"));
        parametriDefault
            .add(Parametri(nomeParametro: "Limite Negativo", valore: "0"));
        parametriDefault.add(Parametri(nomeParametro: "", valore: ""));
        parametriDefault
            .add(Parametri(nomeParametro: "Posizione per homing", valore: "0"));
        parametriDefault.add(Parametri(
            nomeParametro: "Posizione di attesa in ciclo", valore: "0"));
        parametriDefault
            .add(Parametri(nomeParametro: "Vel Rapido", valore: "0"));
        parametriDefault
            .add(Parametri(nomeParametro: "Vel Lento", valore: "0"));
        parametriDefault
            .add(Parametri(nomeParametro: "Vel Homing", valore: "0"));
        parametriDefault.add(Parametri(nomeParametro: "", valore: ""));
        parametriDefault
            .add(Parametri(nomeParametro: "Decelerazione Stop", valore: "0"));
        parametriDefault
            .add(Parametri(nomeParametro: "Accelerazione Rapido", valore: "0"));
        parametriDefault
            .add(Parametri(nomeParametro: "Accelerazione Lento", valore: "0"));
        parametriDefault
            .add(Parametri(nomeParametro: "Decelerazione Rapido", valore: "0"));
        parametriDefault
            .add(Parametri(nomeParametro: "Decelerazione Lento", valore: "0"));
        parametriDefault
            .add(Parametri(nomeParametro: "Jerk Rapido", valore: "0"));
        parametriDefault
            .add(Parametri(nomeParametro: "Jerk Lento", valore: "0"));
        parametriDefault.add(Parametri(nomeParametro: "", valore: ""));
        parametriDefault.add(Parametri(nomeParametro: "", valore: ""));
        parametriDefault.add(Parametri(nomeParametro: "Vel JOG", valore: ""));
        parametriDefault.add(Parametri(nomeParametro: "Acc JOG", valore: ""));
        parametriDefault.add(Parametri(nomeParametro: "Dec JOG", valore: ""));
        parametriDefault.add(Parametri(nomeParametro: "", valore: ""));
        parametriDefault.add(
            Parametri(nomeParametro: "Limite Coppia Positivo", valore: ""));
        parametriDefault.add(Parametri(nomeParametro: "", valore: ""));
        parametriDefault.add(Parametri(nomeParametro: "", valore: ""));
        parametriDefault
            .add(Parametri(nomeParametro: "Zero Offset/ RefPos", valore: ""));
        parametriDefault.add(
            Parametri(nomeParametro: "Ritorno da Zero/RefMove", valore: ""));
        parametriDefault.add(
            Parametri(nomeParametro: "Accelerazione Ricerca Zero", valore: ""));
        parametriDefault
            .add(Parametri(nomeParametro: "Velocita Ricerca Zero", valore: ""));
        parametriDefault.add(
            Parametri(nomeParametro: "Velocita Ricerca Tacca", valore: ""));
        parametriDefault.add(
            Parametri(nomeParametro: "Limite Coppia Ricerca Zero", valore: ""));
        parametriDefault.add(Parametri(nomeParametro: "", valore: ""));
        return parametriDefault;
      case "pistone":
        parametriDefault
            .add(Parametri(nomeParametro: "iTipoAttuatore", valore: ""));
        parametriDefault
            .add(Parametri(nomeParametro: "Opzione sensore 1", valore: ""));
        parametriDefault.add(Parametri(nomeParametro: "iOpt_S1", valore: ""));
        parametriDefault.add(Parametri(nomeParametro: "iOpt_S2", valore: ""));
        parametriDefault.add(Parametri(nomeParametro: "iRit_S1", valore: ""));
        parametriDefault.add(Parametri(nomeParametro: "iRit_S2", valore: ""));
        parametriDefault
            .add(Parametri(nomeParametro: "iTimeout_S1", valore: ""));
        parametriDefault
            .add(Parametri(nomeParametro: "iTimeout_S2", valore: ""));
        parametriDefault
            .add(Parametri(nomeParametro: "iTempoSimulazioneS1", valore: ""));
        parametriDefault
            .add(Parametri(nomeParametro: "iTempoSimulazioneS2", valore: ""));
        return parametriDefault;
      default:
        return parametriDefault;
    }
  }
}
