import 'dart:convert';
import 'package:flutter/material.dart';

ValueNotifier<String> selected = ValueNotifier<String>("");
ValueNotifier<bool> statoParametri = ValueNotifier<bool>(true);
List<ParametriMotori> parametriOriginali = [];
List<ParametriMotori> parametri = [];
ValueNotifier<List<ParametriMotori>> parametriDatabase =
    ValueNotifier<List<ParametriMotori>>([]);

List<ParametriMotori> parameterFromJson(String str) =>
    List<ParametriMotori>.from(
        json.decode(str).map((x) => ParametriMotori.fromJson(x)));

String parameterToJson(List<ParametriMotori> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ParametriMotori {
  ParametriMotori({
    required this.gruppo,
    required this.listaMotori,
  });
  List<Motore> listaMotori;
  String gruppo;

  factory ParametriMotori.fromJson(Map<String, dynamic> json) =>
      ParametriMotori(
        gruppo: json["gruppo"],
        listaMotori: List<Motore>.from(
            json["listaMotori"].map((x) => Motore.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "gruppo": gruppo,
        "listaMotori": List<dynamic>.from(listaMotori.map((x) => x.toJson())),
      };
}

class Motore {
  Motore({
    required this.nomeMotore,
    required this.parametri,
  });

  String nomeMotore;
  List<Parametro> parametri;

  factory Motore.fromJson(Map<String, dynamic> json) => Motore(
        nomeMotore: json["nomeMotore"],
        parametri: List<Parametro>.from(
            json["parametri"].map((x) => Parametro.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "nomeMotore": nomeMotore,
        "parametri": List<dynamic>.from(parametri.map((x) => x.toJson())),
      };
}

class Parametro {
  Parametro({
    required this.nomeParametro,
    required this.valore,
  });

  String nomeParametro;
  String valore;

  factory Parametro.fromJson(Map<String, dynamic> json) => Parametro(
        nomeParametro: json["nomeParametro"],
        valore: json["valore"],
      );

  Map<String, dynamic> toJson() => {
        "nomeParametro": nomeParametro,
        "valore": valore,
      };
}
