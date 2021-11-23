import 'package:flutter/material.dart';
import 'package:interface_example1/constants/style.dart';
import 'package:interface_example1/data_models/parameters_data.dart';
import 'package:interface_example1/widgets/custom/custom_text.dart';
import 'package:interface_example1/widgets/custom/editable_textfield.dart';

class ParametersView extends StatefulWidget {
  final String treeviewKey;
  const ParametersView({Key? key, required this.treeviewKey}) : super(key: key);

  @override
  State<ParametersView> createState() => _ParametersViewState();
}

class _ParametersViewState extends State<ParametersView> {
  int groupIndex = -1;
  int actuatorIndex = -1;
  @override
  Widget build(BuildContext context) {
    List<Parameter> list;

    var parts = widget.treeviewKey.split('.');
    var a = parts[0].trim();
    var b = parts.sublist(1).join('.').trim();

    if (a.isEmpty) {
      return Container();
    } else {
      groupIndex = int.parse(a);
      actuatorIndex = int.parse(b);
      list = parameter
          .motorParameters[groupIndex].motorList[actuatorIndex].parameters;

      return SizedBox(
          width: 600,
          child: Theme(
            data: ThemeData(dividerColor: divider),
            child: DataTable(columns: [
              DataColumn(
                  label: Center(
                child: CustomText(
                  align: TextAlign.center,
                  text: "Index",
                  size: 20,
                  color: getEmphasis(textOnSurface, emphasis.high),
                  weight: FontWeight.w600,
                ),
              )),
              DataColumn(
                  label: Center(
                child: CustomText(
                  align: TextAlign.center,
                  text: "Parameter",
                  size: 20,
                  color: getEmphasis(textOnSurface, emphasis.high),
                  weight: FontWeight.w600,
                ),
              )),
              DataColumn(
                  label: Center(
                child: CustomText(
                  align: TextAlign.center,
                  text: "Value",
                  size: 20,
                  color: getEmphasis(textOnSurface, emphasis.high),
                  weight: FontWeight.w600,
                ),
              )),
              DataColumn(
                  label: Center(
                child: CustomText(
                  align: TextAlign.center,
                  text: "State",
                  size: 20,
                  color: getEmphasis(textOnSurface, emphasis.high),
                  weight: FontWeight.w600,
                ),
              ))
            ], rows: _buildRow(list)),
          ));
    }
  }

  List<DataRow> _buildRow(List<Parameter> list) {
    List<DataRow> row = [];

    for (int i = 0; i < list.length; i++) {
      TextEditingController temp;
      temp = TextEditingController(text: list[i].value.toString());
      debugPrint(i.toString());
      row.add(DataRow(cells: [
        DataCell(Center(
          child: CustomText(
            align: TextAlign.center,
            text: i.toString(),
            color: getEmphasis(textOnSurface, emphasis.high),
          ),
        )),
        DataCell(Center(
          child: CustomText(
            align: TextAlign.center,
            text: list[i].name,
            color: getEmphasis(textOnSurface, emphasis.high),
          ),
        )),
        DataCell(
          Center(
            child: Container(
              margin: const EdgeInsets.only(top: 5, bottom: 5),
              child: EditableTextField(
                align: TextAlign.center,
                initialText: list[i].value,
                color: getEmphasis(textOnSurface, emphasis.high),
                editingController: temp,
                newValue: (newvalue) {
                  parameter.motorParameters[groupIndex].motorList[actuatorIndex]
                      .parameters[i].value = newvalue;
                  setState(() {});
                },
              ),
            ),
          ),
        ),
        DataCell(Center(
          child: _getChild(originalParameter.motorParameters[groupIndex]
                  .motorList[actuatorIndex].parameters[i].value ==
              list[i].value),
        ))
      ]));
    }
    return row;
  }

  Widget _getChild(bool t) {
    if (t) {
      return const Icon(
        Icons.check_circle,
        color: Colors.green,
        size: 20,
      );
    } else {
      return Icon(
        Icons.published_with_changes,
        color: Colors.amber.shade700,
        size: 20,
      );
    }
  }
}
