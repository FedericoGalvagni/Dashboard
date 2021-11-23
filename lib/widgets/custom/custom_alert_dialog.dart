import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:interface_example1/constants/style.dart';
import 'package:interface_example1/controllers/navigation_controller.dart';
import 'package:interface_example1/helpers/local_navigator.dart';
import 'package:interface_example1/widgets/custom/custom_text.dart';

class CustomAlertDialog extends StatefulWidget {
  String title;
  String content;
  

  CustomAlertDialog(this.title, this.content,);

  @override
  State<CustomAlertDialog> createState() => _CustomAlertDialogState();
}

class _CustomAlertDialogState extends State<CustomAlertDialog> {
  TextStyle textStyle = TextStyle(color: Colors.black);

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
        child: AlertDialog(
          title: Text(
            widget.title,
            style: textStyle,
          ),
          content: Text(
            widget.content,
            style: textStyle,
          ),
          actions: <Widget>[
            TextButton(
              child: Text("Continue"),
              onPressed: () {
                
              },
            ),
            TextButton(
              child: Text("Cancel"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ));
  }
}
