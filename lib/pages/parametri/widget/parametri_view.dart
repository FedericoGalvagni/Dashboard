import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:interface_example1/classes/http/http_service.dart';
import 'package:interface_example1/classes/modelli/parametri_modello.dart';
import 'package:interface_example1/constants/style.dart';
import 'package:interface_example1/classes/modelli/variabili_globali.dart';
import 'package:interface_example1/widgets/custom/custom_text.dart';

// ignore: must_be_immutable
class ParametriView extends StatefulWidget {
  String treeviewKey;
  double width;
  int? iGruppi;
  int? iMotori;
  ParametriView({Key? key, required this.width, required this.treeviewKey})
      : super(key: key);

  @override
  State<ParametriView> createState() => ParametriViewState();
}

class ParametriViewState extends State<ParametriView> {
  int iGruppi = -1;
  int iMotori = -1;
  int iParametri = 0;
  @override
  Widget build(BuildContext context) {
    List<Parametri> list;

    var parts = widget.treeviewKey.split('.');

    if (parts.length < 2 || indiceGruppi == -1) {
      return Container();
    } else {
      var a = parts[1];
      var b = parts[2];
      iGruppi = int.parse(a);
      iMotori = int.parse(b);
      debugPrint(parametri.value[iGruppi].attuatori[iMotori].parametri.length
          .toString());
      debugPrint(a);
      debugPrint(b);
      list = parametri.value[iGruppi].attuatori[iMotori].parametri;
      return Container(
          width: widget.width - 20,
          margin: const EdgeInsets.only(right: 10, left: 10),
          decoration: BoxDecoration(
              color: surface(4), borderRadius: BorderRadius.circular(10)),
          child: Theme(
            data: ThemeData(dividerColor: divider),
            child: DataTable(columns: [
              DataColumn(
                  label: Center(
                child: CustomText(
                  align: TextAlign.center,
                  text: "Parametri",
                  size: 20,
                  color: getEmphasis(onSurface, emphasis.high),
                  weight: FontWeight.w600,
                ),
              )),
              DataColumn(
                  label: Center(
                child: CustomText(
                  align: TextAlign.center,
                  text: "Valori",
                  size: 20,
                  color: getEmphasis(onSurface, emphasis.high),
                  weight: FontWeight.w600,
                ),
              )),
              DataColumn(
                  label: CustomText(
                align: TextAlign.center,
                text: "Stato",
                size: 20,
                color: getEmphasis(onSurface, emphasis.high),
                weight: FontWeight.w600,
              ))
            ], rows: _buildRow(list)),
          ));
    }
  }

