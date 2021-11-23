import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:interface_example1/constants/style.dart';
import 'package:interface_example1/controllers/navigation_controller.dart';
import 'package:interface_example1/layout.dart';
import 'package:interface_example1/widgets/menu_controller.dart';
import 'classes/http/http_service.dart';

void main() {
  Get.put(MenuController());
  Get.put(NavigationController());
  runApp(const MyApp());
  CustomColor().assignColor(true);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HttpService(id: "graficoProduzione", limit: "100").get();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Industrial Dashboard",
      theme: ThemeData(
          scaffoldBackgroundColor: background,
          textTheme: GoogleFonts.mulishTextTheme(Theme.of(context).textTheme)
              .apply(bodyColor: textOnSurface),
          pageTransitionsTheme: const PageTransitionsTheme(builders: {
            TargetPlatform.iOS: ZoomPageTransitionsBuilder(),
            TargetPlatform.android: ZoomPageTransitionsBuilder(),
          }),
          primaryColor: primary),
      home: SiteLayout(),
    );
  }
}
