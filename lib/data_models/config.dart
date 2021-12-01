import 'package:flutter/foundation.dart';

final nodeUrl = Uri.parse('http://192.168.2.184:1880/prova');
ValueNotifier<bool> showTableIndicator = ValueNotifier<bool>(false);
int mechanicalGroupSelector = -1;
String expandedNode = "-1.-1.-1";
String? selectedNode;
int indiceGruppi = -1;
int indiceAttuatori = -1;

