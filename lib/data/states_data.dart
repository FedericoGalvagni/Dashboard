import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';

class Comands {
  String id;
  String description;
  String action;
  String time;
  String user;
  bool selected;

  Comands(
      {required this.id,
      required this.description,
      required this.action,
      required this.time,
      required this.user,
      required this.selected});

  factory Comands.fromJson(Map<String, dynamic> json) => Comands(
        id: json['id'],
        description: json['description'],
        action: json['action'],
        time: json['time'],
        user: json['user'],
        selected: false,
      );
}

// TODO: avoid a table initialization, should change the builder to work
// even if there are no data.

String responseBody =
    '[{    "id": "",    "description": "",    "action": "",    "time": "",    "user": ""  }]';
dynamic jsonResponse = json.decode(responseBody);
final convertedJsonResponse = jsonResponse.cast<Map<String, dynamic>>();

ValueNotifier<List<Comands>> comandsList = ValueNotifier<List<Comands>>(
    convertedJsonResponse
        .map<Comands>((json) => Comands.fromJson(json))
        .toList());
String headers = '["time", "id", "action", "description", "user"]';
var comandsHeaders = json.decode(headers);
var test;
