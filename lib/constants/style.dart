import 'package:flutter/material.dart';

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
Color onBackground = const Color(0xFFFFFFFF);
Color onSurface = const Color(0xFFFFFFFF);
Color onError = const Color(0xFF000000);
// extra
Color divider = const Color(0xFF646464);
Color valid = Colors.green;
Color warning = Colors.orange.shade700;
List<BoxShadow> boxShadow = [
  //BoxShadow(offset: const Offset(6, 6), color: surface(4), blurRadius: 12)
];

/// Funzione che modifica la palette dei colori in base a [light]
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
    boxShadow = const [BoxShadow()];
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
    divider = const Color(0xFF646464);
    valid = Colors.green;
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
  Color elevatedColor;
  switch (elevation) {
    case 0:
      elevatedColor = Color.alphaBlend(overlay.withOpacity(0.0), surfaceColor);
      break;
    case 1:
      elevatedColor = Color.alphaBlend(overlay.withOpacity(0.05), surfaceColor);
      break;
    case 2:
      elevatedColor = Color.alphaBlend(overlay.withOpacity(0.07), surfaceColor);
      break;
    case 3:
      elevatedColor = Color.alphaBlend(overlay.withOpacity(0.08), surfaceColor);
      break;
    case 4:
      elevatedColor = Color.alphaBlend(overlay.withOpacity(0.09), surfaceColor);
      break;
    case 6:
      elevatedColor = Color.alphaBlend(overlay.withOpacity(0.11), surfaceColor);
      break;
    case 8:
      elevatedColor = Color.alphaBlend(overlay.withOpacity(0.12), surfaceColor);
      break;
    case 12:
      elevatedColor = Color.alphaBlend(overlay.withOpacity(0.14), surfaceColor);
      break;
    case 16:
      elevatedColor = Color.alphaBlend(overlay.withOpacity(0.15), surfaceColor);
      break;
    case 24:
      elevatedColor = Color.alphaBlend(overlay.withOpacity(0.16), surfaceColor);
      break;
    default:
      elevatedColor = Color.alphaBlend(overlay.withOpacity(0.05), surfaceColor);
  }
  return elevatedColor;
}

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

/// Determina il livello di emfasi, valori disponibili [high], [medium], [disabled]
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

/// ## Primary Containers
/// The enabled, hovered, focused, pressed, and dragged states for containers using the primary color.
/// - Container	Primary
/// - Content	On Primary
/// - Overlay color	White
class PrimaryContainers {
  Color container = primary;
  Color overlay = Colors.white;
  Color content = onPrimary;

  Color hovered() {
    return Color.alphaBlend(overlay.withOpacity(0.04), container);
  }

  Color focused() {
    return Color.alphaBlend(overlay.withOpacity(0.12), container);
  }

  Color pressed() {
    return Color.alphaBlend(overlay.withOpacity(0.1), container);
  }
}

/// ## Surface containers
/// Surface containers that use the color called "Surface" should apply an overlay
///  that matches the color of their icon or text label (if no icon is present).
/// The enabled, hovered, focused, pressed, and dragged states for containers using the Surface color.
/// - Container:	Surface
/// - Content:	On Surface
/// - Overlay: color	Inherited from content
class SurfaceContainer{

final Color overlay = Colors.white;
final Color content = onSurface;
final int elevation;
late Color container = surface(elevation);
SurfaceContainer({required this.elevation});
Widget build(BuildContext context){
  
  return Container();
}
  Color hovered() {
    return Color.alphaBlend(overlay.withOpacity(0.04), this.container);
  }

  Color focused() {
    return Color.alphaBlend(overlay.withOpacity(0.12), container);
  }

  Color pressed() {
    return Color.alphaBlend(overlay.withOpacity(0.1), container);
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}

/// ## Surface containers with primary content
/// Surface containers that use the color called "Surface" should apply an overlay
///  that matches the color of their icon or text label (if no icon is present).
/// The enabled, hovered, focused, pressed, and dragged states for containers using the Surface color and the primary color for content.
/// - Container	Surface
/// - Content	Primary
/// - Overlay color	Inherited from content
class SurfacePrimaryContainer {
  Color container = surface(4);
  Color overlay = primary;
  Color content = primary;
  Color hovered() {
    return Color.alphaBlend(overlay.withOpacity(0.04), primary);
  }

  Color focused() {
    return Color.alphaBlend(overlay.withOpacity(0.12), container);
  }

  Color pressed() {
    return Color.alphaBlend(overlay.withOpacity(0.1), container);
  }
}

/// The enabled, hovered, focused, pressed, and dragged states for
/// containers using the semi-transparent primary color.
/// - Container:	Primary 24%
/// - Content:	Primary
/// - Overlay: color	White

class PrimaryTrContainers {
  Color container = primary.withOpacity(0.24);
  Color overlay = Colors.white;
  Color content = primary;

  Color hovered() {
    return Color.alphaBlend(overlay.withOpacity(0.04), container);
  }

  Color focused() {
    return Color.alphaBlend(overlay.withOpacity(0.12), container);
  }

  Color pressed() {
    return Color.alphaBlend(overlay.withOpacity(0.1), container);
  }
}
