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
   
      return Container(
        height: widget.height,
        width: widget.width,
        decoration: BoxDecoration(
            color: widget.active
                ? PrimaryContainers().container
                : PrimaryTrContainers().container,
            border: Border.all(color: primary),
            borderRadius: BorderRadius.circular(5),
            boxShadow: boxShadow),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            hoverColor: widget.active
                ? PrimaryContainers().hovered()
                : PrimaryTrContainers().hovered(),
            splashColor: widget.active
                ? PrimaryContainers().pressed()
                : PrimaryTrContainers().pressed(),
            onTap: () {
              widget.active = !widget.active;
              widget.onTap();
              setState(() {});
            },
            child: Center(
              child: CustomText(
                  text: widget.active ? widget.activeText : widget.disabledText,
                  color: widget.active
                      ? PrimaryContainers().content
                      : PrimaryTrContainers().content),
            ),
          ),
        ),
      );
    
  }
}
