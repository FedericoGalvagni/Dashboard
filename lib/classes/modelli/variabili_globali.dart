import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

const String nodeUrl = 'http://192.168.50.25:1881';
ValueNotifier<bool> showTableIndicator = ValueNotifier<bool>(false);
int mechanicalGroupSelector = -1;
String expandedNode = "-1.-1.-1";
int indiceGruppi = -1;
int indiceAttuatori = -1;
ValueNotifier<bool> updateShadow = ValueNotifier<bool>(false);
bool firstImageGet = true;
ValueNotifier<int> indiceTelecamere = ValueNotifier<int>(-1);
int indiceImmagini = -1;
ValueNotifier<bool> updateImmagini = ValueNotifier<bool>(true);
User user = User.base;
enum User { admin, base, operatore, developer, notLogined }
ValueNotifier<bool> logined = ValueNotifier<bool>(false);
ValueNotifier<bool> loginFailed = ValueNotifier<bool>(false);
ValueNotifier<bool> updateParameterTree = ValueNotifier<bool>(false);
