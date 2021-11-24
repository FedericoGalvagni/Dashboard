import 'package:flutter/material.dart';

//TODO: need to define a color palette for each of the theme we want to implement
// two ways, either define a theme for myApp, or manually set every widget color
// each off the choice need to planned to avoid issues

/* DARK THEME */

//Color
Color overlay = const Color(0xFFFFFFFF);
Color primary = const Color(0xFFBB86FC);
Color primaryVariant = const Color(0xFF3700B3);
Color secondary = const Color(0xFF03DAC6);
Color secondaryVariant = const Color(0xFF03DAC6);
Color background = const Color(0xFF121212);
Color surfaceColor = const Color(0xFF121212);
Color error = const Color(0xFFCF6679);
Color onPrimary = const Color(0xFF000000);
Color onSecondary = const Color(0xFF000000);
Color onBackground = Color(0xFFFFFFFF);
Color onSurface = const Color(0xFFFFFFFF);
Color onError = const Color(0xFF000000);
// extra
Color divider = const Color(0xFF646464);
Color valid = Colors.green;

// shadow
List<BoxShadow> boxShadow = [
  //BoxShadow(offset: const Offset(6, 6), color: surface(4), blurRadius: 12)
];

themeSelection(bool light) {
  if (!light) {
    // dark theme palette
    overlay = const Color(0xFFFFFFFF);
    primary = const Color(0xFFBB86FC);
    primaryVariant = const Color(0xFF3700B3);
    secondary = const Color(0xFF03DAC6);
    secondaryVariant = const Color(0xFF03DAC6);
    background = const Color(0xFF121212);
    surfaceColor = const Color(0xFF121212);
    error = const Color(0xFFCF6679);
    onPrimary = const Color(0xFF000000);
    onSecondary = const Color(0xFF000000);
    onBackground = const Color(0xFFFFFFFF);
    onSurface = const Color(0xFFFFFFFF);
    onError = const Color(0xFF000000);
    divider = const Color(0xFF646464);
    boxShadow = [BoxShadow()];
  } else {
    overlay = const Color(0xFF000000);
    primary = const Color(0xFF6200EE);
    primaryVariant = const Color(0xFF3700B3);
    secondary = const Color(0xFF03DAC6);
    secondaryVariant = const Color(0xFF018786);
    background = const Color(0xFFFFFFFF);
    surfaceColor = const Color(0xFFFFFFFF);
    error = const Color(0xFFB00020);
    onPrimary = const Color(0xFFFFFFFF);
    onSecondary = const Color(0xFF000000);
    onBackground = const Color(0xFF000000);
    onSurface = const Color(0xFF000000);
    onError = const Color(0xFFFFFFFF);
    // extra
    Color divider = const Color(0xFF646464);
    Color valid = Colors.green;
    boxShadow = [
      //BoxShadow(offset: const Offset(6, 6), color: surface(4), blurRadius: 12)
    ];
  }
}

/// ## Elevazione
/// L'elevazione della superficie è un effetto che si può generare creando
/// un colore che derivato da un overlay di una superficie bianca con diversi
/// valori di opacità (in base a quanto la vogliamo elevare). Valori disponibili
/// [0, 1, 2, 3, 4, 6, 8, 12, 14, 16 ,24] dp DEFAULT 01dp
Color surface(int elevation) {
  Color surface;
  switch (elevation) {
    case 0:
      surface = Color.alphaBlend(overlay.withOpacity(0.0), surfaceColor);
      break;
    case 1:
      surface = Color.alphaBlend(overlay.withOpacity(0.05), surfaceColor);
      break;
    case 2:
      surface = Color.alphaBlend(overlay.withOpacity(0.07), surfaceColor);
      break;
    case 3:
      surface = Color.alphaBlend(overlay.withOpacity(0.08), surfaceColor);
      break;
    case 4:
      surface = Color.alphaBlend(overlay.withOpacity(0.09), surfaceColor);
      break;
    case 6:
      surface = Color.alphaBlend(overlay.withOpacity(0.11), surfaceColor);
      break;
    case 8:
      surface = Color.alphaBlend(overlay.withOpacity(0.12), surfaceColor);
      break;
    case 12:
      surface = Color.alphaBlend(overlay.withOpacity(0.14), surfaceColor);
      break;
    case 16:
      surface = Color.alphaBlend(overlay.withOpacity(0.15), surfaceColor);
      break;
    case 24:
      surface = Color.alphaBlend(overlay.withOpacity(0.16), surfaceColor);
      break;
    default:
      surface = Color.alphaBlend(overlay.withOpacity(0.05), surfaceColor);
  }
  return surface;
} //with 1dp elevation surface overlay

/// ## Emphasis
/// When light text appears on dark backgrounds it should use the following
/// opacity levels: for better visibility.
/// * [emphasis.high] text has an opacity of 87%
/// * [emphasis.medium] text and hint text have opacities of 60%
/// * [emphasis.disabled] text has an opacity of 38%
///  ``` dart
///  getEmphasis(backgroundColor, emphasis.high)
///  ```
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

Color hovered(Color background, Color foreground) {
  return Color.alphaBlend(overlay.withOpacity(0.04), background);
}

Color focused(Color background, Color foreground) {
  return Color.alphaBlend(foreground.withOpacity(0.12), background);
}

Color pressed(Color background, Color foreground) {
  getEmphasis(onSurface, emphasis.high);
  return Color.alphaBlend(foreground.withOpacity(0.1), background);
}
