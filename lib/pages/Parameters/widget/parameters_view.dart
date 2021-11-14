import 'package:flutter/material.dart';
import 'package:interface_example1/constants/style.dart';
import 'package:interface_example1/data_models/parameters_data.dart';
import 'package:interface_example1/widgets/custom_text.dart';
import 'package:interface_example1/widgets/editable_textfield.dart';

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
          child: DataTable(columns: [
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
          ], rows: _buildRow(list)));
    }
  }

  List<DataRow> _buildRow(List<Parameter> list) {
    List<DataRow> row = [];
    List<EditableTextState> a;

    for (int i = 0; i < list.length; i++) {
      TextEditingController temp;
      temp = TextEditingController(text: list[i].value.toString());
      debugPrint(i.toString());
      row.add(DataRow(cells: [
        DataCell(Text(i.toString())),
        DataCell(Text(list[i].name)),
        DataCell(
          SizedBox(
            width: 50,
            child: EditableTextField(
              initialText: list[i].value,
              isEditingText: false,
              editingController: temp,
              newValue: (st) {
                parameter.motorParameters[groupIndex].motorList[actuatorIndex]
                    .parameters[i].value = st;
              },
            ),
          ),
        ),
      ]));
    }
    return row;
  }
}
