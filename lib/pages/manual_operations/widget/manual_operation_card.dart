import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:interface_example1/constants/style.dart';
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
                        text:
                            "min ${widget.limiteNegativo} max ${widget.limitePositivo}",
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
                  width: _width / 10,
                  height: 30,
                  activeText: "Attivato",
                  disabledText: "Disattivato",
                  active: false,
                  onTap: () {
                    widget.attivo = true;
                    /*disattivazioneComandiManuali(
                      widget.iGruppi, widget.iAttuatori);
                  gruppi[widget.iGruppi]
                      .attuatori[widget.iAttuatori]
                      .manualeAttivo
                      .value = true;
                },*/
                  })),
        ],
      ),
    ));
  }
}