  List<DataRow> _buildRow(List<Parametri> list) {
    List<DataRow> row = [];
    for (int i = 0; i < list.length; i++) {
      iParametri = i;
      TextEditingController temp;
      temp = TextEditingController(text: list[i].valore.toString());
      row.add(DataRow(cells: [
        DataCell(CustomText(
          align: TextAlign.left,
          text: list[i].nomeParametro,
          color: getEmphasis(onSurface, emphasis.high),
        )),
        DataCell(Center(
          child: Container(
            margin: const EdgeInsets.only(top: 5, bottom: 5),
            child: TextFormField(
              controller: temp,
              inputFormatters: [
                FilteringTextInputFormatter.allow(
                    // ignore: todo
                    // TODO: filtro textfield solo decimal

                    RegExp(r'(^-?[0-9]*.?[0-9]*$)', multiLine: true)),
              ],
              textAlign: TextAlign.center,
              textAlignVertical: TextAlignVertical.center,
              style: TextStyle(
                  color: getEmphasis(
                onSurface,
                emphasis.high,
              )),
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: BorderSide(color: primary, width: 2)),
              ),
              onFieldSubmitted: (newValue) {
                statoParametri.value = !statoParametri.value;
                debugPrint("Submitted");
                indiceGruppi = iGruppi;
                indiceAttuatori = iMotori;
                setState(() {});
                parametri.value[iGruppi].attuatori[iMotori].parametri[i]
                    .valore = newValue;
                changed.value = !changed.value;
                String nomeMotore =
                    parametri.value[iGruppi].attuatori[iMotori].nome.toString();
                String nomeGruppo = parametri.value[iGruppi].gruppo.toString();
                String nomeParametro = parametri.value[iGruppi]
                    .attuatori[iMotori].parametri[i].nomeParametro;
                debugPrint("Assegnato: " +
                    nomeGruppo +
                    ">" +
                    nomeMotore +
                    ">" +
                    nomeParametro +
                    ": " +
                    newValue +
                    " ID: " +
                    iGruppi.toString() +
                    "." +
                    iMotori.toString() +
                    "." +
                    i.toString());
                HttpService(
                    id: "modifica_parametro",
                    percorso: "/parametri",
                    parametriHeaders: {
                      "gruppo": nomeGruppo,
                      "motore": nomeMotore,
                      "parametro": nomeParametro,
                      "indicegruppi": iGruppi,
                      "indicemotori": iMotori,
                      "indiceparametri": i,
                      "nuovovalore": double.parse(newValue),
                    }).post();
              },
            ),
          ),
        )),
        DataCell(Center(
          child: ValueListenableBuilder(
              valueListenable: statoParametri,
              builder: (context, widget, value) {
                return _getState(
                    parametriOriginali[iGruppi]
                        .attuatori[iMotori]
                        .parametri[i]
                        .valore,
                    parametri
                        .value[iGruppi].attuatori[iMotori].parametri[i].valore,
                    parametriDatabase
                        .value[iGruppi].attuatori[iMotori].parametri[i].valore,
                    parametri.value[iGruppi].attuatori[iMotori].parametri[i]
                        .nomeParametro,
                    iGruppi,
                    iMotori,
                    i, () {
                  setState(() {});
                  parametri.value[iGruppi].attuatori[iMotori].parametri[i]
                          .valore =
                      parametriOriginali[iGruppi]
                          .attuatori[iMotori]
                          .parametri[i]
                          .valore;

                  HttpService(
                      id: "modifica_parametro",
                      percorso: "/parametri",
                      parametriHeaders: {
                        "indicegruppi": iGruppi,
                        "indicemotori": iMotori,
                        "indiceparametri": i,
                        "nuovovalore": double.parse(parametriOriginali[iGruppi]
                            .attuatori[iMotori]
                            .parametri[i]
                            .valore),
                      }).post();
                });
              }),
        ))
      ]));
    }
    return row;
  }

  /// Verifica lo stato del valore del parametro, il risultato varia in base
  /// ad un confronto fra il valore originale, quello nel database e quello
  /// nell'interfaccia. Ci sono 3 possibilità:
  /// -  Il dato è sincronizzato e non ha subito variamenti, quindi tutti e 3 i valori
  ///    sono uguali
  /// - Il dato è stato cambiato, ma il database deve ancora essere aggiornato, quindi
  ///   il valore originale differisce da quello nel database e il valore visualizzato
  ///   sull'interfaccia differisce da quello contenuto nel database
  /// - Il dato è stato cambiato ed è sincronizzato con il server, quindi il valore
  ///   originale differisce da quello sul database, mentre il valore visualizzato
  ///   sull'interfaccia coincide con quello nel database
  _getState(
      String valoreOriginale,
      String valoreInterfaccia,
      String valoreDatabase,
      String nomeParametro,
      int x,
      int y,
      int z,
      Function ripristinaOriginale) {
    //debugPrint("DB: " + valoreDatabase);
    //debugPrint("OR: " + valoreOriginale);
    //debugPrint("UI :" + valoreInterfaccia);
    if (valoreDatabase == valoreInterfaccia &&
        valoreOriginale == valoreDatabase) {
      return Tooltip(
        message: nomeParametro +
            " è sincronizzato con il database\n e non ha subito cambiamenti",
        child: const Icon(
          Icons.check_circle,
          color: Colors.green,
          size: 20,
        ),
      );
    } else {
      if (valoreOriginale != valoreDatabase &&
          valoreInterfaccia == valoreDatabase) {
        return Tooltip(
          message: nomeParametro +
              " è stato cambiato ed è sincronizzato con il database.\n Valore originale:  " +
              valoreOriginale,
          child: IconButton(
            padding: EdgeInsets.zero,
            iconSize: 20,
            icon: Icon(
              Icons.published_with_changes,
              color: Colors.amber.shade700,
              size: 20,
            ),
            onPressed: () {
              ripristinaOriginale();
            },
          ),
        );
      } else {
        return Tooltip(
          message:
              nomeParametro + " ha subito cambiamenti e non è sincronizzato",
          child: const Icon(
            Icons.sync,
            color: Colors.yellow,
            size: 20,
          ),
        );
      }
    }
  }
}

/*return Tooltip(
        message: nomeParametro +
            " è stato cambiato. \n Valore originale: " +
            valoreOriginale,
        child: const Icon(
          Icons.check_circle,
          color: Colors.green,
          size: 20,
        ),
      ); */

/*EditableTextField(
              inputType: TextInputType.number,
              align: TextAlign.center,
              initialText: list[i].valore,
              color: getEmphasis(onSurface, emphasis.high),
              editingController: temp,
              newValue: (newvalue) {
                parameter[iGruppi].listaMotori[iMotori].parametri[i].valore =
                    newvalue;
                String nomeMotore = parameter[iGruppi]
                    .listaMotori[iMotori]
                    .nomeMotore
                    .toString();
                String nomeGruppo = parameter[iGruppi].gruppo.toString();
                String nomeParametro = parameter[iGruppi]
                    .listaMotori[iMotori]
                    .parametri[i]
  asd       .nomeParametro;
  asd   debugPrint("Assegnato: " +
  asd       nomeGruppo +
  asd       ">" +
  asd       nomeMotore +
  asd       ">" +
  asd       nomeParametro +
  asd       ": " +
                    newvalue +
                    " ID: " +
                    iGruppi.toString() +
                    "." +
                    iMotori.toString() +
                    "." +
                    i.toString());
                HttpService(id: "modifica parametro", parametri: {
                  "gruppo": nomeGruppo,
                  "motore": nomeMotore,
                  "parametro": nomeParametro,
                  "indicegruppi": iGruppi,
                  "indicemotori": iMotori,
                  "indiceparametri": i,
                  "nuovovalore": double.parse(newvalue),
                }).post();
                setState(() {});
              },
            ),*/
