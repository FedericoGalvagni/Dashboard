import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interface_example1/constants/style.dart';
import 'package:interface_example1/helpers/responsivness.dart';
import 'package:interface_example1/widgets/custom_text.dart';
import 'package:interface_example1/widgets/menu_controller.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Obx(() => Row(
              children: [
                Container(
                    margin: EdgeInsets.only(
                        top: ResponsiveWidget.isSmallScreen(context) ? 56 : 6),
                    child: CustomText(
                      color: highEmphasis(textOnSurface),
                      text: MenuController.instance.activeItem.value,
                      size: 24,
                      weight: FontWeight.bold,
                    ))
              ],
            ))
      ],
    );
  }
}
