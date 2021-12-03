import 'dart:async';

import 'package:flutter/material.dart';
import 'package:interface_example1/classes/http/http_service.dart';
import 'package:interface_example1/helpers/responsivness.dart';
import 'package:interface_example1/pages/telecamere/widget/telecamere_large.dart';
import 'package:interface_example1/pages/telecamere/widget/telecamere_medium.dart';
import 'package:interface_example1/pages/telecamere/widget/telecamere_small.dart';

class TelecamerPage extends StatefulWidget {
  const TelecamerPage({Key? key}) : super(key: key);

  @override
  State<TelecamerPage> createState() => _TelecamerPageState();
}

class _TelecamerPageState extends State<TelecamerPage> {


  @override
  Widget build(BuildContext context) {
    HttpService(id: "immagini_telecamere").get();
    return Column(
      children: [
        /*Center(
          child: Container(
            height: 30,
            width: 200,
            color:  Colors.red,
            child: CustomText(
              text: title,
              align: TextAlign.center,
              size: 24,
              weight: FontWeight.bold,
              color: primary,
            ),
          ),
        ),*/
        Expanded(
            child: ListView(
          children: [
            if (ResponsiveWidget.isLargeScreen(context) ||
                ResponsiveWidget.isMediumScreen(context))
              if (ResponsiveWidget.isCustomSize(context))
                const TelecamereMedium()
              else
                const TelecamereLarge()
            else
              const TelecamereSmall()
          ],
        ))
      ],
    );
  }
}
