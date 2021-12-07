import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:interface_example1/constants/controllers.dart';
import 'package:interface_example1/constants/style.dart';
import 'package:interface_example1/data_models/config.dart';
import 'package:interface_example1/data_models/immagini_telecamera_data.dart';
import 'package:interface_example1/pages/telecamere/widget/telecamere_imageview.dart';
import 'package:interface_example1/routing/routes.dart';
import 'package:interface_example1/widgets/custom/custom_container.dart';
import 'package:interface_example1/widgets/custom/custom_text.dart';
import 'package:interface_example1/widgets/spacer/auto_vertical_spacer.dart';

class TelecamereGalleria extends StatelessWidget {
  const TelecamereGalleria({Key? key, required this.itemPerRow})
      : super(key: key);
  final int itemPerRow;
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    if (indiceImmagini == -1) {
      return Column(
        children: [
          const AutoVerticalSpacer(),
          Container(
            height: 30,
            margin: EdgeInsets.only(left: _width / 64, right: _width / 64),
            child: CustomInkWell(
              style: ContainerStyle.primary,
              radius: 6,
              onTap: () {
                indiceTelecamere.value = -1;
                debugPrint("Indice telecamere " + indiceTelecamere.toString());
                navigationController.navigateTo(telecamerPageRoute);
              },
              child: Center(
                child: CustomText(text: "Go Back", color: surface(4)),
              ),
            ),
          ),
          const AutoVerticalSpacer(),
          ValueListenableBuilder(
              valueListenable: update,
              builder: (context, widget, value) {
                if (telecamere[indiceTelecamere.value].immagine.length > 1) {
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
                                children: getChildren(
                                    indiceTelecamere.value, _width)),
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
              }),
        ],
      );
    } else {
      return TelecamereImageView(
        image: telecamere[indiceTelecamere.value]
            .immagine[indiceImmagini]
            .immagine,
      );
    }
  }

  List<Widget> getChildren(int index, double _width) {
    List<Widget> children = [];
    for (var item in telecamere[index].immagine) {
      String nome = item.nome;
      children.add(AspectRatio(
          aspectRatio: 1,
          child: Container(
              width: _width / itemPerRow,
              color: surface(4),
              child: CustomInkWell(
                style: ContainerStyle.surface,
                radius: 0,
                onTap: () {
                  indiceImmagini = index;
                  navigationController.navigateTo(telecamerPageRoute);
                },
                child: Image(
                  image: item.immagine.image,
                  fit: BoxFit.cover,
                ),
              ))));
    }
    return children;
  }
}
