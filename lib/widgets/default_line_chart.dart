import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:interface_example1/constants/style.dart';

class SimpleTimeSeriesChart extends StatelessWidget {
  final List<charts.Series<dynamic, DateTime>> seriesList;
  final bool animate;

  SimpleTimeSeriesChart(this.seriesList, {this.animate = false});

  @override
  Widget build(BuildContext context) {
    return charts.TimeSeriesChart(
      seriesList,
      
      domainAxis: charts.DateTimeAxisSpec(
          renderSpec: charts.SmallTickRendererSpec(

              // Tick and Label styling here.
              labelStyle: charts.TextStyleSpec(
                  fontSize: 18, // size in Pts.
                  color: charts.ColorUtil.fromDartColor(textOnBackground)),

              // Change the line colors to match text color.
              lineStyle: charts.LineStyleSpec(
                  color: charts.ColorUtil.fromDartColor(divider),))),
       /// Assign a custom style for the measure axis.
      primaryMeasureAxis: charts.NumericAxisSpec(
          renderSpec: charts.GridlineRendererSpec(

              // Tick and Label styling here.
              labelStyle: charts.TextStyleSpec(
                  fontSize: 18, // size in Pts.
                  color: charts.ColorUtil.fromDartColor(textOnBackground),),

              // Change the line colors to match text color.
              lineStyle: charts.LineStyleSpec(
                  color: charts.ColorUtil.fromDartColor(divider),))),
      animate: animate,
      // Optionally pass in a [DateTimeFactory] used by the chart. The factory
      // should create the same type of [DateTime] as the data provided. If none
      // specified, the default creates local date time.
      dateTimeFactory: const charts.LocalDateTimeFactory(),
    );
  }
}
