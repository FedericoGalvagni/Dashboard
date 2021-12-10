library breathing_glowing_button;

import 'package:flutter/material.dart';
import 'package:interface_example1/classes/data_models/global_variable.dart';

/// A Breathing Glowing Button widget.
///
/// If properties are not given, default value is used.
class BreathingGlowingWidget extends StatefulWidget {
  final Color glowColor;
  final Widget child;
  final bool glow;
  final double offset;
  final double startOffset;
  final Duration duration;

  BreathingGlowingWidget(
      {required this.glowColor,
      this.duration = const Duration(seconds: 1),
      required this.child,
      required this.glow,
      this.startOffset = 0.5,
      required this.offset});

  @override
  _BreathingGlowingButtonState createState() => _BreathingGlowingButtonState();
}

class _BreathingGlowingButtonState extends State<BreathingGlowingWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _animation;
  bool a = false;

  @override
  void initState() {
    super.initState();
    tenet();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _animation.removeListener(() {});
    super.dispose();
  }

  /// Core animation control is done here.
  /// Animation completes in 2 seconds then repeat by reversing.
  void tenet() {
    _animationController =
        AnimationController(vsync: this, duration: widget.duration);
    _animationController.repeat(reverse: true);
    _animation = Tween(begin: widget.startOffset, end: widget.offset)
        .animate(_animationController)
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    final Color _glowColor = widget.glowColor;
    final Widget _child = widget.child;
    final bool _glow = widget.glow;

    /// A simple breathing glowing button.
    /// Built using [Container] and [InkWell].
    return ValueListenableBuilder(
        valueListenable: updateShadow,
        builder: (context, widget, value) {
          return Container(
            child: _child,
            decoration: BoxDecoration(boxShadow: [
              _glow
                  ? BoxShadow(
                      color: _glowColor,
                      blurRadius: _animation.value,
                      spreadRadius: _animation.value,
                    )
                  : const BoxShadow()
            ], borderRadius: BorderRadius.circular(10)),
          );
        });
  }
}
