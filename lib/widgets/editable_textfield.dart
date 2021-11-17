import 'package:flutter/material.dart';

class EditableTextField extends StatefulWidget {
  bool isEditingText;
  String initialText;
  TextEditingController editingController;
  Function(String) newValue;

  EditableTextField(
      {Key? key,
      required this.isEditingText,
      required this.editingController,
      required this.initialText,
      required this.newValue})
      : super(key: key);

  @override
  _EditableTextFieldState createState() => _EditableTextFieldState();
}

class _EditableTextFieldState extends State<EditableTextField> {
  @override
  Widget build(BuildContext context) {
    if (widget.isEditingText) {
      return Center(
        child: TextField(
          onSubmitted: (newValue) {
            setState(() {
              widget.initialText = newValue;
              widget.isEditingText = false;
              widget.newValue(newValue);
            });
          },
          controller: widget.editingController,
        ),
      );
    }
    return InkWell(
        onTap: () {
          setState(() {
            widget.isEditingText = true;
          });
        },
        child: Text(
          widget.initialText,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 18.0,
          ),
        ));
  }
}
