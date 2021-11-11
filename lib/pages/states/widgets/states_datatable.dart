// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:interface_example1/data/states_data.dart';

class DataTableD extends StatefulWidget {
  @override
  DataTableDState createState() => DataTableDState();

  static void setState(Null Function() param0) {
    DataTableDState();
  }
}

class DataTableDState extends State<DataTableD> {
  DataTableDState({Key? key});
  bool _isAscending = true;
  int _currentSortColumn = 0;
  // The value of the default itemPerPage must be present in the
  // availableRowsPerPage list
  ValueNotifier<int> itemPerPage = ValueNotifier<int>(10);
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: itemPerPage,
        builder: (context, value, widget) {
          return PaginatedDataTable(
            sortColumnIndex: _currentSortColumn,
            sortAscending: _isAscending,
            onRowsPerPageChanged: (v) {
              setState(() {
                itemPerPage.value = v ?? 10;
              });
            },
            availableRowsPerPage: [5, 10, 25, 50, 100],
            rowsPerPage: itemPerPage.value,
            columns: [
              DataColumn(
                  label: Text(comandsHeaders[0].toString()),
                  // Sorting function
                  onSort: (columnIndex, _) {
                    setState(() {
                      _currentSortColumn = columnIndex;
                      if (_isAscending == true) {
                        print("false");
                        _isAscending = false;
                        // sort the product list in Ascending, order by time
                        comandsList.value.sort((productA, productB) =>
                            productB.time.compareTo(productA.time));
                      } else {
                        print("true");
                        _isAscending = true;
                        // sort the product list in Descending, order by time
                        comandsList.value.sort((productA, productB) =>
                            productA.time.compareTo(productB.time));
                      }
                    });
                  }),
              DataColumn(
                  label: Text(comandsHeaders[1].toString()), // Sorting function
                  onSort: (columnIndex, _) {
                    setState(() {
                      _currentSortColumn = columnIndex;
                      if (_isAscending == true) {
                        print("false");
                        _isAscending = false;
                        // sort the product list in Ascending, order by time
                        comandsList.value.sort((productA, productB) =>
                            productB.id.compareTo(productA.id));
                      } else {
                        print("true");
                        _isAscending = true;
                        // sort the product list in Descending, order by time
                        comandsList.value.sort((productA, productB) =>
                            productA.id.compareTo(productB.id));
                      }
                    });
                  }),
              DataColumn(
                  label: Text(comandsHeaders[2].toString()), // Sorting function
                  onSort: (columnIndex, _) {
                    setState(() {
                      _currentSortColumn = columnIndex;
                      if (_isAscending == true) {
                        print("false");
                        _isAscending = false;
                        // sort the product list in Ascending, order by time
                        comandsList.value.sort((productA, productB) =>
                            productB.action.compareTo(productA.action));
                      } else {
                        print("true");
                        _isAscending = true;
                        // sort the product list in Descending, order by time
                        comandsList.value.sort((productA, productB) =>
                            productA.action.compareTo(productB.action));
                      }
                    });
                  }),
              DataColumn(
                  label: Text(comandsHeaders[3].toString()), // Sorting function
                  onSort: (columnIndex, _) {
                    setState(() {
                      _currentSortColumn = columnIndex;
                      if (_isAscending == true) {
                        print("false");
                        _isAscending = false;
                        // sort the product list in Ascending, order by time
                        comandsList.value.sort((productA, productB) => productB
                            .description
                            .compareTo(productA.description));
                      } else {
                        print("true");
                        _isAscending = true;
                        // sort the product list in Descending, order by time
                        comandsList.value.sort((productA, productB) => productA
                            .description
                            .compareTo(productB.description));
                      }
                    });
                  }),
              DataColumn(
                  label: Text(comandsHeaders[4].toString()), // Sorting function
                  onSort: (columnIndex, _) {
                    setState(() {
                      _currentSortColumn = columnIndex;
                      if (_isAscending == true) {
                        print("false");
                        _isAscending = false;
                        // sort the product list in Ascending, order by time
                        comandsList.value.sort((productA, productB) =>
                            productB.user.compareTo(productA.user));
                      } else {
                        print("true");
                        _isAscending = true;
                        // sort the product list in Descending, order by time
                        comandsList.value.sort((productA, productB) =>
                            productA.user.compareTo(productB.user));
                      }
                    });
                  }),
            ],
            source: _DataSource(context),
          );
        });
  }
}

class _DataSource extends DataTableSource {
  final BuildContext context;
  final int _selectedCount = 0;

  _DataSource(this.context);

  @override
  DataRow? getRow(int index) {
    assert(index >= 0);
    final row = comandsList.value[index];

    return DataRow.byIndex(
      /*selected: row.selected,
      onSelectChanged: (selected) {
        row.selected = !row.selected;
        print("ostia");
      },*/
      index: index,
      /*onSelectChanged: (value) {
        if (row.selected != value) {
          _selectedCount += value ? 1 : -1;
          assert(_selectedCount >= 0);
          row.selected = value;
          notifyListeners();
        }
      },*/

      cells: _buildCells(row),
    );
  }

  List<DataCell> _buildCells(final row) {
    List<DataCell> dataCell;
    if (comandsList.value.length > 0) {
      return dataCell = [
        DataCell(Text(row.time ?? "")),
        DataCell(Text(row.id ?? "")),
        DataCell(Text(row.action ?? "")),
        DataCell(Text(row.description ?? "")),
        DataCell(Text(row.user ?? "")),
      ];
    } else {
      return dataCell = [
        DataCell(Text("")),
        DataCell(Text("")),
        DataCell(Text("")),
        DataCell(Text("")),
        DataCell(Text("")),
      ];
    }
  }

  @override
  int get rowCount => comandsList.value.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => _selectedCount;
}
