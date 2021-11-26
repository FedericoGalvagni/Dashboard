import 'package:flutter/material.dart';
import 'package:interface_example1/constants/style.dart';
import 'package:interface_example1/widgets/custom/custom_text.dart';
import 'package:interface_example1/widgets/custom/number_slider.dart';

class InfoCard extends StatelessWidget {
  final String title;
  final String value;
  final bool isActive;
  final VoidCallback onTap;

  const InfoCard(
      {Key? key,
      required this.title,
      required this.value,
      this.isActive = false,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 136,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: surface(4),
        ),
        child: Column(
          children: [
            Expanded(child: Container()),
            /*RichText(
                textAlign: TextAlign.center,
                text: TextSpan(children: [
                  TextSpan(
                      text: "$title\n",
                      style: TextStyle(
                          fontSize: 16,
                          color: getEmphasis(onSurface, emphasis.medium))),
                  TextSpan(
                      text: "$value",
                      style: TextStyle(
                          fontSize: 40,
                          color: getEmphasis(onSurface, emphasis.high))),
                ])),*/
            CustomText(
              text: title,
              size: 16,
              color: primary,
            ),
            /* NumberSlideAnimation(
              number: value.toString(),
              duration: const Duration(milliseconds: 1500),
              curve: Curves.decelerate,
              textStyle: TextStyle(
                  fontSize: 40.0, color: getEmphasis(onSurface, emphasis.high)),
            ),*/
            SlidingNumber(
              number: int.parse(value),
              style: TextStyle(
                  color: getEmphasis(
                    onSurface,
                    emphasis.high,
                  ),
                  fontSize: 40.0),
              duration: const Duration(milliseconds: 1500),
              curve: Curves.easeOutQuint,
            ),
            Expanded(child: Container()),
          ],
        ),
      ),
    );
  }
}
