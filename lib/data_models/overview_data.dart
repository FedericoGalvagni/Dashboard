import 'package:flutter/cupertino.dart';

final ValueNotifier<int> produzioneTotale = ValueNotifier<int>(0);
final ValueNotifier<int> produzioneUltime24h = ValueNotifier<int>(0);
final ValueNotifier<int> produzioneMediaGiornaliera = ValueNotifier<int>(0);
final ValueNotifier<int> produzioneMediaOraria = ValueNotifier<int>(0);
ValueNotifier<List<dynamic>> productionGraph = ValueNotifier<List<dynamic>>([]);

assegnaProduzione() {
  /// produzioneTotale.value è uguale all'ultimo valore della lista
  /// [productionGraph]
  produzioneTotale.value = productionGraph.value.last["pezzi"];

  // produzioneUltime24h è uguale all'ultimo valore della lista
  // productionGraph - il penultimo elemento
  produzioneUltime24h.value = productionGraph.value.last["pezzi"] -
      productionGraph.value[productionGraph.value.length - 2]["pezzi"];

  // produzioneMediaGiornaliera è uguale alla somma della produzione di
  // ogni singolo giorno diviso il numero totale di giorni

  produzioneMediaGiornaliera.value =
      (productionGraph.value.last["pezzi"] / productionGraph.value.length)
          .round();

  // produzioneMediaOraria è uguale a produzioneMediaGiornaliera/24
  produzioneMediaOraria.value = (produzioneMediaGiornaliera.value / 24).round();
}
