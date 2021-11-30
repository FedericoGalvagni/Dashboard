import 'package:flutter/material.dart';
import 'package:interface_example1/constants/controllers.dart';
import 'package:interface_example1/constants/style.dart';
import 'package:interface_example1/data_models/config.dart';
import 'package:interface_example1/data_models/manual_operation_data.dart';
import 'package:interface_example1/pages/manual_operations/widget/manual_operation_card.dart';
import 'package:interface_example1/routing/routes.dart';
import 'package:interface_example1/widgets/custom/custom_text.dart';

class ManualOperationsGroup extends StatefulWidget {
  final int iGruppi;
  final int attuatoriPerRiga;
  const ManualOperationsGroup(
      {Key? key, required this.iGruppi, required this.attuatoriPerRiga})
      : super(key: key);

  @override
  State<ManualOperationsGroup> createState() => _ManualOperationsGroupState();
}

class _ManualOperationsGroupState extends State<ManualOperationsGroup> {
  @override
  Widget build(BuildContext context) {
    //print("length: " + mechanicalGroup.groups.length.toString());

    return Column(children: buildRow(gruppi[widget.iGruppi].attuatori));
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
                  navigationController.navigateTo(manualOperationsPageRoute);
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
        element.add(ManualOperationCard(
            iGruppi: widget.iGruppi,
            iAttuatori: index + ii,
            attivo: attuatore.manualeAttivo.value,
            nome: attuatore.nome,
            limiteNegativo: attuatore.limiteNegativo,
            limitePositivo: attuatore.limitePositivo,
            id: attuatore.id,
            value: attuatore.valore,
            type: attuatore.tipo,
            onTap: () {
              attuatore.manualeAttivo.value = true;
              disattivazioneComandiManuali(
                      widget.iGruppi, index + ii);
            }));
      }
    }
    element.add(SizedBox(
      width: _width / 64,
      height: _width / 128,
    ));
    return element;
  }
}
