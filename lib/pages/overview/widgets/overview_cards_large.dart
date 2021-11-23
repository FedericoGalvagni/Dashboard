import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:interface_example1/constants/style.dart';
import 'package:interface_example1/data_models/overview_data.dart';
import 'package:interface_example1/pages/overview/widgets/info_card.dart';
import 'package:interface_example1/widgets/custom/custom_text.dart';
import 'package:interface_example1/widgets/custom/default_line_chart.dart';

class OverviewCardsLarge extends StatelessWidget {
  const OverviewCardsLarge({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final data = [
      TimeSeriesSales(DateTime(2017, 9, 19), 5),
      TimeSeriesSales(DateTime(2017, 9, 26), 25),
      TimeSeriesSales(DateTime(2017, 10, 3), 100),
      TimeSeriesSales(DateTime(2017, 10, 10), 75),
    ];

    double _width = MediaQuery.of(context).size.width;
    final List<charts.Series<dynamic, DateTime>> seriesList = [];
    return Container(
      margin: EdgeInsets.only(left: _width / 64, right: _width / 64),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(children: [
            Container(
              height: _width / 64,
            )
          ]),
          Row(
            children: [
              ValueListenableBuilder(
                  valueListenable: produzioneTotale,
                  builder: (context, value, widget) {
                    return InfoCard(
                      title: "Produzione totale",
                      value: produzioneTotale.value.toString(),
                      onTap: () {},
                    );
                  }),
              SizedBox(
                width: _width / 64,
              ),
              ValueListenableBuilder(
                  valueListenable: produzioneUltime24h,
                  builder: (context, value, widget) {
                    return InfoCard(
                      title: "Produzione ultime 24h",
                      value: produzioneUltime24h.value.toString(),
                      onTap: () {},
                    );
                  }),
              SizedBox(
                width: _width / 64,
              ),
              ValueListenableBuilder(
                  valueListenable: produzioneMediaGiornaliera,
                  builder: (context, value, widget) {
                    return InfoCard(
                      title: "Produzione media giornaliera",
                      value: produzioneMediaGiornaliera.value.toString(),
                      onTap: () {},
                    );
                  }),
              SizedBox(
                width: _width / 64,
              ),
              ValueListenableBuilder(
                  valueListenable: produzioneMediaOraria,
                  builder: (context, value, widget) {
                    return InfoCard(
                      title: "Produzione media oraria",
                      value: produzioneMediaOraria.value.toString(),
                      onTap: () {},
                    );
                  }),
            ],
          ),
          Row(children: [
            Container(
              height: _width / 64,
            )
          ]),
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
                          margin: EdgeInsets.all(15),
                          child: SimpleTimeSeriesChart(
                            _createSampleData(),
                            duration: Duration(milliseconds: 1000),
                            // Disable animations for image tests.
                            animate: true,
                          ),
                        ); //_graphs();
                      }),
                ),
              ),
            ],
          ),
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

//TODO: MOVE AWAY THIS CLASS

class TimeSeriesSales {
  final DateTime time;
  final int sales;

  TimeSeriesSales(this.time, this.sales);
}
