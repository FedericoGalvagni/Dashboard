import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

final nodeUrl = Uri.parse('http://192.168.120.201:1880/prova');
ValueNotifier<bool> showTableIndicator = ValueNotifier<bool>(false);
int mechanicalGroupSelector = -1;
String expandedNode = "-1.-1.-1";
String? selectedNode;
int indiceGruppi = -1;
int indiceAttuatori = -1;
ValueNotifier<bool> updateShadow = ValueNotifier<bool>(false);
ValueNotifier<Image> image =
    ValueNotifier<Image>(Image.asset("assets/icons/1.png"));
