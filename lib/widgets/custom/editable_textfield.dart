import 'package:flutter/material.dart';
import 'package:interface_example1/constants/style.dart';

class EditableTextField extends StatefulWidget {
  String initialText;
  final Color color;
  final TextEditingController editingController;
  Function(String) newValue;
  final TextAlign? align;
  TextInputType? inputType;

  EditableTextField(
      {Key? key,
      this.align,
      this.inputType,
      required this.color,
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
    return Center(
      child: TextField(

        keyboardType: widget.inputType ?? TextInputType.text,
        textAlign: widget.align ?? TextAlign.left,
        textAlignVertical: TextAlignVertical.center,
        style: TextStyle(
            color: getEmphasis(
          onSurface,
          emphasis.high,
        )),
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: BorderSide(
                  color: getEmphasis(onSurface, emphasis.medium), width: 1)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: BorderSide(color: primary, width: 2)),
          border: OutlineInputBorder(borderSide: BorderSide(color: primary)),
        ),
        onSubmitted: (newValue) {
          setState(() {
            widget.initialText = newValue;
            widget.newValue(newValue);
          });
        },
        controller: widget.editingController,
      ),
    );
  }
}
