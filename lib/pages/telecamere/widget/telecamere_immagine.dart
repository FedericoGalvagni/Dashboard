import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:interface_example1/classes/modelli/variabili_globali.dart';
import 'package:interface_example1/classes/modelli/immagini_telecamera_modello.dart';
import 'package:interface_example1/constants/controllers.dart';
import 'package:interface_example1/constants/style.dart';
import 'package:interface_example1/helpers/responsivness.dart';
import 'package:interface_example1/routing/routes.dart';
import 'package:interface_example1/widgets/custom/custom_container.dart';
import 'package:interface_example1/widgets/custom/custom_text.dart';
import 'package:interface_example1/widgets/spacer/auto_horizontal_spacer.dart';
import 'package:interface_example1/widgets/spacer/auto_vertical_spacer.dart';

class TelecamereImmagine extends StatelessWidget {
  const TelecamereImmagine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        const AutoVerticalSpacer(),
        Container(
          height: 30,
          margin: EdgeInsets.only(left: _width / 64, right: _width / 64),
          child: CustomInkWell(
            elevation: 4,
            style: ContainerStyle.primary,
            radius: 6,
            onTap: () {
              indiceTelecamere.value = -1;
              navigationController.navigateTo(telecamerPageRoute);
            },
            child: Center(
              child: CustomText(text: "Go Back", color: surface(4)),
            ),
          ),
        ),
        const AutoVerticalSpacer(),
        const AutoHorizontalSpacer(),
        Center(
          child: Image(
            width: ResponsiveWidget.isSmallScreen(context)
                ? _width - _width / 32
                : (_width / 6 * 5) - _width / 32,
            image: immaginiTelecamere[indiceTelecamere.value].immagine.image,
            fit: BoxFit.contain,
          ),
        ),
        const AutoHorizontalSpacer(),
      ],
    );
  }
}
