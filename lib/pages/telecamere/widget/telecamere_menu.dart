import 'package:flutter/material.dart';
import 'package:interface_example1/constants/controllers.dart';
import 'package:interface_example1/constants/spacer.dart';
import 'package:interface_example1/constants/style.dart';
import 'package:interface_example1/classes/modelli/variabili_globali.dart';
import 'package:interface_example1/classes/modelli/immagini_telecamera_modello.dart';
import 'package:interface_example1/helpers/responsivness.dart';
import 'package:interface_example1/routing/routes.dart';
import 'package:interface_example1/widgets/custom/breathing_container.dart';
import 'package:interface_example1/widgets/custom/custom_container.dart';
import 'package:interface_example1/widgets/custom/custom_text.dart';

// ignore: must_be_immutable
class TelecamereMenu extends StatelessWidget {
  TelecamereMenu({Key? key, required this.itemPerRow}) : super(key: key);
  int itemPerRow;

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    if (immaginiTelecamere.length > 1) {
      return ValueListenableBuilder(
          valueListenable: updateImmagini,
          builder: (context, widget, value) {
            return SizedBox(
                height: 1000,
                child: CustomScrollView(
                  primary: false,
                  slivers: <Widget>[
                    SliverPadding(
                      padding: const EdgeInsets.all(20),
                      sliver: SliverGrid.count(
                          crossAxisSpacing:
                              ResponsiveWidget.isLargeScreen(context)
                                  ? _width / SpacerC.largeRateo
                                  : _width / SpacerC.mediumRateo,
                          mainAxisSpacing:
                              ResponsiveWidget.isLargeScreen(context)
                                  ? _width / SpacerC.largeRateo
                                  : _width / SpacerC.mediumRateo,
                          crossAxisCount: itemPerRow,
                          children: getChildren(1, _width,
                              ResponsiveWidget.isLargeScreen(context))),
                    ),
                  ],
                ));
          });
    } else {
      return Center(
          child: CustomText(
        color: getEmphasis(
          onBackground,
          emphasis.high,
        ),
        text: "Nessuna immagine trovata!",
      ));
    }
  }

  List<Widget> getChildren(int index, double _width, bool large) {
    List<Widget> children = [];
    for (int i = 0; i < immaginiTelecamere.length; i++) {
      String _nome = immaginiTelecamere[i].nome;
      Image _immagine = immaginiTelecamere[i].immagine;
      bool _daLeggere = immaginiTelecamere[i].daLeggere;

      children.add(Stack(
        children: [
          AspectRatio(
            aspectRatio: 1,
            child: BreathingGlowingWidget(
              duration: const Duration(milliseconds: 800),
              glowColor: primary,
              child: Container(),
              glow: _daLeggere,
              offset: 2.5,
              startOffset: 2,
            ),
          ),
          AspectRatio(
              aspectRatio: 1,
              child: CustomInkWell(
                elevation: 4,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: large ? 50 : 40,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                          ),
                          color: surface(16),
                        ),
                        child: Stack(
                          children: [
                            Center(
                              child: CustomText(
                                  text: _nome,
                                  size: large ? 40 : 30,
                                  weight: FontWeight.w400,
                                  color: getEmphasis(
                                    onSurface,
                                    emphasis.high,
                                  )),
                            ),
                          ],
                        ),
                      ),
                      Expanded(child: Container()),
                      Container(
                          margin: EdgeInsets.all(large
                              ? _width / SpacerC.largeRateo
                              : _width / SpacerC.mediumRateo),
                          child: Image(
                            image: _immagine.image,
                            fit: BoxFit.contain,
                          )),
                      Expanded(child: Container()),
                    ],
                  ),
                  style: ContainerStyle.surface,
                  onTap: () {
                    indiceTelecamere.value = i;
                    immaginiTelecamere[i].daLeggere = false;
                    debugPrint("Indice telecamere " + i.toString());
                    navigationController.navigateTo(telecamerPageRoute);
                  },
                  radius: 10))
        ],
      ));
    }
    return children;
  }
}
