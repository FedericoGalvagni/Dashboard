import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:interface_example1/data_models/config.dart';
import 'package:interface_example1/data_models/manual_operation_data.dart';
import 'package:interface_example1/data_models/overview_data.dart';
import 'package:interface_example1/data_models/parameters_data.dart';

import 'package:interface_example1/data_models/states_data.dart';

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

  /// Parametri della richiesta
  Map<String, dynamic> parametriHeaders;
  HttpService(
      {this.parametriHeaders = const {},
      this.limit = "1000",
      required this.id});

  get() async {
    debugPrint("HTTP: GET|ID: " + id + "|LIMIT: " + limit);
    var dio = Dio();
    dio.options
      ..baseUrl = nodeUrl.toString()
      ..connectTimeout = 5000 //5s
      ..receiveTimeout = 5000
      ..headers = {"id": id, "limit": limit}
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
    debugPrint("HTTP: POST|ID: " + id);
    var dio = Dio();
    parametriHeaders.addAll({"id": id});

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

      parametriDatabase.value = (response.data as List)
          .map((x) => ParametriAttuatori.fromJson(x))
          .toList();

      statoParametri.value = !statoParametri.value;
    } on DioError catch (e) {
      debugPrint(e.message);
      assert(e.response!.statusCode == 404);
    }
  }

  manageGet(var res) {
    switch (id) {
      case "produzione":
        row.value = res.data;
        break;

      case "graficoProduzione":
        productionGraph.value = res.data;
        assegnaProduzione();
        break;

      case "parametri":
        debugPrint("1");
        parametri.value = (res.data as List)
            .map((x) => ParametriAttuatori.fromJson(x))
            .toList();
        debugPrint("1");
        parametriOriginali = (res.data as List)
            .map((x) => ParametriAttuatori.fromJson(x))
            .toList();
        parametriDatabase.value = (res.data as List)
            .map((x) => ParametriAttuatori.fromJson(x))
            .toList();
        costruzioneGruppi(parametri.value);
        break;

      default:
        Map<String, dynamic> temp = res;
        debugPrint(
            "HTTP: ERRORE: " + temp["ERRORE"] + " SORGENTE: " + temp["FROM"]);
    }
  }

  getInitialData() {
    HttpService(id: "parametri").get();
    HttpService(id: "graficoProduzione", limit: "100").get();
  }
}
