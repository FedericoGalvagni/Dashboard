import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:interface_example1/constants/style.dart';

class SimpleTimeSeriesChart extends StatelessWidget {
  final List<charts.Series<dynamic, DateTime>> seriesList;
  final bool? animate;
  final Duration? duration;
  // ignore: use_key_in_widget_constructors
  const SimpleTimeSeriesChart(
    this.seriesList, {
    this.animate,
    this.duration,
  });

  @override
  Widget build(BuildContext context) {
    return charts.TimeSeriesChart(
      seriesList,
      animationDuration: duration ?? const Duration(milliseconds: 1000),
      domainAxis: charts.DateTimeAxisSpec(
          renderSpec: charts.SmallTickRendererSpec(

              // Tick and Label styling here.
              labelStyle: charts.TextStyleSpec(
                  fontSize: 18, // size in Pts.
                  color: charts.ColorUtil.fromDartColor(onBackground)),

              // Change the line colors to match text color.
              lineStyle: charts.LineStyleSpec(
                color: charts.ColorUtil.fromDartColor(divider),
              ))),

      /// Assign a custom style for the measure axis.
      primaryMeasureAxis: charts.NumericAxisSpec(
          renderSpec: charts.GridlineRendererSpec(

              // Tick and Label styling here.
              labelStyle: charts.TextStyleSpec(
                fontSize: 18, // size in Pts.
                color: charts.ColorUtil.fromDartColor(onBackground),
              ),

              // Change the line colors to match text color.
              lineStyle: charts.LineStyleSpec(
                color: charts.ColorUtil.fromDartColor(divider),
              ))),
      animate: animate ?? false,
      // Optionally pass in a [DateTimeFactory] used by the chart. The factory
      // should create the same type of [DateTime] as the data provided. If none
      // specified, the default creates local date time.
      dateTimeFactory: const charts.LocalDateTimeFactory(),
    );
  }
}
