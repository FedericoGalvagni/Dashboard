import 'package:flutter/cupertino.dart';

ValueNotifier<List<dynamic>> row = ValueNotifier<List<dynamic>>([]);
ValueNotifier<int> rowLenght = ValueNotifier<int>(row.value.length);
