import 'package:interface_example1/classes/data_models/config_model.dart';
import 'package:interface_example1/classes/data_models/global_variable.dart';

const overviewPageRoute = "Overview";
const manualOperationsPageRoute = "Manual operation";
const statesPageRoute = "Machine state";
const settingsPageRoute = "Settings";
const authenticationPageRoute = "Authentication";
const parametersPageRoute = "Parameters";
const telecamerPageRoute = "Telecamere";

/// Lista che contiene gli elementi del menu laterale, l'ordine
/// nella seguente lista coincide con l'ordinamento sull'interfaccia
List sideMenuItems() {
  List items = [];
  switch (user) {
    case User.admin:
      if (config.admin.manuale.contains("r")) {
        items.add(manualOperationsPageRoute);
      }
      if (config.admin.tabelle.contains("r")) {
        items.add(statesPageRoute);
      }
      if (config.admin.parametri.contains("r")) {
        items.add(parametersPageRoute);
      }
      if (config.admin.telecamere.contains("r")) {
        items.add(telecamerPageRoute);
      }
      items.add(overviewPageRoute);
      items.add(settingsPageRoute);
      items.add(authenticationPageRoute);
      break;

    case User.operatore:
      if (config.operatore.manuale.contains("r")) {
        items.add(manualOperationsPageRoute);
      }
      if (config.operatore.tabelle.contains("r")) {
        items.add(statesPageRoute);
      }
      if (config.operatore.parametri.contains("r")) {
        items.add(parametersPageRoute);
      }
      if (config.operatore.telecamere.contains("r")) {
        items.add(telecamerPageRoute);
      }
      items.add(overviewPageRoute);
      items.add(settingsPageRoute);
      items.add(authenticationPageRoute);
      break;

    case User.base:
      if (config.base.manuale.contains("r")) {
        items.add(manualOperationsPageRoute);
      }
      if (config.base.tabelle.contains("r")) {
        items.add(statesPageRoute);
      }
      if (config.base.parametri.contains("r")) {
        items.add(parametersPageRoute);
      }
      if (config.base.telecamere.contains("r")) {
        items.add(telecamerPageRoute);
      }
      items.add(overviewPageRoute);
      items.add(settingsPageRoute);
      items.add(authenticationPageRoute);
      break;

    default:
      items.add(overviewPageRoute);
      items.add(settingsPageRoute);
      items.add(authenticationPageRoute);
  }
  return items;
}
