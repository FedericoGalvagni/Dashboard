import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interface_example1/constants/controllers.dart';
import 'package:interface_example1/constants/style.dart';

import 'custom/custom_text.dart';

class VerticalMenuItem extends StatelessWidget {
  const VerticalMenuItem(
      {Key? key, required this.itemName, required this.onTap})
      : super(key: key);
  final String itemName;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        onHover: (value) {
          value
              ? menuController.onHover(itemName)
              : menuController.onHover("not hovering");
        },
        child: Obx(() => Container(
            color: menuController.isHovering(itemName)
                ? surface(4)
                : Colors.transparent,
            child: Row(children: [
              Visibility(
                visible: menuController.isHovering(itemName) ||
                    menuController.isActive(itemName),
                child: Container(width: 6, height: 40, color: textOnSurface),
                maintainSize: true,
                maintainState: true,
                maintainAnimation: true,
              ),
              Expanded(
                  child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: menuController.returnIconFor(itemName),
                  ),
                  if (!menuController.isActive(itemName))
                    Flexible(
                        child: CustomText(
                      text: itemName,
                      color: menuController.isHovering(itemName)
                          ? textOnSurface
                          : surface(4),
                    ))
                  else
                    Flexible(
                        child: CustomText(
                      text: itemName,
                      color: getEmphasis(textOnSurface, emphasis.high),
                      size: 18,
                      weight: FontWeight.bold,
                    ))
                ],
              ))
            ]))));
  }
}
