import 'dart:convert';

import 'package:flutter/material.dart';

ValueNotifier<String> selected = ValueNotifier<String>("");
List<parametriMotori> parametriOriginali = [];
List<parametriMotori> parametri = [];
ValueNotifier<List<parametriMotori>> parametriDatabase =
    ValueNotifier<List<parametriMotori>>([]);

List<parametriMotori> parameterFromJson(String str) =>
    List<parametriMotori>.from(
        json.decode(str).map((x) => parametriMotori.fromJson(x)));

String parameterToJson(List<parametriMotori> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class parametriMotori {
  parametriMotori({
    required this.gruppo,
    required this.listaMotori,
  });
  List<motore> listaMotori;
  String gruppo;

  factory parametriMotori.fromJson(Map<String, dynamic> json) =>
      parametriMotori(
        gruppo: json["gruppo"],
        listaMotori: List<motore>.from(
            json["listaMotori"].map((x) => motore.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "gruppo": gruppo,
        "listaMotori": List<dynamic>.from(listaMotori.map((x) => x.toJson())),
      };
}

class motore {
  motore({
    required this.nomeMotore,
    required this.parametri,
  });

  String nomeMotore;
  List<Parametro> parametri;

  factory motore.fromJson(Map<String, dynamic> json) => motore(
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
