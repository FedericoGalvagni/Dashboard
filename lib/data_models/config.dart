import 'dart:convert';

import 'package:flutter/cupertino.dart';

var nodeUrl = Uri.parse('http://192.168.2.184:1880/prova');
var showTableIndicator = false;
int mechanicalGroupSelector = -1;
ValueNotifier<List<dynamic>> row = ValueNotifier<List<dynamic>>([]);
