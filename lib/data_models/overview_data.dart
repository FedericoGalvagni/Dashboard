import 'package:flutter/cupertino.dart';

final ValueNotifier<int> produzioneTotale = ValueNotifier<int>(0);
final ValueNotifier<int> produzioneUltime24h = ValueNotifier<int>(0);
final ValueNotifier<int> produzioneMediaGiornaliera = ValueNotifier<int>(0);
final ValueNotifier<int> produzioneMediaOraria = ValueNotifier<int>(0);
ValueNotifier<List<dynamic>> productionGraph = ValueNotifier<List<dynamic>>([]);