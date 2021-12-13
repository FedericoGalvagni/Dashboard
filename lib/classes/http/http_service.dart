import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:interface_example1/classes/models/config_model.dart';
import 'package:interface_example1/classes/models/global_variable.dart';
import 'package:interface_example1/classes/models/immagini_telecamera_data.dart';
import 'package:interface_example1/classes/models/manual_operation_data.dart';
import 'package:interface_example1/classes/models/overview_data.dart';
import 'package:interface_example1/classes/models/parameters_data.dart';
import 'package:interface_example1/classes/models/states_data.dart';
import 'package:interface_example1/classes/models/user_model.dart';
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

  /// Se true, la richiesta viene visualizzata nel terminale
  bool print;

  /// Percorso a cui mandare la richiesta all'api, il quale viene aggiunto
  /// alla fine dell'url (dell'api)
  String percorso;

  /// Parametri della richiesta
  Map<String, dynamic>? parametriHeaders;
  HttpService(
      {this.parametriHeaders = const {},
      required this.percorso,
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
      ..baseUrl = nodeUrl.toString() + percorso
      ..connectTimeout = 5000 //5s
      ..receiveTimeout = 5000
      ..headers = parametriHeaders
      ..validateStatus = (int? status) {
        return status != null && status > 0;
      };

    try {
      final response = await dio.get(nodeUrl.toString() + percorso);
      manageGet(response);
    } on DioError catch (e) {
      debugPrint(e.message);
      assert(e.response!.statusCode == 404);
    } on HttpService catch (e) {
      debugPrint(e.toString());
    }
  }

  post() async {
    final url = nodeUrl + percorso;
    if (print) {
      debugPrint("HTTP: POST|ID: " + id);
    }
    var dio = Dio();
    parametriHeaders!.addAll({"id": id});

    dio.options
      ..baseUrl = url
      ..connectTimeout = 5000 //5s
      ..receiveTimeout = 5000
      ..headers = parametriHeaders
      ..validateStatus = (int? status) {
        return status != null && status > 0;
      };

    try {
      final response = await dio.post(url);
      managePost(response);
    } on DioError catch (e) {
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
      case "login":
        //debugPrint("login");
        manageLogin(response);
        break;

      default:

      /*debugPrint(
            "HTTP: ERRORE: " + temp["ERRORE"] + " SORGENTE: " + temp["FROM"]);
    }*/
    }
  }

  managePost(var response) {
    switch (id) {
      case "modifica_parametro":
        parametriDatabase.value = (response.data as List)
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

  manageLogin(var response) {
    utente = utenteFromJson(response.toString());
    debugPrint(utente.permessi.toString());
    switch (utente.permessi.toString()) {
      case "operatore":
        user = User.operatore;
        logined.value = true;
        loginFailed.value = false;
        debugPrint("Operatore user logged");
        getInitialData();
        break;
      case "admin":
        user = User.admin;
        logined.value = true;
        loginFailed.value = false;
        debugPrint("Admin user logged");
        getInitialData();
        break;
      case "base":
        user = User.base;
        logined.value = true;
        loginFailed.value = false;
        debugPrint("Base user logged");
        getInitialData();
        break;
      case "notlogged":
        user = User.notLogined;
        logined.value = false;
        loginFailed.value = true;
        debugPrint("Admin user logged");
        getInitialData();
        break;
      default:
    }
  }
}

updateData() {
  //debugPrint("update");
  //debugPrint("page: " + MenuController.instance.activeItem().toString());
  switch (MenuController.instance.activeItem().toString()) {
    case overviewPageRoute:
      HttpService(
              id: "graficoProduzione",
              percorso: "/data",
              limit: "100",
              print: false)
          .get();
      break;

    case manualOperationsPageRoute:
      break;

    case statesPageRoute:
      break;

    case parametersPageRoute:
      break;

    case telecamerPageRoute:
      for (var item in immaginiTelecamere) {
        HttpService(
            id: "immagini_telecamere",
            percorso: "/data",
            print: false,
            parametriHeaders: {
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

Future<void> getInitialData() async {
  switch (user) {
    case User.admin:
      HttpService(
        id: "parametri",
        percorso: "/data",
      ).get();
      HttpService(id: "produzione", percorso: "/data", limit: "100").get();
      HttpService(id: "graficoProduzione", percorso: "/data", limit: "100")
          .get();
      costruzioneModelloImmagini(config.telecamere);

      for (var item in immaginiTelecamere) {
        HttpService(
            id: "immagini_telecamere",
            percorso: "/data",
            parametriHeaders: {
              "percorso": item.percorso.toString(),
              "timestamp": item.timestamp
            }).get();
      }
      break;
    case User.operatore:
      HttpService(id: "produzione", percorso: "/data", limit: "100").get();
      HttpService(id: "graficoProduzione", percorso: "/data", limit: "100")
          .get();
      costruzioneModelloImmagini(config.telecamere);

      for (var item in immaginiTelecamere) {
        HttpService(
            id: "immagini_telecamere",
            percorso: "/data",
            parametriHeaders: {
              "percorso": item.percorso.toString(),
              "timestamp": item.timestamp
            }).get();
      }
      break;
    case User.base:
      HttpService(id: "graficoProduzione", percorso: "/data", limit: "100")
          .get();
      costruzioneModelloImmagini(config.telecamere);

      for (var item in immaginiTelecamere) {
        HttpService(
            id: "immagini_telecamere",
            percorso: "/data",
            parametriHeaders: {
              "percorso": item.percorso.toString(),
              "timestamp": item.timestamp
            }).get();
      }
      break;
    case User.notLogined:
      break;
    default:
  }
}
