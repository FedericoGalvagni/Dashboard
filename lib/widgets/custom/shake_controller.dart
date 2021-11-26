import 'package:flutter/animation.dart';


class ShakeController{
  late AnimationController controller;


  shake()
  {
    controller.forward(from: 0.0);

  }

}

