import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:interface_example1/classes/models/global_variable.dart';
import 'package:interface_example1/classes/models/manual_operation_data.dart';
import 'package:interface_example1/classes/http/http_service.dart';
import 'package:interface_example1/constants/style.dart';
import 'package:interface_example1/helpers/responsivness.dart';
import 'package:interface_example1/widgets/custom/breathing_container.dart';
import 'package:interface_example1/widgets/custom/custom_text.dart';
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
  final double size;
  bool attivo;
  final String tipo;
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
    required this.tipo,
    required this.onTap,
    required this.size,
  }) : super(key: key);

  @override
  State<ManualOperationCard> createState() => _ManualOperationCardState();
}

class _ManualOperationCardState extends State<ManualOperationCard>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final Color _glowColor = primary.withOpacity(0.8);
    String text = "";
    if (widget.tipo == "motore") {
      text = "min ${widget.limiteNegativo} max ${widget.limitePositivo}";
    }
    double _width = MediaQuery.of(context).size.width;

    return Expanded(
      child: AspectRatio(
        aspectRatio: 1,
        child: BreathingGlowingWidget(
          offset: 5,
          glow: widget.attivo,
          glowColor: primary,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: surface(4),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 70,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                    color: surface(16),
                  ),
                  child: Stack(
                    children: [
                      Center(
                        child: CustomText(
                            text: widget.nome,
                            size: 40,
                            weight: FontWeight.w400,
                            color: getEmphasis(
                              onSurface,
                              emphasis.high,
                            )),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          margin: const EdgeInsets.only(right: 10),
                          child: Tooltip(
                              message:
                                  "Vai alla pagina parametri di " + widget.nome,
                              textStyle: const TextStyle(fontSize: 10),
                              child: IconButton(
                                splashRadius: 1,
                                onPressed: () {},
                                icon: const Icon(Icons.tune),
                                color: SurfaceContainer().content,
                              )),
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(child: Container()),
                Theme(
                  data: ThemeData(dividerColor: onSurface),
                  child: infoTable(),
                ),
                Expanded(child: Container()),
                CustomText(
                  color: primary,
                  text: widget.value,
                  size: 50,
                ),
                Expanded(child: Container()),
                StaticButton(
                    width: ResponsiveWidget.isSmallScreen(context) &&
                            ResponsiveWidget.isMediumScreen(context)
                        ? _width / 2.5
                        : _width / 7,
                    height: 30,
                    activeText: "Attivato",
                    disabledText: "Disattivato",
                    active: widget.attivo,
                    onTap: () {
                      widget.attivo = !widget.attivo;
                      updateShadow.value = !updateShadow.value;
                      HttpService(
                          id: "comando_manuale_abilitato",
                          percorso: "/data",
                          parametriHeaders: {
                            "nome_gruppo":
                                gruppi[widget.iGruppi].nome.toString(),
                            "nome_attuatore": gruppi[widget.iGruppi]
                                .attuatori[widget.iAttuatori]
                                .nome
                                .toString(),
                            "stato": widget.attivo ? "attivato" : "disabilitato"
                          }).post();
                      disattivazioneComandiManuali(
                          widget.iGruppi, widget.iAttuatori);
                      gruppi[widget.iGruppi]
                          .attuatori[widget.iAttuatori]
                          .manualeAttivo = widget.attivo;
                    }),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  DataTable infoTable() {
    return DataTable(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            border: Border(
                top: BorderSide(color: onSurface),
                bottom: BorderSide(color: onSurface),
                right: BorderSide(color: onSurface),
                left: BorderSide(color: onSurface))),
        headingRowHeight: 30,
        dataRowHeight: 30,
        columns: [
          DataColumn(
              label: CustomText(
            text: "Tipo",
            color: getEmphasis(onSurface, emphasis.high),
          )),
          DataColumn(
              label: CustomText(
            text: widget.tipo,
            color: getEmphasis(onSurface, emphasis.high),
          )),
        ],
        rows: infoRow());
  }

  List<DataRow> infoRow() {
    if (widget.tipo == "motore") {
      return [
        DataRow(cells: [
          DataCell(CustomText(
            text: "Limite negativo",
            color: getEmphasis(onSurface, emphasis.high),
          )),
          DataCell(CustomText(
            text: widget.limiteNegativo,
            color: getEmphasis(onSurface, emphasis.high),
          ))
        ]),
        DataRow(cells: [
          DataCell(CustomText(
            text: "Limite positivo",
            color: getEmphasis(onSurface, emphasis.high),
          )),
          DataCell(CustomText(
            text: widget.limitePositivo,
            color: getEmphasis(onSurface, emphasis.high),
          ))
        ])
      ];
    } else {
      return [];
    }
  }
}
