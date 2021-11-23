import 'package:flutter/material.dart';
import 'package:interface_example1/constants/style.dart';
import 'package:interface_example1/widgets/custom_text.dart';

class InfoCardSmall extends StatelessWidget {
  final String title;
  final String value;
  final bool isActive;
  final VoidCallback onTap;

  const InfoCardSmall(
      {Key? key,
      required this.title,
      required this.value,
      this.isActive = false,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: surface(2),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                  color: isActive
                      ? mediumEmphasis(textOnSurface)
                      : disabledEmphasis(textOnSurface),
                  width: .5),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  text: title,
                  size: 24,
                  weight: FontWeight.w300,
                  color: isActive
                      ? mediumEmphasis(textOnSurface)
                      : disabledEmphasis(textOnSurface),
                ),
                CustomText(
                  text: value,
                  size: 24,
                  weight: FontWeight.bold,
                  color: isActive
                      ? mediumEmphasis(textOnSurface)
                      : disabledEmphasis(textOnSurface),
                )
              ],
            )),
      ),
    );
  }
}
