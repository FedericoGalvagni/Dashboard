import 'package:flutter/material.dart';
import 'package:interface_example1/constants/style.dart';

class InfoCard extends StatelessWidget {
  final String? title;
  final String? value;
  final Color? topColor;
  final bool isActive;
  final VoidCallback onTap;

  const InfoCard(
      {Key? key,
      this.title,
      this.value,
      this.isActive = false,
      required this.onTap,
      this.topColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 136,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: surface(2),
        ),
        child: Column(
          children: [
            Expanded(child: Container()),
            RichText(
                textAlign: TextAlign.center,
                text: TextSpan(children: [
                  TextSpan(
                      text: "$title\n",
                      style: TextStyle(
                          fontSize: 16, color: mediumEmphasis(textOnSurface))),
                  TextSpan(
                      text: "$value",
                      style: TextStyle(
                          fontSize: 40, color: highEmphasis(textOnSurface))),
                ])),
            Expanded(child: Container()),
          ],
        ),
      ),
    );
  }
}
