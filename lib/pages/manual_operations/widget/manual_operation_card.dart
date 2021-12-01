import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:interface_example1/classes/http/http_service.dart';
import 'package:interface_example1/constants/style.dart';
import 'package:interface_example1/data_models/config.dart';
import 'package:interface_example1/data_models/manual_operation_data.dart';
import 'package:interface_example1/widgets/custom/static_button.dart';

// ignore: must_be_immutable
class ManualOperationCard extends StatefulWidget {
  final String nome;
  final String id;
  final String value;
  final String limitePositivo;
  final String limiteNegativo;
  final Color? backgroundColor;
  final int iAttuatori;
  final int iGruppi;
  bool attivo;
  final String type;
  final VoidCallback onTap;

  ManualOperationCard({
    Key? key,
    required this.nome,
    required this.iAttuatori,
    required this.iGruppi,
    required this.limiteNegativo,
    required this.limitePositivo,
    required this.id,
    this.backgroundColor,
    required this.value,
    required this.attivo,
    required this.type,
    required this.onTap,
  }) : super(key: key);

  @override
  State<ManualOperationCard> createState() => _ManualOperationCardState();
}

class _ManualOperationCardState extends State<ManualOperationCard> {
  @override
  Widget build(BuildContext context) {
    String text = "min ${widget.limiteNegativo} max ${widget.limitePositivo}";
    double _width = MediaQuery.of(context).size.width;
    return Expanded(
        child: Container(
      height: 100,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: surface(4),
          boxShadow: boxShadow),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: const EdgeInsets.only(left: 10),
            child: Column(children: [
              Expanded(child: Container()),
              RichText(
                  textAlign: TextAlign.left,
                  text: TextSpan(children: [
                    TextSpan(
                        text: "${widget.nome}\n",
                        style: TextStyle(
                            fontSize: 40,
                            color: getEmphasis(onSurface, emphasis.high))),
                    TextSpan(
                        text: text,
                        style: TextStyle(
                            fontSize: 16,
                            color: getEmphasis(onSurface, emphasis.medium))),
                  ])),
              Expanded(child: Container()),
            ]),
          ),
          Container(
              margin: const EdgeInsets.only(right: 20),
              child: StaticButton(
                  width: _width / 8,
                  height: 30,
                  activeText: "Attivato",
                  disabledText: "Disattivato",
                  active: widget.attivo,
                  onTap: () {
                    widget.attivo = true;
                    HttpService(
                        id: "comando_manuale_abilitato",
                        parametriHeaders: {
                          "nome_gruppo": gruppi[widget.iGruppi].nome.toString(),
                          "nome_attuatore": gruppi[widget.iGruppi]
                              .attuatori[widget.iAttuatori]
                              .nome
                              .toString()
                        }).post();
                    disattivazioneComandiManuali(
                        widget.iGruppi, widget.iAttuatori);
                    gruppi[widget.iGruppi]
                        .attuatori[widget.iAttuatori]
                        .manualeAttivo = true;
                  })),
        ],
      ),
    ));
  }
}
