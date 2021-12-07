import 'package:flutter/material.dart';
import 'package:interface_example1/constants/controllers.dart';
import 'package:interface_example1/constants/style.dart';
import 'package:interface_example1/routing/routes.dart';
import 'package:interface_example1/widgets/custom/custom_container.dart';
import 'package:interface_example1/widgets/custom/custom_text.dart';
import 'package:interface_example1/widgets/spacer/auto_vertical_spacer.dart';
import 'package:photo_view/photo_view.dart';

class TelecamereImageView extends StatefulWidget {
  final Image image;
  const TelecamereImageView({Key? key, required this.image}) : super(key: key);

  @override
  _TelecamereImageViewState createState() => _TelecamereImageViewState();
}

class _TelecamereImageViewState extends State<TelecamereImageView> {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;

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
              navigationController.navigateTo(telecamerPageRoute);
            },
            child: Center(
              child: CustomText(text: "Go Back", color: surface(4)),
            ),
          ),
        ),
        const AutoVerticalSpacer(),
        const Container(
          width: 600,
          height: 600,
            child: PhotoView(
          imageProvider: AssetImage("assets/icons/0.png"),
        ))
      ],
    );
  }
}
