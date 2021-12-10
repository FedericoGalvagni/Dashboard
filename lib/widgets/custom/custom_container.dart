import 'package:flutter/material.dart';
import 'package:interface_example1/constants/style.dart';

// ignore: must_be_immutable
class CustomInkWell extends StatefulWidget {
  CustomInkWell(
      {Key? key,
      required this.child,
      required this.style,
      required this.onTap,
      required this.radius})
      : super(key: key);
  Widget child;
  VoidCallback onTap;
  ContainerStyle style;
  double radius;

  @override
  State<CustomInkWell> createState() => _CustomInkWellState();
}

class _CustomInkWellState extends State<CustomInkWell> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: _decoration(),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
            borderRadius: BorderRadius.circular(widget.radius),
            onTap: widget.onTap,
            onHover: (hover) {
              setState(() {
                
              });
              isHovered = hover;
            },
            focusColor: _focusColor(),
            hoverColor: _hoverColor(),
            splashColor: _splashColor(),
            child: widget.child),
      ),
    );
  }

  BoxDecoration _decoration() {
    switch (widget.style) {
      case ContainerStyle.primary:
        return BoxDecoration(
            border: isHovered
                ? Border.all(color: PrimaryContainers().overlay, width: 1)
                : Border.all(width: 0),
            color: PrimaryContainers().container,
            borderRadius: BorderRadius.circular(widget.radius),
            boxShadow: boxShadow);
      case ContainerStyle.surfacePrimary:
        return BoxDecoration(
            border: isHovered
                ? Border.all(color: SurfacePrimaryContainer().overlay, width: 1)
                :Border.all(color: SurfacePrimaryContainer().overlay.withOpacity(0.2), width: 1),
            color: SurfacePrimaryContainer().container,
            borderRadius: BorderRadius.circular(widget.radius),
            boxShadow: boxShadow);
      case ContainerStyle.prymaryTransparent:
        return BoxDecoration(
            border: isHovered
                ? Border.all(color: PrimaryTrContainers().overlay, width: 1)
                : Border.all(),
            color: PrimaryTrContainers().container,
            borderRadius: BorderRadius.circular(widget.radius),
            boxShadow: boxShadow);
      case ContainerStyle.surface:
        return BoxDecoration(
            border: isHovered
                ? Border.all(color: SurfaceContainer().overlay, width: 1)
                : Border.all(color: SurfacePrimaryContainer().overlay.withOpacity(0.2), width: 1)  ,
            color: SurfaceContainer().container,
            borderRadius: BorderRadius.circular(widget.radius),
            boxShadow: boxShadow);

      default:
        return BoxDecoration();
    }
  }

  Color _focusColor() {
    switch (widget.style) {
      case ContainerStyle.primary:
        return PrimaryContainers().focused();
      case ContainerStyle.surfacePrimary:
        return SurfacePrimaryContainer().focused();
      case ContainerStyle.prymaryTransparent:
        return PrimaryTrContainers().focused();
      case ContainerStyle.surface:
        return SurfaceContainer().focused();
    }
  }

  Color _hoverColor() {
    switch (widget.style) {
      case ContainerStyle.primary:
        return PrimaryContainers().hovered();
      case ContainerStyle.surfacePrimary:
        return SurfacePrimaryContainer().hovered();
      case ContainerStyle.prymaryTransparent:
        return PrimaryTrContainers().hovered();
      case ContainerStyle.surface:
        return SurfaceContainer().hovered();
    }
  }

  Color _splashColor() {
    switch (widget.style) {
      case ContainerStyle.primary:
        return PrimaryContainers().pressed();
      case ContainerStyle.surfacePrimary:
        return SurfacePrimaryContainer().pressed();
      case ContainerStyle.prymaryTransparent:
        return PrimaryTrContainers().pressed();
      case ContainerStyle.surface:
        return SurfaceContainer().pressed();
    }
  }
}
/// Definisce lo stile del container
enum ContainerStyle {
  /// ## Primary Containers
  /// The enabled, hovered, focused, pressed, and dragged states for containers using the primary color.

  /// - Container	Primary
  /// - Content	On Primary
  /// - Overlay color	White
  primary,

  /// ## Surface containers
  /// Surface containers that use the color called "Surface" should apply an overlay
  ///  that matches the color of their icon or text label (if no icon is present).
  /// The enabled, hovered, focused, pressed, and dragged states for containers using the Surface color.
  /// - Container:	Surface
  /// - Content:	On Surface
  /// - Overlay: color	Inherited from content
  surface,

  /// ## Surface containers with primary content
  /// Surface containers that use the color called "Surface" should apply an overlay
  ///  that matches the color of their icon or text label (if no icon is present).
  /// The enabled, hovered, focused, pressed, and dragged states for containers using the Surface color and the primary color for content.
  /// - Container	Surface
  /// - Content	Primary
  /// - Overlay color	Inherited from content
  surfacePrimary,

  /// The enabled, hovered, focused, pressed, and dragged states for
  /// containers using the semi-transparent primary color.
  /// - Container:	Primary 24%
  /// - Content:	Primary
  /// - Overlay: color	White
  prymaryTransparent
}
