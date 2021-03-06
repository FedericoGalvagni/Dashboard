import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:interface_example1/classes/http/http_service.dart';
import 'package:interface_example1/constants/style.dart';
import 'package:interface_example1/classes/modelli/variabili_globali.dart';
import 'package:interface_example1/classes/modelli/states_data.dart';
import 'package:interface_example1/pages/tabelle/widgets/tabelle_datatable.dart';
import 'package:interface_example1/widgets/custom/autocomplete_textfield.dart';
import 'package:interface_example1/widgets/custom/custom_dropdownmenu.dart';
import 'package:interface_example1/widgets/custom/custom_text.dart';
import 'package:interface_example1/widgets/spacer/small_horizontal_spacer.dart';
import 'package:interface_example1/widgets/spacer/small_vertical_spacer.dart';

/// Ritorna degli elementi di controllo della tabella.
/// Un [ElevatedButton] che può essere premuto per inviare un Http request
/// con parametri quali [limit] : limite numero righe richieste,
/// [id] : Identificativo richiesta http
/// Un [CustomDDMenu]
/// Un [TextField] il cui input vien
///

// ignore: must_be_immutable
class TabelleSmall extends StatefulWidget {
  /// Limite numero righe richieste
  String limit;

  /// Identificativo richiesta http
  String? id;
  TabelleSmall({Key? key, this.limit = "100", this.id}) : super(key: key);

  @override
  TabelleSmallState createState() => TabelleSmallState();
}

class TabelleSmallState extends State<TabelleSmall> {
  final comandController2 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    GlobalKey<AutoCompleteTextFieldState<String>> key =
        GlobalKey(debugLabel: "SimpleAutoCompleteTextField_federico");
    // ignore: todo
    // TODO: CLEAN
    List<String> suggestions = ["produzione", "graficoProduzione"];

    double _width = MediaQuery.of(context).size.width;

    return Column(children: [
      const SmallVSpacer(),
      Row(children: [
        const SmallHSpacer(),
        Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4), color: surface(4)),
            width: _width / 4,
            height: 50,
            child: SimpleAutoCompleteTextField(
                style: TextStyle(color: getEmphasis(onSurface, emphasis.high)),
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide: BorderSide(
                          color: getEmphasis(onSurface, emphasis.medium),
                          width: 1)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide: BorderSide(color: primary, width: 2)),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: primary)),
                  hintStyle:
                      TextStyle(color: getEmphasis(onSurface, emphasis.medium)),
                  hintText: 'Enter a search term',
                ),
                key: key,
                clearOnSubmit: false,
                suggestions: suggestions,
                textChanged: (text) {
                  widget.id = text;
                },
                textSubmitted: (text) {
                  setState(() {
                    showTableIndicator.value = true;
                  });
                  widget.id = text;
                  HttpService(
                          id: widget.id.toString(),
                          percorso: "/data",
                          limit: widget.limit)
                      .get();
                })),
        SizedBox(
            width: 60,
            height: 50,
            child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateColor.resolveWith((states) => primary)),
                onPressed: () {
                  setState(() {
                    showTableIndicator.value = true;
                  });

                  HttpService(
                          id: widget.id.toString(),
                          percorso: "/data",
                          limit: widget.limit)
                      .get();
                },
                child: CustomText(
                    color: getEmphasis(onPrimary, emphasis.high),
                    text: "GO",
                    size: 18,
                    weight: FontWeight.bold))),
        const SmallHSpacer(),
        //
        Expanded(
          child: Container(),
        ),
        SizedBox(
          height: 50,
          child: CustomDDMenu(
            dropdownValue: widget.limit.toString(),
            items: const ["100", "250", "500", "1000", "2500", "5000", "10000"],
            color: primary,
            textColor: getEmphasis(onSurface, emphasis.high),
            selectedValue: (value) {
              debugPrint(value);
              widget.limit = value;
            },
          ),
        ),
        const SmallHSpacer()
      ]),
      // TABLE
      const SmallVSpacer(),
      ValueListenableBuilder(
          valueListenable: row,
          builder: (context, value, widget) {
            return _progressIndicator();
          }),
      Row(children: [
        const SmallHSpacer(),
        Expanded(
            flex: 1,
            child: ValueListenableBuilder(
                valueListenable: rowLenght,
                builder: (context, value, widget) {
                  return ValueListenableBuilder(
                      valueListenable: row,
                      builder: (context, value, widget) {
                        showTableIndicator.value = false;
                        if (row.value.isNotEmpty) {
                          return Container(
                              decoration: BoxDecoration(
                                  color: surface(4),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Container(
                                  margin: const EdgeInsets.only(
                                      left: 10, right: 10),
                                  // ignore: prefer_const_constructors
                                  child: DataTableD()));
                        } else {
                          return Container();
                        }
                      });
                })),
        const SmallHSpacer(),
      ])
    ]);
  }

  Widget _progressIndicator() {
    double _width = MediaQuery.of(context).size.width;
    if (showTableIndicator.value) {
      return Column(
        children: [
          Container(
              margin: EdgeInsets.only(left: _width / 64, right: _width / 64),
              child: LinearProgressIndicator(
                backgroundColor: primary.withOpacity(0.3),
                color: primary,
                minHeight: 10,
              )),
          const SmallVSpacer()
        ],
      );
    } else {
      return Container();
    }
  }
}
