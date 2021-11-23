import 'package:flutter/material.dart';
import 'package:interface_example1/constants/style.dart';
import 'package:interface_example1/widgets/custom/custom_text.dart';

class InfoCardSmall extends StatelessWidget {
  final String title;
  final String value;
  final VoidCallback onTap;

  const InfoCardSmall(
      {Key? key,
      required this.title,
      required this.value,
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
              color: surface(4),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                  color: getEmphasis(textOnSurface, emphasis.medium),
                      
                  width: .5),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  text: title,
                  size: 24,
                  weight: FontWeight.w300,
                  color: getEmphasis(textOnSurface, emphasis.medium),
                ),
                CustomText(
                  text: value,
                  size: 24,
                  weight: FontWeight.bold,
                  color:getEmphasis(textOnSurface, emphasis.medium),
                )
              ],
            )),
      ),
    );
  }
}
