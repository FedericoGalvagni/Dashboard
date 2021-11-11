// ignore_for_file: avoid_print, unnecessary_new

import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:interface_example1/data/global.dart';
import 'package:interface_example1/data/overview_data.dart';
import 'package:interface_example1/data/settings_parameters.dart';
import 'package:interface_example1/data/states_data.dart';

class HttpService {
  HttpService instance = Get.find();
  static get(String id) async {
    var response;
    switch (id) {
      case "overview":
        response = await http.get(node_url, headers: {"id": id});
        Map<String, dynamic> stats = jsonDecode(response.body.toString());
        totalProduction.value = stats['totalProduction'];
        h24Production.value = stats['h24Production'];
        time.value = stats['time'];
        downtime.value = stats['downtime'];
        break;
      case "manualOperation":
        response = await http.get(node_url, headers: {"id": id});
        Map<String, dynamic> temp = jsonDecode(response.body.toString());
        break;
      case "states":
        final response = await http.get(node_url, headers: {"id": id});
        statesGet(response);
        break;
      case "states1":
        final response = await http.get(node_url, headers: {"id": id});
        statesGet(response);

        break;
      case "states2":
        final response = await http.get(node_url, headers: {"id": id});
        statesGet(response);

        break;
      default:
        showTableIndicator = false;
    }
  }

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

  static postManualOp(String id) async {
    http.post(node_url, headers: {"id": id});
  }
}
