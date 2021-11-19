/// Package import
import 'package:flutter/material.dart';
import 'package:interface_example1/data_models/overview_data.dart';
import 'package:interface_example1/data_models/states_data.dart';

/// Chart import
import 'package:syncfusion_flutter_charts/charts.dart';

/// Local import

///Renders default line series chart
class LineChart extends StatefulWidget {
  ///Creates default line series chart
  const LineChart(Key key) : super(key: key);

  @override
  _LineDefaultState createState() => _LineDefaultState();
}

class _LineDefaultState extends State<LineChart> {
  @override
  Widget build(BuildContext context) {
    return _buildDefaultLineChart();
  }

  /// Get the cartesian chart with default line series
  SfCartesianChart _buildDefaultLineChart() {
    return SfCartesianChart(
      plotAreaBorderWidth: 0,
      title: ChartTitle(text: ''),
      legend:
          Legend(isVisible: true, overflowMode: LegendItemOverflowMode.wrap),
      primaryXAxis: NumericAxis(
          edgeLabelPlacement: EdgeLabelPlacement.shift,
          interval: 2,
          majorGridLines: const MajorGridLines(width: 0)),
      primaryYAxis: NumericAxis(
          axisLine: const AxisLine(width: 0),
          majorTickLines: const MajorTickLines(color: Colors.transparent)),
      series: _getDefaultLineSeries(),
      tooltipBehavior: TooltipBehavior(enable: true),
    );
  }

  /// The method returns line series to chart.
  List<LineSeries<_ChartData, num>> _getDefaultLineSeries() {
    final List<_ChartData> chartData = _buildChartData();
    return <LineSeries<_ChartData, num>>[
      LineSeries<_ChartData, num>(
          animationDuration: 2500,
          dataSource: chartData,
          xValueMapper: (_ChartData sales, _) => sales.x,
          yValueMapper: (_ChartData sales, _) => sales.y,
          width: 2,
          name: 'Pezzi'),
      LineSeries<_ChartData, num>(
        animationDuration: 2500,
        dataSource: chartData,
        width: 2,
        name: 'Maschere',
        xValueMapper: (_ChartData sales, _) => sales.x,
        yValueMapper: (_ChartData sales, _) => sales.y2,
      )
    ];
  }

  List<_ChartData> _buildChartData() {
    List<_ChartData> chartData = [];
    dynamic item;
    int increment = (productionGraph.value.length / 20).round();
    debugPrint(productionGraph.value.length.toString());
    // TODO: risolvere il problema "troppi dati" dalla query e non dall'interfaccia
    for (int i = 0; i < productionGraph.value.length;) {
      item = productionGraph.value[i];
      chartData.add(_ChartData(item["ID"], item["nPezzi"], i));
      if (i + increment < productionGraph.value.length) {
        i = i + increment;
      } else {
        break;
      }
    } /*
    for (var item in productionGraph.value) {
      chartData
          .add(_ChartData(item["ID"], item["nPezzi"], item["nMaskCaricate"]));
    }*/

    return chartData;
  }
}

class _ChartData {
  _ChartData(this.x, this.y, this.y2);
  final double x;
  final double y;
  final int y2;
}
