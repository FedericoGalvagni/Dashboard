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

/// Ritorna degli elementi di controllo della tabella tra i quali:
/// · Un [ElevatedButton] che può essere premuto per inviare un Http request
///   con parametri quali [limit] : limite numero righe richieste,
///   [id] : Identificativo richiesta http
/// · Un [CustomDDMenu]
/// · Un [TextField] il cui input vien
///

class StatesMedium extends StatefulWidget {
  /// Limite numero righe richieste
  String limit;

  /// Identificativo richiesta http
  String id;
  StatesMedium({Key? key, this.limit = "100", this.id = ""}) : super(key: key);

  @override
  StatesMediumState createState() => StatesMediumState();
}

class StatesMediumState extends State<StatesMedium> {
  final comandController2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    GlobalKey<AutoCompleteTextFieldState<String>> key = GlobalKey();
    // TODO: CLEAN
    List<String> suggestions = [
  "produzione",
  "graficoProduzione"
];

    return Column(children: [
      Row(children: [
        SizedBox(
          width: _width / 100,
        ),
        SizedBox(
            width: _width / 4,
            height: 50,
            child: SimpleAutoCompleteTextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter a search term',
              ),
              key: key,
              suggestions: suggestions,
              textChanged: (text) {
                widget.id = text.toString();
              },
            )),
        // TODO: CLEAR?
        /*TextField(
              controller: widget.id,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter a search term',
              ),
            )),*/
        SizedBox(
            width: 60,
            height: 50,
            child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    HttpService(id: widget.id, limit: widget.limit).get();
                    widget.id = "";
                  });
                },
                child: const CustomText(
                    text: "GO", size: 18, weight: FontWeight.bold))),
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
            textColor: dark,
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
