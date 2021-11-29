import 'package:flutter/material.dart';
import 'package:interface_example1/constants/style.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:interface_example1/data_models/overview_data.dart';
import 'package:interface_example1/pages/overview/widgets/info_card.dart';
import 'package:interface_example1/widgets/custom/default_line_chart.dart';
import 'package:interface_example1/widgets/spacer/small_horizontal_spacer.dart';
import 'package:interface_example1/widgets/spacer/small_vertical_spacer.dart';

class OverviewCardsSmall extends StatelessWidget {
  const OverviewCardsSmall({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        const SmallVSpacer(),
        Row(
          children: [
            const SmallHSpacer(),
            ValueListenableBuilder(
                valueListenable: produzioneTotale,
                builder: (context, value, widget) {
                  return InfoCard(
                    height: 80,
                    title: "Total Production",
                    value: produzioneTotale.value.toString(),
                    onTap: () {},
                  );
                }),
            const SmallHSpacer(),
            ValueListenableBuilder(
                valueListenable: produzioneUltime24h,
                builder: (context, value, widget) {
                  return InfoCard(  height: 80,
                    title: "Production 24H",
                    value: produzioneUltime24h.value.toString(),
                    onTap: () {},
                  );
                }),
            const SmallHSpacer(),
          ],
        ),
        const SmallVSpacer(),
        Row(
          children: [
            const SmallHSpacer(),
            ValueListenableBuilder(
                valueListenable: produzioneMediaGiornaliera,
                builder: (context, value, widget) {
                  return InfoCard(  height: 80,
                    title: "Time",
                    value: produzioneMediaGiornaliera.value.toString(),
                    onTap: () {},
                  );
                }),
            const SmallHSpacer(),
            ValueListenableBuilder(
                valueListenable: produzioneMediaOraria,
                builder: (context, value, widget) {
                  return InfoCard(  height: 80,
                    title: "Downtime",
                    value: produzioneMediaOraria.value.toString(),
                    onTap: () {},
                  );
                }),
            const SmallHSpacer(),
          ],
        ),
        const SmallVSpacer(),
        Row(
          children: [
            const SmallHSpacer(),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: surface(4),
                ),
                height: 500,
                child: ValueListenableBuilder(
                    valueListenable: productionGraph,
                    builder: (context, value, widget) {
                      return Container(
                        margin: EdgeInsets.all(15),
                        child: SimpleTimeSeriesChart(
                          _createSampleData(),
                          duration: Duration(milliseconds: 1500),
                          // Disable animations for image tests.
                          animate: true,
                        ),
                      ); //_graphs();
                    }),
              ),
            ),
            const SmallHSpacer(),
          ],
        ),
      ],
    );
  }

  static List<charts.Series<TimeSeriesSales, DateTime>> _createSampleData() {
    List<TimeSeriesSales> data = [];
    for (var item in productionGraph.value) {
      String dateStr = item["data"];
      DateTime date = DateTime.parse(dateStr);
      data.add(TimeSeriesSales(
          DateTime(date.year, date.month, date.day), item["pezzi"]));
    }

    return [
      charts.Series<TimeSeriesSales, DateTime>(
        id: 'Sales',
        colorFn: (_, __) => charts.ColorUtil.fromDartColor(primary),
        domainFn: (TimeSeriesSales sales, _) => sales.time,
        measureFn: (TimeSeriesSales sales, _) => sales.sales,
        seriesColor: charts.ColorUtil.fromDartColor(Colors.red),
        patternColorFn: (_, __) => charts.ColorUtil.fromDartColor(secondary),
        areaColorFn: (_, __) => charts.ColorUtil.fromDartColor(secondary),
        data: data,
      )
    ];
  }
}

//TODO: MOVE AWAY THIS CLASS

class TimeSeriesSales {
  final DateTime time;
  final int sales;

  TimeSeriesSales(this.time, this.sales);
}
