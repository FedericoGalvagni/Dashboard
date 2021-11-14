import 'package:flutter/material.dart';
import 'package:interface_example1/constants/style.dart';
import 'package:interface_example1/data_models/config.dart';
import 'package:interface_example1/data_models/parameters_data.dart';
import 'package:interface_example1/widgets/custom_text.dart';

class ParametersView extends StatelessWidget {
  const ParametersView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Parameter> list;
    int groupIndex;
    int actuatorIndex;
    var parts = treeviewKey.value.split('.');
    var a = parts[0].trim();
    var b = parts.sublist(1).join('.').trim();

    if (a == "") {
      return Container();
    } else {
      groupIndex = int.parse(a);
      actuatorIndex = int.parse(b);
      list = parameter
          .motorParameters[groupIndex].motorList[actuatorIndex].parameters;

      return SizedBox(
          width: 600,
          child: DataTable(
              columns: [
                DataColumn(
                    label: CustomText(
                  text: "Index",
                  size: 20,
                  color: dark,
                  weight: FontWeight.w600,
                )),
                DataColumn(
                    label: CustomText(
                  text: "Parameter",
                  size: 20,
                  color: dark,
                  weight: FontWeight.w600,
                )),
                DataColumn(
                    label: CustomText(
                  text: "Value",
                  size: 20,
                  color: dark,
                  weight: FontWeight.w600,
                ))
              ],
              rows: _buildRow(
                  list)));
    }
  }

  List<DataRow> _buildRow(List<Parameter> list) {
    List<DataRow> row = [];
    int i = 0;
    for (var item in list) {
      row.add(DataRow(cells: [
        DataCell(Text(i.toString())),
        DataCell(Text(item.name)),
        DataCell(
          //Text(user.firstName),
          SizedBox(
            width: 50,
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                  label: Center(
                    child: CustomText(
                text: item.value,
                color: dark,
              ),
                  )),
              
            ),
          ),
        ),
      ]));
      i++;
    }
    return row;
  }
}
