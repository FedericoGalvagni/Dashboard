import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:interface_example1/data_models/parameters_data.dart';

// TODO: TRADURRE IN ITALIANO
List<Gruppo> gruppi = [];
//Group groupFromJson(String str) => Group.fromJson(json.decode(str));
//String groupToJson(Group data) => json.encode(data.toJson());

/*
class Group {
  Group({
    required this.groups,
  });

  List<GroupElement> groups;

  factory Group.fromJson(Map<String, dynamic> json) => Group(
        groups: List<GroupElement>.from(
            json["Groups"].map((x) => GroupElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Groups": List<dynamic>.from(groups.map((x) => x.toJson())),
      };
}
*/
class Gruppo {
  Gruppo({
    required this.nome,
    required this.attuatori,
  });

  String nome;
  List<Attuatore> attuatori;

  factory Gruppo.fromJson(Map<String, dynamic> json) => Gruppo(
        nome: json["name"],
        attuatori: List<Attuatore>.from(
            json["actuators"].map((x) => Attuatore.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "name": nome,
        "actuators": List<dynamic>.from(attuatori.map((x) => x.toJson())),
      };
}

class Attuatore {
  Attuatore(
      {required this.nome,
      required this.tipo,
      required this.valore,
      required this.id,
      required this.limiteNegativo,
      required this.limitePositivo,
      required this.manualeAttivo});

  String nome;
  String tipo;
  String valore;
  String id;
  String limitePositivo;
  String limiteNegativo;
  ValueNotifier<bool> manualeAttivo;

  factory Attuatore.fromJson(Map<String, dynamic> json) => Attuatore(
      manualeAttivo: ValueNotifier<bool>(false),
      limiteNegativo: "",
      limitePositivo: "",
      nome: json["name"],
      tipo: json["type"],
      valore: json["value"],
      id: json["id"]);

  Map<String, dynamic> toJson() => {
        "name": nome,
        "type": tipo,
        "value": valore,
        "id": id,
      };
}

/// Inserimento dei dati dei motori contenuti nei parametri nel modello [Gruppo]che
/// li rappresenta.
///
costruzioneGruppi(List<ParametriAttuatori> parametri) {
  debugPrint("Inserimento dati motori nel modello");
  for (var gruppoItem in parametri) {
    List<Attuatore> motori = [];
    //debugPrint("Nuovo gruppo Item: " + gruppoItem.gruppo.toString());
    for (var motoreItem in gruppoItem.attuatori) {
      String limiteNegativo = "";
      String limitePositivo = "";
      //debugPrint("Nuovo motore Item: " + motoreItem.nomeMotore.toString());
      for (var parametriItem in motoreItem.parametri) {
        if (parametriItem.nomeParametro == "Limite Negativo") {
          limiteNegativo = parametriItem.valore;
        }
        if (parametriItem.nomeParametro == "Limite Positivo") {
          limitePositivo = parametriItem.valore;
        }
      }
      Attuatore motore = Attuatore(
          manualeAttivo: ValueNotifier<bool>(false),
          nome: motoreItem.nome,
          tipo: "motore",
          valore: "45",
          id: "id",
          limiteNegativo: limiteNegativo,
          limitePositivo: limitePositivo);
      motori.add(motore);
    }
    Gruppo gruppoMeccanico = Gruppo(nome: gruppoItem.gruppo, attuatori: motori);
    gruppi.add(gruppoMeccanico);
  }
  //debugPrint(gruppi[1].attuatori[0].nome.toString());
}

/// Disattiva l'abilitazione al comando manule di tutti gli attuatori, tranne
/// a quello che è stato attivato in modo da evitare conflitti
disattivazioneComandiManuali(int iGruppi, int iAttuatori) {
  for (var i = 0; i < gruppi.length; i++) {
    for (var j = 0; j < gruppi[i].attuatori.length; j++) {
      if (i == iGruppi && j == iAttuatori) {
        // Non faccio nulla in quanto si tratta dell'attuatore appena abilitato
        debugPrint("Abilitato");
      } else {
        // Disabilito in quanto non si tratta dell'attuatore appena abilitato
        gruppi[i].attuatori[j].manualeAttivo.value = false;
      }
    }
  }
}
