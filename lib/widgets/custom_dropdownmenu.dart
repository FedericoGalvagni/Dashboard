import 'package:flutter/material.dart';

class CustomDDMenu extends StatefulWidget {
  String dropdownValue;
  List<String> items;
  Color color;
  Color textColor;
  Function(String) selectedValue;

  CustomDDMenu({
    Key? key,
    required this.dropdownValue,
    required this.items,
    this.color = Colors.blue,
    this.textColor = Colors.black,
    required this.selectedValue,
  }) : super(key: key);

  @override
  State<CustomDDMenu> createState() => _CustomDDMenuState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _CustomDDMenuState extends State<CustomDDMenu> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: widget.dropdownValue,
      icon: const Icon(Icons.expand_more),
      iconSize: 24,
      elevation: 16,
      style: TextStyle(color: widget.textColor),
      underline: Container(
        height: 2,
        color: widget.color,
      ),
      onChanged: (String? newValue) {
        setState(() {
          widget.dropdownValue = newValue!;
          widget.selectedValue(newValue);
        });
      },
      items: widget.items.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
