import 'package:flutter/material.dart';

//TODO: need to define a color palette for each of the theme we want to implement
// two ways, either define a theme for myApp, or manually set every widget color
// each off the choice need to planned to avoid issues
Color tabletext = const Color(0xFFFFFFFF).withOpacity(1);
Color colorHeaderText = const Color(0xFFFFFFFF).withOpacity(0.6);
Color surfaceColor = const Color(0xFF121212);
Color background = const Color(0xFF121212); //0dp elevation surface overlay
/// ## Elevazione
/// L'elevazione della superficie è un effetto che si può generare creando
/// un colore che derivato da un overlay di una superficie bianca con diversi
/// valori di opacità (in base a quanto la vogliamo elevare). Valori disponibili
/// [0, 1, 2, 3, 4, 6, 8, 12, 14, 16 ,24] dp DEFAULT 01dp
Color surface(int elevation) {
  Color surface;
  switch (elevation) {
    case 0:
      surface = Color.alphaBlend(Colors.white.withOpacity(0.0), surfaceColor);
      break;
    case 1:
      surface = Color.alphaBlend(Colors.white.withOpacity(0.05), surfaceColor);
      break;
    case 2:
      surface = Color.alphaBlend(Colors.white.withOpacity(0.07), surfaceColor);
      break;
    case 3:
      surface = Color.alphaBlend(Colors.white.withOpacity(0.08), surfaceColor);
      break;
    case 4:
      surface = Color.alphaBlend(
          Colors.white.withOpacity(0.09), const Color(0xFF121212));
      break;
    case 6:
      surface = Color.alphaBlend(
          Colors.white.withOpacity(0.11), const Color(0xFF121212));
      break;
    case 8:
      surface = Color.alphaBlend(
          Colors.white.withOpacity(0.12), const Color(0xFF121212));
      break;
    case 12:
      surface = Color.alphaBlend(
          Colors.white.withOpacity(0.14), const Color(0xFF121212));
      break;
    case 16:
      surface = Color.alphaBlend(
          Colors.white.withOpacity(0.15), const Color(0xFF121212));
      break;
    case 24:
      surface = Color.alphaBlend(
          Colors.white.withOpacity(0.16), const Color(0xFF121212));
      break;
    default:
      surface = Color.alphaBlend(
          Colors.white.withOpacity(0.05), const Color(0xFF121212));
  }
  return surface;
} //with 1dp elevation surface overlay

Color error = const Color(0xFFCF6679);
Color primary = const Color(0xFFBB86FC);
Color secondary = const Color(0xFF03DAC6);
Color textOnBackground = const Color(0xFFFFFFFF);
Color textOnSurface = const Color(0xFFFFFFFF);
Color textOnPrimary = const Color(0xFF000000);
Color textOnSecondary = const Color(0xFF000000);
Color divider = const Color(0xFF646464);

Color hovered(Color background, Color foreground) {
  return Color.alphaBlend(Colors.white.withOpacity(0.04), background);
}

Color focused(Color background, Color foreground) {
  return Color.alphaBlend(foreground.withOpacity(0.12), background);
}

Color pressed(Color background, Color foreground) {
  getEmphasis(textOnSurface, emphasis.high);
  return Color.alphaBlend(foreground.withOpacity(0.1), background);
}

/// ##Emphasis
/// When light text appears on dark backgrounds it should use the following
/// opacity levels: for better visibility.

/// High-emphasis text has an opacity of 87%
/// Medium-emphasis text and hint text have opacities of 60%
/// Disabled text has an opacity of 38%
Color getEmphasis(Color color, var emphasisLevel) {
  switch (emphasisLevel) {
    case emphasis.high:
      return color.withOpacity(0.87);

    case emphasis.medium:
      return color.withOpacity(0.60);

    case emphasis.disabled:
      return color.withOpacity(0.38);
    default:
      return color;
  }
}

enum emphasis { high, medium, disabled }

class CustomColor {
  bool theme = true;
  Color? background;
  Color? surface;
  Color? primary;
  Color? secondary;
  Color? textOnBackground;
  Color? textOnSurface;
  Color? textOnPrimary;
  Color? textOnSecondary;

  CustomColor();

  assignColor(bool theme) {
    if (theme) {
      background = const Color(0xFF121212); //0dp elevation surface overlay
      surface = Color.alphaBlend(Colors.white.withOpacity(0.5),
          const Color(0xFF121212)); //with 1dp elevation surface overlay
      primary = const Color(0xFFBB86FC);
      secondary = const Color(0xFF03DAC6);
      textOnBackground = const Color(0xFFFFFFFF);
      textOnSurface = const Color(0xFFFFFFFF);
      textOnPrimary = const Color(0xFF000000);
      textOnSecondary = const Color(0xFF000000);
    } else {}
  }
}
