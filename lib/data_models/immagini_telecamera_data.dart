import 'dart:convert';

import 'package:flutter/cupertino.dart';

List<Telecamera> telecamere = [
  Telecamera(nome: "default", immagine: [
    Immagine(nome: "nome", immagine: Image.memory(base64Decode("")))
  ])
];
List<String> percorsiEsistenti = [""];

class Telecamera {
  Telecamera({required this.immagine, required this.nome});

  List<Immagine> immagine;
  String nome;
}

class Immagine {
  Immagine({required this.nome, required this.immagine});

  String nome;
  Image immagine;
}
// la response dall'API contiene il nome della telecamera e il nome dell'
// immaggine splittate da il carattere "|" nella prima posizione si trova
// il nome della telecamera, nella seconda il nome della foto, e nella
// terza la stringa formattata base64 che rappresenta l'immagine stessa

aggiungiImmagine(String response) {
  var splittedResponse = response.split("|");
  String percorso = splittedResponse[0];
  String nome = splittedResponse[1];
  String data = splittedResponse[2];
  int indicePercorso = _indicePercorso(percorso);
  if (_presenzaPercorso(percorso)) {
    int indiceImmaggine = _indiceDaAggiornare(nome, indicePercorso);
    if (indiceImmaggine == -1) {
      telecamere[indicePercorso].immagine.add(
          Immagine(nome: nome, immagine: Image.memory(base64Decode(data))));
      debugPrint("Aggiunta nuova immagine");
    } else {
      telecamere[indicePercorso].immagine[indiceImmaggine].immagine ==
          Image.memory(base64Decode(data));
      debugPrint("Aggiornamento immagine già presente");
    }
  } else {
    telecamere.add(Telecamera(immagine: [
      Immagine(nome: nome, immagine: Image.memory(base64Decode(data)))
    ], nome: percorso));
    debugPrint("Aggiunta nuova immagine in nuovo percorso");
  }
}

bool _presenzaPercorso(String percorso) {
  for (var item in telecamere) {
    if (item.nome == percorso) {
      return true;
    }
  }

  return false;
}

int _indicePercorso(String percorso) {
  for (var i = 0; i < telecamere.length; i++) {
    if (telecamere[i].nome == percorso) {
      return i;
    }
  }
  return telecamere.length;
}

int _indiceDaAggiornare(String nomeImmagine, int index) {
  for (var i = 0; i < telecamere[index].immagine.length; i++) {
    if (telecamere[index].immagine[i].nome == nomeImmagine) {
      return i;
    }
  }
  return -1;
}
