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
      case "overview":
        response = await http.get(nodeUrl, headers: {"id": id, "limit": limit});
        Map<String, dynamic> stats = jsonDecode(response.body.toString());
        totalProduction.value = stats['totalProduction'];
        h24Production.value = stats['h24Production'];
        time.value = stats['time'];
        downtime.value = stats['downtime'];
        break;
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
        showTableIndicator = false;
        break;
      default:
        response = await http.get(nodeUrl, headers: {"id": id, "limit": limit});
        String jsonStr = response.body.toString();
        Map<String, dynamic> temp = json.decode(jsonStr);
        debugPrint(
            "HTTP: ERRORE: " + temp["ERRORE"] + " FROM: " + temp["SORGENTE"]);
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
