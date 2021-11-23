import 'dart:ui';
import 'package:autocomplete_textfield_ns/autocomplete_textfield_ns.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:interface_example1/classes/http/http_service.dart';
import 'package:interface_example1/constants/style.dart';
import 'package:interface_example1/data_models/config.dart';
import 'package:interface_example1/data_models/states_data.dart';
import 'package:interface_example1/pages/states/widgets/states_datatable.dart';
import 'package:interface_example1/widgets/custom_dropdownmenu.dart';
import 'package:interface_example1/widgets/custom_text.dart';

/// Ritorna degli elementi di controllo della tabella.
/// Un [ElevatedButton] che può essere premuto per inviare un Http request
/// con parametri quali [limit] : limite numero righe richieste,
/// [id] : Identificativo richiesta http
/// Un [CustomDDMenu]
/// Un [TextField] il cui input vien
///

class StatesLarge extends StatefulWidget {
  /// Limite numero righe richieste
  String limit;

  /// Identificativo richiesta http
  String id;
  StatesLarge({Key? key, this.limit = "100", this.id = ""}) : super(key: key);

  @override
  StatesLargeState createState() => StatesLargeState();
}

class StatesLargeState extends State<StatesLarge> {
  final comandController2 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    GlobalKey<AutoCompleteTextFieldState<String>> key =
        GlobalKey(debugLabel: "SimpleAutoCompleteTextField_federico");
    // TODO: CLEAN
    List<String> suggestions = ["produzione", "graficoProduzione"];

    double _width = MediaQuery.of(context).size.width;

    return Column(children: [
      Row(children: [
        SizedBox(
          width: _width / 100,
        ),
        Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(4),color: surface(2)),
            width: _width / 4,
            height: 50,
            child: SimpleAutoCompleteTextField(
              
                decoration: InputDecoration(

                  border: OutlineInputBorder(),
                  hintStyle: TextStyle(color: mediumEmphasis(textOnSurface)),
                  hintText: 'Enter a search term',
                ),
                key: key,
                clearOnSubmit: false,
                suggestions: suggestions,
                textSubmitted: (text) {
                  print(text);
                  widget.id = text;
                })),
        SizedBox(
            width: 60,
            height: 50,
            child: ElevatedButton(
              style: ButtonStyle(backgroundColor: MaterialStateColor.resolveWith((states) => secondary)),
                onPressed: () {
                  setState(() {
                    HttpService(id: widget.id, limit: widget.limit).get();
                    widget.id = "";
                  });
                },
                child: CustomText(
                    color: highEmphasis(textOnSurface),
                    text: "GO",
                    size: 18,
                    weight: FontWeight.bold))),
        SizedBox(
          width: _width / 100,
        ),
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
            textColor: highEmphasis(textOnSurface),
            selectedValue: (value) {
              debugPrint(value);
              widget.limit = value;
            },
          ),
        ),
        // SPACER
        SizedBox(
          width: _width / 100,
        )
      ]),
      // TABLE
      Row(
        children: [
          Container(
            height: 5,
          )
        ],
      ),
      ValueListenableBuilder(
          valueListenable: comandsList,
          builder: (context, value, widget) {
            return _progressIndicator();
          }),
      Row(
        children: [
          Container(
            height: 5,
          )
        ],
      ),
      Row(children: [
        Expanded(
            flex: 1,
            child: ValueListenableBuilder(
                valueListenable: comandsList,
                builder: (context, value, widget) {
                  showTableIndicator = false;
                  return const DataTableD();
                })),
      ])
    ]);
  }

  Widget _progressIndicator() {
    if (showTableIndicator) {
      return Container(
          margin: const EdgeInsets.only(left: 5, right: 5),
          child: const LinearProgressIndicator(
            minHeight: 10,
          ));
    } else {
      return Container();
    }
  }
}
