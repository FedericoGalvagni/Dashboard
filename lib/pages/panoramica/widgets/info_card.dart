import 'package:flutter/material.dart';
import 'package:interface_example1/constants/style.dart';
import 'package:interface_example1/helpers/responsivness.dart';

/// Una card con titolo e valore, il valore viene animato
class InfoCard extends StatelessWidget {
  final String title;
  final String value;
  final bool isActive;
  final VoidCallback onTap;
  final double height;

  const InfoCard(
      {Key? key,
      required this.height,
      required this.title,
      required this.value,
      this.isActive = false,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool _small = ResponsiveWidget.isSmallScreen(context);
    return Expanded(
      child: Container(
        height: height,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: surface(4),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                    child: Container(
                  height: 5,
                ))
              ],
            ),
            Expanded(child: Container()),
            RichText(
                textAlign: TextAlign.center,
                text: TextSpan(children: [
                  TextSpan(
                      text: "$title\n",
                      style: TextStyle(
                          fontSize: _small ? 13 : 16, color: primary)),
                  TextSpan(
                      text: value,
                      style: TextStyle(
                          fontSize: _small ? 30 : 40,
                          color: getEmphasis(onSurface, emphasis.high))),
                ])),
            Expanded(child: Container()),
          ],
        ),
      ),
    );
  }
}

/*             RichText(
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
                            fontSize: 40, color: getEmphasis(onSurface, emphasis.high))),
                  ])),*/

/*Column(
          children: [
            Expanded(child: Container()),
            CustomText(
              text: title,
              size: 16,
              color: primary,
            ),

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
        ),*/