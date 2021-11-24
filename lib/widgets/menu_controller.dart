import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interface_example1/constants/style.dart';
import 'package:interface_example1/routing/routes.dart';

class MenuController extends GetxController {
  static MenuController instance = Get.find();
  var activeItem = overviewPageRoute.obs;
  var hoverItem = "".obs;
  changeActiveItemTo(String itemName) {
    activeItem.value = itemName;
  }

  onHover(String itemName) {
    if (!isActive(itemName)) hoverItem.value = itemName;
  }

  isActive(String itemName) => activeItem.value == itemName;

  isHovering(String itemName) => hoverItem.value == itemName;

  Widget returnIconFor(String itemName) {
    switch (itemName) {
      case overviewPageRoute:
        return _customIcon(Icons.trending_up, itemName);

      case manualOperationsPageRoute:
        return _customIcon(Icons.pan_tool, itemName);

      case statesPageRoute:
        return _customIcon(Icons.traffic, itemName);

      case settingsPageRoute:
        return _customIcon(Icons.construction, itemName);

      case authenticationPageRoute:
        return _customIcon(Icons.person, itemName);

      case parametersPageRoute:
        return _customIcon(Icons.list_alt, itemName);

      default:
        return _customIcon(Icons.exit_to_app, itemName);
    }
  }

  Widget _customIcon(IconData icon, String itemName) {
    if (isActive(itemName)) {
      return Icon(
        icon,
        size: 22,
        color: getEmphasis(onSurface, emphasis.high),
      );
    }

    return Icon(
      icon,
      color: isHovering(itemName)
          ? getEmphasis(onSurface, emphasis.medium)
          : getEmphasis(onSurface, emphasis.high),
    );
  }
}
