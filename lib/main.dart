import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:interface_example1/constants/style.dart';
import 'package:interface_example1/controllers/navigation_controller.dart';
import 'package:interface_example1/layout.dart';
import 'package:interface_example1/widgets/menu_controller.dart';
import 'classes/data_models/config_model.dart';
import 'classes/data_models/immagini_telecamera_data.dart';
import 'classes/http/http_service.dart';


Future<void> main() async {
  await loadConfig();
  themeSelection(false);
  Get.put(MenuController());
  Get.put(NavigationController());
  runApp(const MyApp());
  const oneSec = Duration(seconds: 3);
  Timer.periodic(oneSec, (Timer t) => updateData());
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
      home: SiteLayout(),
    );
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      HttpService(id: "parametri").get();
      HttpService(id: "produzione", limit: "100").get();
      HttpService(id: "graficoProduzione", limit: "100").get();
      costruzioneModelloImmagini(config.telecamere);

      for (var item in immaginiTelecamere) {
        HttpService(id: "immagini_telecamere", parametriHeaders: {
          "percorso": item.percorso.toString(),
          "timestamp": item.timestamp
        }).get();
      }
    });
  }
}
