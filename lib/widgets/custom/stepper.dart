import 'package:flutter/material.dart';
import 'package:interface_example1/classes/http/http_service.dart';
import 'package:interface_example1/constants/style.dart';

class ValueStepper extends StatefulWidget {
  String id;
  bool? sendData;
  var nodeUrl;
  String value;

  Function(String) newValue;
  ValueStepper(
      {Key? key,
      required this.value,
      required this.id,
      this.sendData,
      required this.newValue,
      this.nodeUrl})
      : super(key: key);

  @override
  State<ValueStepper> createState() => _ValueStepperState();
}

class _ValueStepperState extends State<ValueStepper> {
  @override
  Widget build(BuildContext context) {
    TextEditingController temp = TextEditingController();
    return Row(children: [
      Center(
        child: Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
                color: primary,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(6),
                    bottomLeft: Radius.circular(6))),
            child: Center(
              child: IconButton(
                icon: const Icon(Icons.remove),
                iconSize: 25,
                padding: const EdgeInsets.all(0),
                color: surface(4),
                onPressed: () {
                  if (widget.sendData ?? false) {
                    debugPrint("minus: id" + widget.id.toString() + ".0");
                    HttpService.post(widget.id);
                  }
                },
              ),
            )),
      ),
      SizedBox(
          height: 30,
          width: 50,
          //color: Colors.red,
          child: TextField(
            controller: temp,
            readOnly: true,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: getEmphasis(
              textOnSurface,
              emphasis.high,
            )),
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                  borderSide: BorderSide(
                      color: getEmphasis(textOnSurface, emphasis.medium),
                      width: 1)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                  borderSide: BorderSide(color: primary, width: 2)),
              border:
                  OutlineInputBorder(borderSide: BorderSide(color: primary)),
            ),
            onSubmitted: (newValue) {
              setState(() {
                widget.value = newValue;
                widget.newValue(newValue);
              });
            },
          )),
      Center(
        child: Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
                color: primary,
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(6),
                    bottomRight: Radius.circular(6))),
            child: Center(
              child: IconButton(
                icon: const Icon(Icons.add),
                iconSize: 25,
                padding: const EdgeInsets.all(0),
                color: surface(4),
                onPressed: () {
                  if (widget.sendData ?? false) {
                    debugPrint("plus: id" + widget.id.toString() + ".1");
                    HttpService.post(widget.id);
                  }
                },
              ),
            )),
      ),
      const SizedBox(width: 5),
    ]);
  }
}
