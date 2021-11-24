import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interface_example1/constants/controllers.dart';
import 'package:interface_example1/constants/style.dart';
import 'package:interface_example1/widgets/custom/custom_text.dart';

class HorizontalMenuItem extends StatelessWidget {
  final String itemName;
  final VoidCallback onTap;

  const HorizontalMenuItem(
      {Key? key, required this.itemName, required this.onTap})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: onTap,
      splashColor: Colors.red,
      onHover: (value) {
        value
            ? menuController.onHover(itemName)
            : menuController.onHover("not hovering");
      },
      // Obx: the value will change
      child: Obx(() => Container(
          color: menuController.isHovering(itemName)
              ? hovered(surface(4), primary)
              : surface(4),
          child: Row(
            children: [
              Visibility(
                visible: menuController.isHovering(itemName) ||
                    menuController.isActive(itemName),
                child: Container(width: 6, height: 40, color: primary),
                maintainSize: true,
                maintainState: true,
                maintainAnimation: true,
              ),
              SizedBox(
                width: _width / 80,
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: menuController.returnIconFor(itemName),
              ),
              if (!menuController.isActive(itemName))
                Flexible(
                    child: CustomText(
                        text: itemName,
                        color: menuController.isHovering(itemName)
                            ? onSurface
                            : getEmphasis(onSurface, emphasis.medium)))
              else
                Flexible(
                    child: CustomText(
                  text: itemName,
                  color: getEmphasis(onSurface, emphasis.high),
                  size: 18,
                  weight: FontWeight.bold,
                ))
            ],
          ))),
    );
  }
}

