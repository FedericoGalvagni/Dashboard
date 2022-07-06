import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:interface_example1/classes/modelli/variabili_globali.dart';
import 'package:interface_example1/constants/style.dart';
import 'package:interface_example1/controllers/navigation_controller.dart';
import 'package:interface_example1/layout.dart';
import 'package:interface_example1/pages/autenticazione/autenticazione.dart';
import 'classes/modelli/config_modello.dart';
import 'classes/http/http_service.dart';
import 'widgets/menu_controller.dart';

void main() async {
  await loadConfigurazione();
  themeSelection(false);
  Get.put(MenuController());
  Get.put(NavigationController());
  runApp(const MyApp());
  const oneSec = Duration(seconds: 3);
  Timer.periodic(oneSec, (Timer t) => updateData());
  //TODO CLEAN
  HttpService(
      id: "login",
      percorso: "/bo",
      parametriHeaders: {"nome": "admin", "password": "password"}).get();
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Industrial Dashboard",
        theme: ThemeData(
            scaffoldBackgroundColor: background,
            textTheme: GoogleFonts.mulishTextTheme(Theme.of(context).textTheme)
                .apply(bodyColor: onSurface),
            pageTransitionsTheme: const PageTransitionsTheme(builders: {
              TargetPlatform.iOS: ZoomPageTransitionsBuilder(),
              TargetPlatform.android: ZoomPageTransitionsBuilder(),
            }),
            primaryColor: primary),
        home: ValueListenableBuilder(
            valueListenable: logined,
            builder: (context, value, widget) {
              return logined.value
                  ? SiteLayout()
                  : const AutenticazionePagina();
            }));
  }
}
