import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:interface_example1/pages/autenticazione/autenticazione.dart';
import 'package:interface_example1/pages/panoramica/panoramica.dart';
import 'package:interface_example1/pages/manual_operations/operazioni_manuali.dart';
import 'package:interface_example1/pages/impostazioni/impostazioni.dart';
import 'package:interface_example1/pages/parametri/parametri.dart';
import 'package:interface_example1/pages/tabelle/tabelle.dart';
import 'package:interface_example1/pages/telecamere/telecamere.dart';
import 'package:interface_example1/routing/routes.dart';

Route<dynamic> generateRoute(RouteSettings impostazioni) {
  switch (impostazioni.name) {
    case panoramicaPageRoute:
      return _getPageRoute(const PanoramicaPage());

    case operazioniManualiPageRoute:
      return _getPageRoute(const OperazioniManualiPage());

    case statesPageRoute:
      return _getPageRoute(const TabellePage());

    case parametriPageRoute:
      return _getPageRoute(const ParametriPage());

    case impostazioniPageRoute:
      return _getPageRoute(const ImpostazioniPage());

    case authenticationPageRoute:
      return _getPageRoute(const AutenticazionePagina());

    case telecamerPageRoute:
      return _getPageRoute(const TelecamerPage());

    default:
      return _getPageRoute(const AutenticazionePagina());
  }
}

PageRoute _getPageRoute(Widget child) {
  return MaterialPageRoute(builder: (context) => child);
}
