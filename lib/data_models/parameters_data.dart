import 'dart:convert';

import 'package:flutter/material.dart';

ValueNotifier<bool> changed = ValueNotifier<bool>(false);
ValueNotifier<bool> canBeRestored = ValueNotifier<bool>(false);
ValueNotifier<String> selected = ValueNotifier<String>("");
ValueNotifier<bool> statoParametri = ValueNotifier<bool>(true);
List<ParametriAttuatori> parametriOriginali = [];
ValueNotifier<List<ParametriAttuatori>> parametri =
    ValueNotifier<List<ParametriAttuatori>>([]);
ValueNotifier<List<ParametriAttuatori>> parametriDatabase =
    ValueNotifier<List<ParametriAttuatori>>([]);

// To parse this JSON data, do
//
//     final parametri = parametriFromJson(jsonString);

List<ParametriAttuatori> parametriFromJson(String str) =>
    List<ParametriAttuatori>.from(
        json.decode(str).map((x) => ParametriAttuatori.fromJson(x)));

String parametriToJson(List<ParametriAttuatori> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ParametriAttuatori {
  ParametriAttuatori({
    required this.gruppo,
    required this.attuatori,
  });

  String gruppo;
  List<Attuatori> attuatori;

  factory ParametriAttuatori.fromJson(Map<String, dynamic> json) =>
      ParametriAttuatori(
        gruppo: json["gruppo"],
        attuatori: List<Attuatori>.from(
            json["attuatori"].map((x) => Attuatori.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "gruppo": gruppo,
        "attuatori": List<dynamic>.from(attuatori.map((x) => x.toJson())),
      };
}

class Attuatori {
  Attuatori({
    required this.nome,
    required this.parametri,
    required this.tipo,
  });

  String nome;
  String tipo;
  List<Parametri> parametri;

  factory Attuatori.fromJson(Map<String, dynamic> json) => Attuatori(
        nome: json["nome"],
        tipo: json["tipo"],
        parametri: List<Parametri>.from(
            json["parametri"].map((x) => Parametri.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "nome": nome,
        "parametri": List<dynamic>.from(parametri.map((x) => x.toJson())),
      };
}

class Parametri {
  Parametri({
    required this.nomeParametro,
    required this.valore,
  });

  String nomeParametro;
  String valore;

  factory Parametri.fromJson(Map<String, dynamic> json) => Parametri(
        nomeParametro: json["nomeParametro"],
        valore: json["valore"],
      );

  Map<String, dynamic> toJson() => {
        "nomeParametro": nomeParametro,
        "valore": valore,
      };
}
