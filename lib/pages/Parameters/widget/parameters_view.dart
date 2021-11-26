import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:interface_example1/classes/http/http_service.dart';
import 'package:interface_example1/constants/style.dart';
import 'package:interface_example1/data_models/parameters_data.dart';
import 'package:interface_example1/widgets/custom/custom_text.dart';

class ParametersView extends StatefulWidget {
  final String treeviewKey;
  const ParametersView({Key? key, required this.treeviewKey}) : super(key: key);

  @override
  State<ParametersView> createState() => _ParametersViewState();
}

class _ParametersViewState extends State<ParametersView> {
  int iGruppi = -1;
  int iMotori = -1;
  @override
  Widget build(BuildContext context) {
    List<Parametro> list;

    var parts = widget.treeviewKey.split('.');
    var a = parts[0].trim();
    var b = parts.sublist(1).join('.').trim();

    if (a.isEmpty) {
      return Container();
    } else {
      iGruppi = int.parse(a);
      iMotori = int.parse(b);
      list = parametri[iGruppi].listaMotori[iMotori].parametri;

      return Container(
          color: surface(4),
          width: 600,
          child: Theme(
            data: ThemeData(dividerColor: divider),
            child: DataTable(columns: [
              DataColumn(
                  label: CustomText(
                align: TextAlign.center,
                text: "Indice",
                size: 20,
                color: getEmphasis(onSurface, emphasis.high),
                weight: FontWeight.w600,
              )),
              DataColumn(
                  label: CustomText(
                align: TextAlign.center,
                text: "Parametri",
                size: 20,
                color: getEmphasis(onSurface, emphasis.high),
                weight: FontWeight.w600,
              )),
              DataColumn(
                  label: CustomText(
                align: TextAlign.center,
                text: "Valori",
                size: 20,
                color: getEmphasis(onSurface, emphasis.high),
                weight: FontWeight.w600,
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

  List<DataRow> _buildRow(List<Parametro> list) {
    List<DataRow> row = [];
    for (int i = 0; i < list.length; i++) {
      TextEditingController temp;
      temp = TextEditingController(text: list[i].valore.toString());
      row.add(DataRow(cells: [
        DataCell(CustomText(
          align: TextAlign.center,
          text: i.toString(),
          color: getEmphasis(onSurface, emphasis.high),
        )),
        DataCell(CustomText(
          align: TextAlign.center,
          text: list[i].nomeParametro,
          color: getEmphasis(onSurface, emphasis.high),
        )),
        DataCell(Container(
          margin: const EdgeInsets.only(top: 5, bottom: 5),
          child: TextFormField(
            controller: temp,
            inputFormatters: [
              FilteringTextInputFormatter.allow(
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
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                  borderSide: BorderSide(
                      color: getEmphasis(onSurface, emphasis.medium),
                      width: 1)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                  borderSide: BorderSide(color: primary, width: 2)),
              border:
                  OutlineInputBorder(borderSide: BorderSide(color: primary)),
            ),
            onFieldSubmitted: (newValue) {
              setState(() {});
              parametri[iGruppi].listaMotori[iMotori].parametri[i].valore =
                  newValue;
              String nomeMotore =
                  parametri[iGruppi].listaMotori[iMotori].nomeMotore.toString();
              String nomeGruppo = parametri[iGruppi].gruppo.toString();
              String nomeParametro = parametri[iGruppi]
                  .listaMotori[iMotori]
                  .parametri[i]
                  .nomeParametro;
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
              HttpService(id: "modifica parametro", parametriHeaders: {
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
        )),
        DataCell(ValueListenableBuilder(
          valueListenable: parametriDatabase,
          builder: (context, widget, value) {
            return _getState(
              parametriOriginali[iGruppi].listaMotori[iMotori].parametri[i].valore,
              parametri[iGruppi].listaMotori[iMotori].parametri[i].valore,
              parametriDatabase.value[iGruppi].listaMotori[iMotori].parametri[i].valore,
              parametri[iGruppi].listaMotori[iMotori].parametri[i].nomeParametro,
            );
          }
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
  Widget _getState(String valoreOriginale, String valoreInterfaccia,
      String valoreDatabase, String nomeParametro) {
    //debugPrint("DB: " + valoreDatabase);
    //debugPrint("OR: " + valoreOriginale);
    //debugPrint("UI :" + valoreInterfaccia);

  
    if (valoreDatabase == valoreInterfaccia && valoreOriginale == valoreDatabase) {
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
          child: Icon(
            Icons.published_with_changes,
            color: Colors.amber.shade700,
            size: 20,
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
                    .nomeParametro;
                debugPrint("Assegnato: " +
                    nomeGruppo +
                    ">" +
                    nomeMotore +
                    ">" +
                    nomeParametro +
                    ": " +
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
