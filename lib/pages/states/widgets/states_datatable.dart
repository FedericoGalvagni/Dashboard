import 'package:flutter/material.dart';
import 'package:interface_example1/data_models/states_data.dart';

class DataTableD extends StatefulWidget {
  const DataTableD({Key? key}) : super(key: key);

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

  /// The value of the default [itemPerPage] must be present in the
  /// availableRowsPerPage list
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
            availableRowsPerPage: const [5, 10, 25, 50, 100],
            rowsPerPage: itemPerPage.value,
            columns: [
              DataColumn(
                  label: Text(comandsHeaders[0].toString()),
                  // Sorting function
                  onSort: (columnIndex, _) {
                    setState(() {
                      _currentSortColumn = columnIndex;
                      if (_isAscending == true) {
                        _isAscending = false;
                        // sort the product list in Ascending, order by time
                        comandsList.value.sort(
                            (itemA, itemB) => itemB.time.compareTo(itemA.time));
                      } else {
                        _isAscending = true;
                        // sort the product list in Descending, order by time
                        comandsList.value.sort(
                            (itemA, itemB) => itemA.time.compareTo(itemB.time));
                      }
                    });
                  }),
              DataColumn(
                  label: Text(comandsHeaders[1].toString()), // Sorting function
                  onSort: (columnIndex, _) {
                    setState(() {
                      _currentSortColumn = columnIndex;
                      if (_isAscending == true) {
                        _isAscending = false;
                        // sort the product list in Ascending, order by id
                        comandsList.value.sort(
                            (itemA, itemB) => itemB.id.compareTo(itemA.id));
                      } else {
                        _isAscending = true;
                        // sort the product list in Descending, order by time
                        comandsList.value.sort(
                            (itemA, itemB) => itemA.id.compareTo(itemB.id));
                      }
                    });
                  }),
              DataColumn(
                  label: Text(comandsHeaders[2].toString()), // Sorting function
                  onSort: (columnIndex, _) {
                    setState(() {
                      _currentSortColumn = columnIndex;
                      if (_isAscending == true) {
                        _isAscending = false;
                        // sort the product list in Ascending, order by time
                        comandsList.value.sort((itemA, itemB) =>
                            itemB.action.compareTo(itemA.action));
                      } else {
                        _isAscending = true;
                        // sort the product list in Descending, order by time
                        comandsList.value.sort((itemA, itemB) =>
                            itemA.action.compareTo(itemB.action));
                      }
                    });
                  }),
              DataColumn(
                  label: Text(comandsHeaders[3].toString()), // Sorting function
                  onSort: (columnIndex, _) {
                    setState(() {
                      _currentSortColumn = columnIndex;
                      if (_isAscending == true) {
                        _isAscending = false;
                        // sort the product list in Ascending, order by time
                        comandsList.value.sort((itemA, itemB) =>
                            itemB.description.compareTo(itemA.description));
                      } else {
                        _isAscending = true;
                        // sort the product list in Descending, order by time
                        comandsList.value.sort((itemA, itemB) =>
                            itemA.description.compareTo(itemB.description));
                      }
                    });
                  }),
              DataColumn(
                  label: Text(comandsHeaders[4].toString()), // Sorting function
                  onSort: (columnIndex, _) {
                    setState(() {
                      _currentSortColumn = columnIndex;
                      if (_isAscending == true) {
                        _isAscending = false;
                        // sort the product list in Ascending, order by time
                        comandsList.value.sort(
                            (itemA, itemB) => itemB.user.compareTo(itemA.user));
                      } else {
                        _isAscending = true;
                        // sort the product list in Descending, order by time
                        comandsList.value.sort(
                            (itemA, itemB) => itemA.user.compareTo(itemB.user));
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
      index: index,
      cells: _buildCells(row),
    );
  }

  List<DataCell> _buildCells(final row) {
    if (comandsList.value.isNotEmpty) {
      return [
        DataCell(Text(row.time ?? "")),
        DataCell(Text(row.id ?? "")),
        DataCell(Text(row.action ?? "")),
        DataCell(Text(row.description ?? "")),
        DataCell(Text(row.user ?? "")),
      ];
    } else {
      return [
        const DataCell(Text("")),
        const DataCell(Text("")),
        const DataCell(Text("")),
        const DataCell(Text("")),
        const DataCell(Text("")),
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
