import 'package:flutter/material.dart';
import 'package:interface_example1/classes/http/http_service.dart';

class TelecamereMedium extends StatelessWidget {
  const TelecamereMedium({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        HttpService(id: "immagini_telecamere",percorso: "/data",).get();
      },
      child: Container(
        height: 600,
        width: 600,
      ),
    );
  }
}
