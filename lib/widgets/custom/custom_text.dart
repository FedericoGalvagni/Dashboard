import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText extends StatelessWidget {
  final String? text;
  final double? size;
  final Color color;
  final TextAlign? align;
  final FontWeight? weight;
  const CustomText({Key? key,this.align, this.text, this.size, required this.color, this.weight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text!,
      textAlign: align ?? TextAlign.left,
        style: GoogleFonts.roboto(
            fontSize: size ?? 16,
            color: color,
            fontWeight: weight ?? FontWeight.normal));
  }
}
