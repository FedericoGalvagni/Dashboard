import 'package:flutter/material.dart';
import 'package:interface_example1/classes/regexp.dart';
import 'package:interface_example1/constants/controllers.dart';
import 'package:interface_example1/constants/style.dart';
import 'package:interface_example1/data_models/config.dart';
import 'package:interface_example1/data_models/immagini_telecamera_data.dart';
import 'package:interface_example1/helpers/local_navigator.dart';
import 'package:interface_example1/routing/routes.dart';
import 'package:interface_example1/widgets/custom/custom_container.dart';
import 'package:interface_example1/widgets/custom/custom_text.dart';
import 'package:interface_example1/widgets/spacer/auto_vertical_spacer.dart';

class TelecamereMenu extends StatelessWidget {
  TelecamereMenu({Key? key, required this.itemPerRow}) : super(key: key);
  int itemPerRow;

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return ValueListenableBuilder(
        valueListenable: update,
        builder: (context, widget, value) {
          if (telecamere.length > 1) {
            return SizedBox(
                height: 1000,
                child: CustomScrollView(
                  primary: false,
                  slivers: <Widget>[
                    SliverPadding(
                      padding: const EdgeInsets.all(20),
                      sliver: SliverGrid.count(
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          crossAxisCount: 6,
                          children: getChildren(1, _width)),
                    ),
                  ],
                ));
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
        });
  }

  List<Widget> getChildren(int index, double _width) {
    List<Widget> children = [];
    for (int i = 0; i < telecamere.length; i++) {
      String nome = telecamere[i].nome;
      children.add(AspectRatio(
          aspectRatio: 1,
          child: CustomInkWell(
              child: Center(
                child: CustomText(
                    color: getEmphasis(onSurface, emphasis.high),
                    text: lastMatch(telecamere[i].nome, r'([^\\]*)$')),
              ),
              style: ContainerStyle.surface,
              onTap: () {
                indiceTelecamere.value = i;
                debugPrint("Indice telecamere " + i.toString());
                navigationController.navigateTo(telecamerPageRoute);
              },
              radius: 10)));
    }
    return children;
  }
}
