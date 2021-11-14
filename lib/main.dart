import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:interface_example1/controllers/navigation_controller.dart';
import 'package:interface_example1/layout.dart';
import 'package:interface_example1/routing/routes.dart';
import 'package:interface_example1/widgets/menu_controller.dart';

import 'classes/http/http_service.dart';

void main() {
  Get.put(MenuController());
  Get.put(NavigationController());
  runApp(const MyApp());
  const oneSec = Duration(seconds: 1);

  Timer.periodic(oneSec, (Timer timer) {
    String activePage = MenuController.instance.activeItem();
    switch (activePage) {
      case overviewPageRoute:
        //print("init");
        HttpService.get("overview");
        break;
      case manualOperationsPageRoute:
        //HttpService.get("manualOperation");
        //print("manualOperation");
        break;
      default:
    }
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Industrial Dashboard",
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.white60,
          textTheme: GoogleFonts.mulishTextTheme(Theme.of(context).textTheme)
              .apply(bodyColor: Colors.black),
          pageTransitionsTheme: const PageTransitionsTheme(builders: {
            TargetPlatform.iOS: ZoomPageTransitionsBuilder(),
            TargetPlatform.android: ZoomPageTransitionsBuilder(),
          }),
          primaryColor: Colors.blue),
      home: SiteLayout(),
    );
  }
}
