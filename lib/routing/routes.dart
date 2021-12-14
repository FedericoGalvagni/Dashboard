import 'package:interface_example1/classes/modelli/config_modello.dart';
import 'package:interface_example1/classes/modelli/variabili_globali.dart';

const panoramicaPageRoute = "Panoramica";
const operazioniManualiPageRoute = "Manual operation";
const statesPageRoute = "Machine state";
const impostazioniPageRoute = "Impostazioni";
const authenticationPageRoute = "Authentication";
const parametriPageRoute = "Parametri";
const telecamerPageRoute = "Telecamere";

/// Lista che contiene gli elementi del menu laterale, l'ordine
/// nella seguente lista coincide con l'ordinamento sull'interfaccia
List sideMenuItems() {
  List items = [];
  if (logined.value) {
    switch (user) {
      case User.admin:
        items.add(panoramicaPageRoute);
        if (config.admin.manuale.contains("r")) {
          items.add(operazioniManualiPageRoute);
        }
        if (config.admin.tabelle.contains("r")) {
          items.add(statesPageRoute);
        }
        if (config.admin.parametri.contains("r")) {
          items.add(parametriPageRoute);
        }
        if (config.admin.telecamere.contains("r")) {
          items.add(telecamerPageRoute);
        }

        items.add(impostazioniPageRoute);
        items.add(authenticationPageRoute);
        break;

      case User.operatore:
        items.add(panoramicaPageRoute);
        if (config.operatore.manuale.contains("r")) {
          items.add(operazioniManualiPageRoute);
        }
        if (config.operatore.tabelle.contains("r")) {
          items.add(statesPageRoute);
        }
        if (config.operatore.parametri.contains("r")) {
          items.add(parametriPageRoute);
        }
        if (config.operatore.telecamere.contains("r")) {
          items.add(telecamerPageRoute);
        }

        items.add(impostazioniPageRoute);
        items.add(authenticationPageRoute);
        break;

      case User.base:
        items.add(panoramicaPageRoute);
        if (config.base.manuale.contains("r")) {
          items.add(operazioniManualiPageRoute);
        }
        if (config.base.tabelle.contains("r")) {
          items.add(statesPageRoute);
        }
        if (config.base.parametri.contains("r")) {
          items.add(parametriPageRoute);
        }
        if (config.base.telecamere.contains("r")) {
          items.add(telecamerPageRoute);
        }

        items.add(impostazioniPageRoute);
        items.add(authenticationPageRoute);
        break;

      case User.developer:
        items.add(panoramicaPageRoute);
        items.add(operazioniManualiPageRoute);
        items.add(statesPageRoute);
        items.add(parametriPageRoute);
        items.add(telecamerPageRoute);
        items.add(impostazioniPageRoute);
        items.add(authenticationPageRoute);
        break;
      case User.notLogined:
        items.add(authenticationPageRoute);
    }
  } else {
    items.add(authenticationPageRoute);
  }
  return items;
}
