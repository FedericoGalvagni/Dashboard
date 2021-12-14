import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:flutter/widgets.dart' show WidgetsFlutterBinding;

late Config config;
String jsonString = "";

Config configFromJson(String str) => Config.fromJson(json.decode(str));

String configToJson(Config data) => json.encode(data.toJson());

class Config {
  Config({
    required this.percorsoPrincipale,
    required this.percorsoUtenti,
    required this.database,
    required this.nomeMacchina,
    required this.telecamere,
    required this.operatore,
    required this.admin,
    required this.base,
  });

  final String percorsoPrincipale;
  final String percorsoUtenti;
  final Database database;
  final String nomeMacchina;
  final List<Telecamere> telecamere;
  final Admin operatore;
  final Admin admin;
  final Admin base;

  factory Config.fromJson(Map<String, dynamic> json) => Config(
        percorsoPrincipale: json["percorso_principale"],
        percorsoUtenti: json["percorso_utenti"],
        database: Database.fromJson(json["database"]),
        nomeMacchina: json["nome_macchina"],
        telecamere: List<Telecamere>.from(
            json["telecamere"].map((x) => Telecamere.fromJson(x))),
        operatore: Admin.fromJson(json["operatore"]),
        admin: Admin.fromJson(json["admin"]),
        base: Admin.fromJson(json["base"]),
      );

  Map<String, dynamic> toJson() => {
        "percorso_principale": percorsoPrincipale,
        "percorso_utenti": percorsoUtenti,
        "database": database.toJson(),
        "nome_macchina": nomeMacchina,
        "telecamere": List<dynamic>.from(telecamere.map((x) => x.toJson())),
        "operatore": operatore.toJson(),
        "admin": admin.toJson(),
        "base": base.toJson(),
      };
}

class Admin {
  Admin({
    required this.panoramica,
    required this.manuale,
    required this.parametri,
    required this.tabelle,
    required this.telecamere,
  });

  final String panoramica;
  final String manuale;
  final String parametri;
  final String tabelle;
  final String telecamere;

  factory Admin.fromJson(Map<String, dynamic> json) => Admin(
        panoramica: json["panoramica"],
        manuale: json["manuale"],
        parametri: json["parametri"],
        tabelle: json["tabelle"],
        telecamere: json["telecamere"],
      );

  Map<String, dynamic> toJson() => {
        "panoramica": panoramica,
        "manuale": manuale,
        "parametri": parametri,
        "tabelle": tabelle,
        "telecamere": telecamere,
      };
}

class Database {
  Database({
    required this.nomeDb,
    required this.produzione,
  });

  final String nomeDb;
  final String produzione;

  factory Database.fromJson(Map<String, dynamic> json) => Database(
        nomeDb: json["nomeDB"],
        produzione: json["produzione"],
      );

  Map<String, dynamic> toJson() => {
        "nomeDB": nomeDb,
        "produzione": produzione,
      };
}

class Telecamere {
  Telecamere({
    required this.nomeTelecamera,
    required this.percorsoRelativo,
  });

  final String nomeTelecamera;
  final String percorsoRelativo;

  factory Telecamere.fromJson(Map<String, dynamic> json) => Telecamere(
        nomeTelecamera: json["nome_telecamera"],
        percorsoRelativo: json["percorso_relativo"],
      );

  Map<String, dynamic> toJson() => {
        "nome_telecamera": nomeTelecamera,
        "percorso_relativo": percorsoRelativo,
      };
}

loadConfigurazione() async {
  WidgetsFlutterBinding.ensureInitialized();
  String response = await rootBundle.loadString('assets/config.json');
  config = configFromJson(response);
}
