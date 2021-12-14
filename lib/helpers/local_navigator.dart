import 'package:flutter/material.dart';
import 'package:interface_example1/constants/controllers.dart';
import 'package:interface_example1/routing/router.dart';
import 'package:interface_example1/routing/routes.dart';

Navigator localNavigator() => Navigator(
      key: navigationController.navigationKey,
      initialRoute: panoramicaPageRoute,
      onGenerateRoute: generateRoute,
    );
