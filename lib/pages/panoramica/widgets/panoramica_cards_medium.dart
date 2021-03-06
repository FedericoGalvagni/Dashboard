import 'package:flutter/material.dart';
import 'package:interface_example1/classes/modelli/panoramica_data.dart';
import 'package:interface_example1/constants/style.dart';
import 'package:interface_example1/widgets/custom/default_line_chart.dart';
import 'package:interface_example1/widgets/spacer/medium_horizontal_spacer.dart';
import 'package:interface_example1/widgets/spacer/medium_vertical_spacer.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'info_card.dart';

class PanoramicaCardsMedium extends StatelessWidget {
  const PanoramicaCardsMedium({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.only(left: _width / 64, right: _width / 64),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(children: [
            MediumVSpacer(),
          ]),
          Row(
            children: [
              ValueListenableBuilder(
                  valueListenable: produzioneTotale,
                  builder: (context, value, widget) {
                    return InfoCard(
                      height: 136,
                      title: "Produzione totale",
                      value: produzioneTotale.value.toString(),
                      onTap: () {},
                    );
                  }),
              MediumHSpacer(),
              ValueListenableBuilder(
                  valueListenable: produzioneUltime24h,
                  builder: (context, value, widget) {
                    return InfoCard(
                      height: 136,
                      title: "Produzione ultime 24h",
                      value: produzioneUltime24h.value.toString(),
                      onTap: () {},
                    );
                  }),
              MediumHSpacer(),
              ValueListenableBuilder(
                  valueListenable: produzioneMediaGiornaliera,
                  builder: (context, value, widget) {
                    return InfoCard(
                      height: 136,
                      title: "Produzione media giornaliera",
                      value: produzioneMediaGiornaliera.value.toString(),
                      onTap: () {},
                    );
                  }),
              MediumHSpacer(),
              ValueListenableBuilder(
                  valueListenable: produzioneMediaOraria,
                  builder: (context, value, widget) {
                    return InfoCard(
                      height: 136,
                      title: "Produzione media oraria",
                      value: produzioneMediaOraria.value.toString(),
                      onTap: () {},
                    );
                  }),
            ],
          ),
          Row(children: [MediumVSpacer()]),
          Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: surface(4),
                  ),
                  height: 600,
                  child: ValueListenableBuilder(
                      valueListenable: productionGraph,
                      builder: (context, value, widget) {
                        return Container(
                          margin: const EdgeInsets.all(15),
                          child: SimpleTimeSeriesChart(
                            _createSampleData(),
                            duration: const Duration(milliseconds: 1500),
                            // Disable animations for image tests.
                            animate: true,
                          ),
                        ); //_graphs();
                      }),
                ),
              ),
            ],
          ),
          //Container(width: 600, height: 600, child: PanoramicaRadarChart())
        ],
      ),
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

class TimeSeriesSales {
  final DateTime time;
  final int sales;

  TimeSeriesSales(this.time, this.sales);
}
