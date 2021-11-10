// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interface_example1/helpers/responsivness.dart';
import 'package:interface_example1/widgets/custom_text.dart';
import 'package:interface_example1/widgets/menu_controller.dart';

class AuthenticationPage extends StatelessWidget {
  const AuthenticationPage({Key? key}) : super(key: key);

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
