import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:interface_example1/classes/data_models/global_variable.dart';
import 'package:interface_example1/classes/data_models/immagini_telecamera_data.dart';
import 'package:interface_example1/classes/data_models/manual_operation_data.dart';
import 'package:interface_example1/classes/data_models/overview_data.dart';
import 'package:interface_example1/classes/data_models/parameters_data.dart';
import 'package:interface_example1/classes/data_models/states_data.dart';
import 'package:interface_example1/routing/routes.dart';
import 'package:interface_example1/widgets/menu_controller.dart';

/// ## HTTP
/// Classe di gestione methodo GET e POST http, l'attributo [id] viene inserito
/// nell'header della richiesta o del post, i messaggi vengono identificati dall'API
/// tramite id. L'attributo [limit] viene utilizzato dall'API nel caso di QUERY
/// al server per limitare il numero di righe in risposta.
class HttpService {
  /// Identificato pacchetto http
  String id;

  /// Limite righe di risposta QUERY
  String limit;

  bool print;

  /// Parametri della richiesta
  Map<String, dynamic>? parametriHeaders;
  HttpService(
      {this.parametriHeaders = const {},
      this.limit = "1000",
      this.print = true,
      required this.id});

  get() async {
    (print) => debugPrint("HTTP: GET|ID: " + id + "|LIMIT: " + limit);
    var dio = Dio();
    if (parametriHeaders!.isEmpty) {
      parametriHeaders = {};
    }

    parametriHeaders!.addAll({"id": id, "limit": limit});
    dio.options
      ..baseUrl = nodeUrl.toString()
      ..connectTimeout = 5000 //5s
      ..receiveTimeout = 5000
      ..headers = parametriHeaders
      ..validateStatus = (int? status) {
        return status != null && status > 0;
      };

    try {
      final response = await dio.get(nodeUrl.toString());
      manageGet(response);
    } on DioError catch (e) {
      debugPrint(e.message);
      assert(e.response!.statusCode == 404);
    } on HttpService catch (e) {
      debugPrint(e.toString());
    }
  }

  post() async {
    (print) => debugPrint("HTTP: POST|ID: " + id);
    var dio = Dio();
    parametriHeaders!.addAll({"id": id});

    dio.options
      ..baseUrl = nodeUrl.toString()
      ..connectTimeout = 5000 //5s
      ..receiveTimeout = 5000
      ..headers = parametriHeaders
      ..validateStatus = (int? status) {
        return status != null && status > 0;
      };

    try {
      final response = await dio.post(nodeUrl.toString());
      managePost(response);
    } on DioError catch (e) {
      debugPrint(e.message);
      assert(e.response!.statusCode == 404);
    }
  }

  manageGet(var response) {
    switch (id) {
      case "produzione":
        row.value = response.data;
        break;

      case "graficoProduzione":
        productionGraph.value = response.data;
        assegnaProduzione();
        break;

      case "parametri":
        parametri.value = (response.data as List)
            .map((x) => ParametriAttuatori.fromJson(x))
            .toList();

        parametriOriginali = (response.data as List)
            .map((x) => ParametriAttuatori.fromJson(x))
            .toList();
        parametriDatabase.value = (response.data as List)
            .map((x) => ParametriAttuatori.fromJson(x))
            .toList();
        costruzioneGruppi(parametri.value);
        break;

      case "immagini_telecamere":
        if (response.data == "true") {
          debugPrint("No updated images");
        } else {
          aggiornamentoImmagini(response);
        }
        break;

      default:
        debugPrint(response.data.toString());
      /*debugPrint(
            "HTTP: ERRORE: " + temp["ERRORE"] + " SORGENTE: " + temp["FROM"]);
    }*/
    }
  }

  managePost(var res) {
    switch (id) {
      case "modifica_parametro":
        parametriDatabase.value = (res.data as List)
            .map((x) => ParametriAttuatori.fromJson(x))
            .toList();
        changed.value = !changed.value;
        statoParametri.value = !statoParametri.value;
        break;
      case "comando_manuale_abilitato":
        //
        break;

      default:
    }
  }

  getInitialData() {
    HttpService(id: "parametri").get();
    HttpService(id: "graficoProduzione", limit: "100").get();
  }
}

updateData() {
  switch (MenuController.instance.activeItem().toString()) {
    case overviewPageRoute:
      HttpService(id: "graficoProduzione", limit: "100", print: false).get();
      break;

    case manualOperationsPageRoute:
      break;

    case statesPageRoute:
      break;

    case parametersPageRoute:
      break;

    case telecamerPageRoute:
      for (var item in immaginiTelecamere) {
        HttpService(id: "immagini_telecamere", print: false, parametriHeaders: {
          "percorso": item.percorso.toString(),
          "timestamp": item.timestamp.toString()
        }).get();
      }
      break;

    case settingsPageRoute:
      break;

    case authenticationPageRoute:
      break;

    default:
  }
}

