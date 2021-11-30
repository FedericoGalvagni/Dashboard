// ignore_for_file: must_be_immutable

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:interface_example1/constants/style.dart';


class CustomAlertDialog extends StatefulWidget {
  String title;
  String content;
  

  CustomAlertDialog(this.title, this.content, {Key? key}) : super(key: key);

  @override
  State<CustomAlertDialog> createState() => _CustomAlertDialogState();
}

class _CustomAlertDialogState extends State<CustomAlertDialog> {
  TextStyle textStyle = TextStyle(color: onSurface);

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
              child: const Text("Continue"),
              onPressed: () {
                
              },
            ),
            TextButton(
              child: const Text("Cancel"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ));
  }
}
