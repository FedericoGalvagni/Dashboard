import 'package:flutter/material.dart';
import 'package:interface_example1/constants/style.dart';
import 'package:interface_example1/widgets/custom/custom_text.dart';

// ignore: must_be_immutable
class StaticButton extends StatefulWidget {
  final double width;
  final double height;
  final String activeText;
  final String disabledText;
  Function onTap;
  bool active;

  StaticButton({
    Key? key,
    required this.width,
    required this.onTap,
    required this.height,
    required this.active,
    required this.activeText,
    required this.disabledText,
  }) : super(key: key);

  @override
  _StaticButtonState createState() => _StaticButtonState();
}

class _StaticButtonState extends State<StaticButton> {
  @override
  Widget build(BuildContext context) {
    if (widget.active) {
      return Container(
        height: widget.height,
        width: widget.width,
        decoration: BoxDecoration(
            color: PrimaryContainers().container,
            border: Border.all(color: primary),
            borderRadius: BorderRadius.circular(5),
            boxShadow: boxShadow),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            hoverColor: PrimaryContainers().hovered(),
            splashColor: PrimaryContainers().pressed(),
            onTap: () {
              widget.active = false;
              setState(() {});
            },
            child: Center(
              child: CustomText(
                  text: widget.activeText, color: PrimaryContainers().content),
            ),
          ),
        ),
      );
    } else {
      return Container(
        height: widget.height,
        width: widget.width,
        decoration: BoxDecoration(
            color: PrimaryTrContainers().container,
            border: Border.all(color: primary),
            borderRadius: BorderRadius.circular(5),
            boxShadow: boxShadow),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            hoverColor: PrimaryTrContainers().hovered(),
            splashColor: PrimaryTrContainers().pressed(),
            highlightColor: primary.withOpacity(0.3),
            onTap: () {
              widget.active = true;
              widget.onTap();
              setState(() {});
            },
            child: Center(
              child: CustomText(
                  text: widget.disabledText,
                  color: PrimaryTrContainers().content),
            ),
          ),
        ),
      );
    }
  }
}
