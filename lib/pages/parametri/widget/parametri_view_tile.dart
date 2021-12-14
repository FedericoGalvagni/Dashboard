import 'package:flutter/material.dart';
import 'package:interface_example1/constants/style.dart';
import 'package:interface_example1/widgets/custom/custom_text.dart';

class ParametriViewTile extends StatefulWidget {
  final String name;
  final String value;
  final int index;
  const ParametriViewTile(
      {Key? key, required this.index, required this.name, required this.value})
      : super(key: key);
  @override
  ParametriViewTileState createState() => ParametriViewTileState();
}

class ParametriViewTileState extends State<ParametriViewTile> {
  bool editable = true;

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return Container(
      width: 56,
      decoration: BoxDecoration(
        border: Border(
            top: BorderSide(width: 1, color: divider),
            left: BorderSide(width: 1, color: divider)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomText(
              color: getEmphasis(onSurface, emphasis.high),
              text: widget.index.toString()),
          Container(
            width: _width / 64,
          ),
          CustomText(
              color: getEmphasis(onSurface, emphasis.high), text: widget.name),
          Container(
            width: _width / 64,
          ),
          SizedBox(
            width: 50,
            child: TextField(
              enabled: editable,
              decoration: InputDecoration(
                  hintText: widget.value,
                  hintStyle: const TextStyle(color: Colors.black)),
            ),
          ),
        ],
      ),
    );
  }
}
