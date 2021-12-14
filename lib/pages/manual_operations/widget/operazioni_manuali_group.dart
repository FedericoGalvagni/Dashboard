import 'package:flutter/material.dart';
import 'package:interface_example1/classes/modelli/variabili_globali.dart';
import 'package:interface_example1/classes/modelli/operazioni_manuali_modello.dart';
import 'package:interface_example1/constants/controllers.dart';
import 'package:interface_example1/constants/style.dart';
import 'package:interface_example1/pages/manual_operations/widget/operazioni_manuali_card.dart';
import 'package:interface_example1/routing/routes.dart';
import 'package:interface_example1/widgets/custom/custom_text.dart';

class OperazioniManualiGroup extends StatefulWidget {
  final int iGruppi;
  final int attuatoriPerRiga;
  const OperazioniManualiGroup(
      {Key? key, required this.iGruppi, required this.attuatoriPerRiga})
      : super(key: key);

  @override
  State<OperazioniManualiGroup> createState() => _OperazioniManualiGroupState();
}

class _OperazioniManualiGroupState extends State<OperazioniManualiGroup> {
  @override
  Widget build(BuildContext context) {
    //print("length: " + mechanicalGroup.groups.length.toString());
    int iGruppi = widget.iGruppi;
    return ValueListenableBuilder(
        valueListenable: manualeChanged,
        builder: (context, widget, value) {
          return Column(children: buildRow(gruppi[iGruppi].attuatori));
        });
  }

  List<Widget> buildRow(List<Attuatore> attuatori) {
    double _width = MediaQuery.of(context).size.width;
    List<Widget> row = [];
    int l = attuatori.length;
    int nElementi = widget.attuatoriPerRiga;

    for (int i = 0; i < l; i = i + nElementi) {
      if (i == 0) {
        row.add(SizedBox(
          height: _width / 64,
        ));
        row.add(
          Container(
            height: 30,
            margin: EdgeInsets.only(left: _width / 64, right: _width / 64),
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
                  mechanicalGroupSelector = -1;
                  navigationController.navigateTo(operazioniManualiPageRoute);
                },
                child: Center(
                  child: CustomText(text: "Go Back", color: surface(4)),
                ),
              ),
            ),
          ),
        );
      }
      row.add(SizedBox(
        height: _width / 64,
      ));
      row.add(Row(
        children: buildRowElement(i, attuatori),
      ));
      // add spacer
    }
    return row;
  }

  List<Widget> buildRowElement(int index, List<Attuatore> attuatori) {
    double _width = MediaQuery.of(context).size.width;
    List<Widget> element = [];
    int ii;
    int nElementi = widget.attuatoriPerRiga;
    for (ii = 0; ii < nElementi; ii++) {
      if (index + ii >= attuatori.length) {
        element.add(Container(
          width: _width / 64,
        ));
        element.add(Expanded(child: Container(color: primary)));
      } else {
        element.add(SizedBox(
          width: _width / 64,
          height: _width / 128,
        ));
        Attuatore attuatore = attuatori[index + ii];
        element.add(OperazioniManualiCard(
          iGruppi: widget.iGruppi,
          iAttuatori: index + ii,
          attivo: attuatore.manualeAttivo,
          nome: attuatore.nome,
          limiteNegativo: attuatore.limiteNegativo,
          limitePositivo: attuatore.limitePositivo,
          id: attuatore.id,
          value: attuatore.valore,
          tipo: attuatore.tipo,
          onTap: () {
            attuatore.manualeAttivo = true;
            disattivazioneComandiManuali(widget.iGruppi, index + ii);
          },
          size: 300,
        ));
      }
    }
    element.add(SizedBox(
      width: _width / 64,
      height: _width / 128,
    ));
    return element;
  }
}
