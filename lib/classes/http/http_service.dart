import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:interface_example1/data_models/config.dart';
import 'package:interface_example1/data_models/overview_data.dart';
import 'package:interface_example1/data_models/states_data.dart';

class HttpService {
  String id;
  String limit;
  HttpService({this.limit = "1000", required this.id});

  get() async {
    debugPrint("HTTP: GET|ID: " + id + "|LIMIT: " + limit);
    http.Response response;

    switch (id) {
      case "manualOperation":
        response = await http.get(nodeUrl, headers: {"id": id, "limit": limit});
        debugPrint(response.body);
        break;
      case "states":
        response = await http.get(nodeUrl, headers: {"id": id, "limit": limit});
        statesGet(response);
        break;
      case "states1":
        response = await http.get(nodeUrl, headers: {"id": id, "limit": limit});
        statesGet(response);

        break;
      case "states2":
        response = await http.get(nodeUrl, headers: {"id": id, "limit": limit});
        statesGet(response);
        break;
      case "produzione":
        final response =
            await http.get(nodeUrl, headers: {"id": id, "limit": limit});
        String responseBody = response.body.toString();
        String jsonStr = responseBody.toString();
        row.value = json.decode(jsonStr);
        showTableIndicator = false;
        break;
      case "graficoProduzione":
        final response =
            await http.get(nodeUrl, headers: {"id": id, "limit": limit});
        String responseBody = response.body.toString();
        String jsonStr = responseBody.toString();
        productionGraph.value = json.decode(jsonStr);

        /// produzioneTotale.value è uguale all'ultimo valore della lista
        /// [productionGraph]
        produzioneTotale.value = productionGraph.value.last["pezzi"];

        // produzioneUltime24h è uguale all'ultimo valore della lista
        // productionGraph - il penultimo elemento
        produzioneUltime24h.value = productionGraph.value.last["pezzi"] -
            productionGraph.value[productionGraph.value.length - 2]["pezzi"];

        // produzioneMediaGiornaliera è uguale alla somma della produzione di
        // ogni singolo giorno diviso il numero totale di giorni

        produzioneMediaGiornaliera.value =
            (productionGraph.value.last["pezzi"] / productionGraph.value.length)
                .round();

        // produzioneMediaOraria è uguale a produzioneMediaGiornaliera/24
        produzioneMediaOraria.value =
            (produzioneMediaGiornaliera.value / 24).round();
        break;
      default:
        response = await http.get(nodeUrl, headers: {"id": id, "limit": limit});
        String jsonStr = response.body.toString();
        Map<String, dynamic> temp = json.decode(jsonStr);
        debugPrint(
            "HTTP: ERRORE: " + temp["ERRORE"] + " SORGENTE: " + temp["FROM"]);
    }
  }

// TODO: CLEAN THIS FUNCTION
  static statesGet(final response) {
    //build the JSON object from the http response
    //
    String responseBody = response.body.toString();
    dynamic jsonObject = json.decode(responseBody);
    //extract the comands list
    //
    final convertedJsonObjectComands =
        jsonObject["comands"].cast<Map<String, dynamic>>();
    //populate a List<Comands> instance of the Comands class
    //
    comandsList.value = convertedJsonObjectComands
        .map<Comands>((json) => Comands.fromJson(json))
        .toList();
    //same thing with the headers list
    final convertedJsonObjectHeaders = jsonObject["headers"].cast<String>();
    comandsHeaders = List.from(convertedJsonObjectHeaders);
  }

  static post(String id) async {
    http.post(nodeUrl, headers: {"id": id});
  }
}
