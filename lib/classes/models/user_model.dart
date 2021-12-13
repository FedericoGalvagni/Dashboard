// To parse this JSON data, do
//

import 'package:meta/meta.dart';
import 'dart:convert';

late Utente utente;

Utente utenteFromJson(String str) => Utente.fromJson(json.decode(str));

String utenteToJson(Utente data) => json.encode(data.toJson());

class Utente {
  Utente({
    required this.permessi,
    required this.userName,
  });

  final String permessi;
  final String userName;

  factory Utente.fromJson(Map<String, dynamic> json) => Utente(
        permessi: json["permessi"],
        userName: json["userName"],
      );

  Map<String, dynamic> toJson() => {
        "permessi": permessi,
        "userName": userName,
      };
}
