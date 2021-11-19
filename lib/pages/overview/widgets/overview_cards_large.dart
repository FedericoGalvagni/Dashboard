import 'package:flutter/material.dart';
import 'package:interface_example1/data_models/overview_data.dart';
import 'package:interface_example1/pages/overview/widgets/info_card.dart';
import 'package:interface_example1/widgets/default_line_chart.dart';

class OverviewCardsLarge extends StatelessWidget {
  const OverviewCardsLarge({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;

    return Column(
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
            SizedBox(
              width: _width / 64,
            ),
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
        ValueListenableBuilder(
            valueListenable: productionGraph,
            builder: (context, value, widget) {
              return _graphs();
            })
      ],
    );
  }

  Widget _graphs() {
    GlobalKey key = GlobalKey();
    if (productionGraph.value.isNotEmpty) {
      return Container(margin: EdgeInsets.all(20), child: LineChart(key));
    } else {
      return Container(
        child: Text("Fetching data"),
      );
   }
  }
}
