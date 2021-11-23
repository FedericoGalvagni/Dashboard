import 'package:flutter/material.dart';
import 'package:interface_example1/constants/style.dart';
import 'package:interface_example1/widgets/custom_text.dart';

class ParametersViewTile extends StatefulWidget {
  final String name;
  final String value;
  final int index;
  const ParametersViewTile(
      {Key? key, required this.index, required this.name, required this.value})
      : super(key: key);
  @override
  ParametersViewTileState createState() => ParametersViewTileState();
}

class ParametersViewTileState extends State<ParametersViewTile> {
  bool editable = true;

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return Container(
      width: 56,
      decoration: BoxDecoration(
        border: Border(
            top: BorderSide(width: 1, color: Colors.grey.withOpacity(0.6)),
            left: BorderSide(width: 1, color: Colors.grey.withOpacity(0.6))),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomText(
              color: highEmphasis(textOnSurface),
              text: widget.index.toString()),
          Container(
            width: _width / 64,
          ),
          CustomText(color: highEmphasis(textOnSurface), text: widget.name),
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
