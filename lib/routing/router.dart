import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:interface_example1/pages/Parameters/parameters.dart';
import 'package:interface_example1/pages/authentication/authentication.dart';
import 'package:interface_example1/pages/overview/overview.dart';
import 'package:interface_example1/pages/manual_operations/manual_operations.dart';
import 'package:interface_example1/pages/settings/settings.dart';
import 'package:interface_example1/pages/states/states.dart';
import 'package:interface_example1/routing/routes.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case overviewPageRoute:
      return _getPageRoute(const OverviewPage());

    case manualOperationsPageRoute:
      return _getPageRoute(const ManualOperationsPage());

    case statesPageRoute:
      return _getPageRoute(const StatesPage());

    case parametersPageRoute:
      return _getPageRoute(const ParametersPage());

    case settingsPageRoute:
      return _getPageRoute(const SettingsPage());

    case authenticationPageRoute:
      return _getPageRoute(const AuthenticationPage());

    default:
      return _getPageRoute(const OverviewPage());
  }
}

PageRoute _getPageRoute(Widget child) {
  return MaterialPageRoute(builder: (context) => child);
}
