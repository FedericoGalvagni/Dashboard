import 'package:flutter/material.dart';

class ValueStepper extends StatelessWidget {
  const ValueStepper({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      SizedBox(
          height: 30,
          width: 50,
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(6),
                        bottomLeft: Radius.circular(6),
                        topRight: Radius.zero,
                        bottomRight: Radius.zero)),
              ),
              child: const Icon(Icons.remove),
              onPressed: () {})),
      const SizedBox(
          height: 30,
          width: 50,
          //color: Colors.red,
          child: TextField(
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(10.0),
                border: OutlineInputBorder(borderRadius: BorderRadius.zero),
                hintText: '20',
              ))),
      SizedBox(
          //color: Colors.blue,
          width: 50,
          height: 30,
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.zero,
                        bottomLeft: Radius.zero,
                        topRight: Radius.circular(6),
                        bottomRight: Radius.circular(6))),
              ),
              child: const Icon(
                Icons.add,
                size: 30,
                color: Colors.white,
              ),
              onPressed: () {})),
      const SizedBox(width: 5),
    ]);
  }
}
