import 'package:flutter/material.dart';
import 'package:interface_example1/data_models/overview_data.dart';

import 'info_card.dart';

class OverviewCardsMedium extends StatelessWidget {
  const OverviewCardsMedium({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            ValueListenableBuilder(
                valueListenable: totalProduction,
                builder: (context, value, widget) {
                  return InfoCard(
                    title: "Total Production",
                    value: totalProduction.value.toString(),
                    onTap: () {},
                    topColor: Colors.orange,
                  );
                }),
            SizedBox(
              width: _width / 64,
            ),
            ValueListenableBuilder(
                valueListenable: totalProduction,
                builder: (context, value, widget) {
                  return InfoCard(
                    title: "Production 24H",
                    value: h24Production.value.toString(),
                    topColor: Colors.lightGreen,
                    onTap: () {},
                  );
                }),
          ],
        ),
        SizedBox(
          height: _width / 64,
        ),
        Row(
          children: [
            ValueListenableBuilder(
                valueListenable: totalProduction,
                builder: (context, value, widget) {
                  return InfoCard(
                    title: "Time",
                    value: time.value.toString(),
                    topColor: Colors.redAccent,
                    onTap: () {},
                  );
                }),
            SizedBox(
              width: _width / 64,
            ),
            ValueListenableBuilder(
                valueListenable: totalProduction,
                builder: (context, value, widget) {
                  return InfoCard(
                    title: "Downtime",
                    value: downtime.value.toString(),
                    onTap: () {},
                  );
                }),
          ],
        ),
      ],
    );
  }
}
