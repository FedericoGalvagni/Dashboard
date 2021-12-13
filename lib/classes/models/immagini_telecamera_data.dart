import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:interface_example1/classes/models/global_variable.dart';
import 'package:interface_example1/classes/models/config_model.dart';
import 'package:interface_example1/classes/regexp.dart';

List<ImmaginiTelecamere> immaginiTelecamere = [];
List<String> percorsiEsistenti = [""];

class ImmaginiTelecamere {
  ImmaginiTelecamere({
    required this.percorso,
    required this.immagine,
    required this.nome,
    required this.timestamp,
    required this.daLeggere,
  });

  Image immagine;
  String nome;
  String timestamp;
  String percorso;
  bool daLeggere;
}

costruzioneModelloImmagini(List<Telecamere> telecamere) {
  immaginiTelecamere.clear();
  for (int i = 0; i < telecamere.length; i++) {
    immaginiTelecamere.add(ImmaginiTelecamere(
        daLeggere: true,
        percorso: config.percorsoPrincipale + telecamere[i].percorsoRelativo,
        nome: telecamere[i].nomeTelecamera,
        timestamp: "",
        immagine: Image.memory(base64Decode(""))));
  }
}

aggiornamentoImmagini(var response) {
  response = jsonDecode(response.toString());
  String percorsoFile = response["percorso"].toString();
  String timestamp = response["timestamp"].toString();
  String immagine = response["immagine"].toString();
  String nome = RegExpCustom.nomeFile(percorsoFile);
  String percorso = RegExpCustom.percorsoFile(percorsoFile);
  debugPrint("NOME: " + nome);

  int indice = _indicePercorso(percorso);
  if (indice != -1) {
    debugPrint("AGGIORNAMENTO: " + percorso);
    immaginiTelecamere[indice].immagine = Image.memory(base64Decode(immagine));
    immaginiTelecamere[indice].timestamp = timestamp;
    immaginiTelecamere[indice].daLeggere = true;
  } else {
    debugPrint("");
    debugPrint("Percorso invalido:" + percorso);
    debugPrint(
        "Verificare corrispendenze tra file di configurazione e cartelle immagini telecamere");
  }
  updateImmagini.value = !updateImmagini.value;
}

int _indicePercorso(String percorso) {
  debugPrint(percorso);
  for (var i = 0; i < immaginiTelecamere.length; i++) {
    if (immaginiTelecamere[i].percorso == percorso) {
      return i;
    }
  }
  return -1;
}
/*
costruzioneModelloImmagini(Telecamere telecamere) {
  response = jsonDecode(response.toString());
  String percorso = response["percorso"].toString();
  String timestamp = response["timestamp"].toString();
  String immagine = response["immagine"].toString();
  if (_presenzaPercorso(percorso)) {
    int indice = _indicePercorso(percorso);
    telecamere[indice] = Telecamera(
        immagine: Image.memory(base64Decode(immagine)),
        nome: "nome",);
  } else {
    telecamere.add(Telecamera(immagine: [
      Immagine(nome: "nome", immagine: Image.memory(base64Decode(immagine)))
    ], nome: "nome", percorso: percorso, timestamp: timestamp));
  }
}
*/

// la response dall'API contiene il nome della telecamera e il nome dell'
// immaggine splittate da il carattere "|" nella prima posizione si trova
// il nome della telecamera, nella seconda il nome della foto, e nella
// terza la stringa formattata base64 che rappresenta l'immagine stessa
/*
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
*/
/*
bool _presenzaPercorso(String percorso) {
  for (var item in telecamere) {
    if (item.nome == percorso) {
      return true;
    }
  }

  return false;
}
*/

/*
int _indiceDaAggiornare(String nomeImmagine, int index) {
  for (var i = 0; i < telecamere[index].immagine.length; i++) {
    if (telecamere[index].immagine[i].nome == nomeImmagine) {
      return i;
    }
  }
  return -1;
}
*/