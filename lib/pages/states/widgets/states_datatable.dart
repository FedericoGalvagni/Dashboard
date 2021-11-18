import 'package:flutter/material.dart';
import 'package:interface_example1/classes/http/tool.dart';
import 'package:interface_example1/data_models/config.dart';
import 'package:interface_example1/widgets/custom_text.dart';

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
      valueListenable: row,
      builder: (context, value, widget) {
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
                  columns: _buildColumns(),
                  source: _DataSource(context),
                  columnSpacing: 0);
            });
      }
    );
  }

  List<DataColumn> _buildColumns() {
    List<DataColumn> columns = [];
    Map<String, dynamic> headers = row.value[0];
    (headers as Map<String, dynamic>).forEach((key, value) {
      columns.add(DataColumn(
          label: CustomText(
            text: key,
            size: 12,
            weight: FontWeight.w600,
          ),
          onSort: (columnIndex, a) {
            setState(() {
              _currentSortColumn = columnIndex;
              print(columnIndex);
              if (_isAscending == true) {
                _isAscending = false;
                print(_isAscending);
                // sort the product list in Ascending, order by time
                row.value.sort((itemA, itemB) {
                  if (Tool.isNumeric(itemA[key].toString()) &&
                      Tool.isNumeric(itemB[key].toString())) {
                    return itemB[key].compareTo(itemA[key]);
                  } else {
                    return itemB[key].compareTo(itemA[key]);
                  }
                });
              } else {
                _isAscending = true;

                row.value.sort((itemA, itemB) {
                  if (Tool.isNumeric(itemA[key].toString()) &&
                      Tool.isNumeric(itemB[key].toString())) {
                    return itemA[key].compareTo(itemB[key]);
                  } else {
                    return itemA[key].compareTo(itemB[key]);
                  }
                });
              }
            });
          }));
    });
    return columns;
  }

  List<DataRow> _buildRows() {
    /// iterazione all'interno della lista di jsonMap [row], chiamata
    /// al metodo [_buildCells]
    List<DataRow> columns = [];
    for (var item in row.value) {
      columns.add(DataRow(cells: _buildCells(item)));
    }
    return columns;
  }

  List<DataCell> _buildCells(Map<String, dynamic> element) {
    List<DataCell> cells = [];

    (element as Map<String, dynamic>).forEach((key, value) {
      cells.add(DataCell(Text(value)));
    });

    return cells;
  }
}

class _DataSource extends DataTableSource {
  final BuildContext context;
  final int _selectedCount = 0;

  _DataSource(this.context);

  @override
  DataRow? getRow(int index) {
    assert(index >= 0);
    final rowT = row.value[index];

    return DataRow.byIndex(
      index: index,
      cells: _buildCells(rowT),
    );
  }

  List<DataCell> _buildCells(final element) {
    List<DataCell> cells = [];

    (element as Map<String, dynamic>).forEach((key, value) {
      cells.add(DataCell(Text(value.toString())));
    });

    return cells;
  }

  @override
  int get rowCount => row.value.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => _selectedCount;
}

//NON ELIMINARE!!!!!!!!!
  /*return PaginatedDataTable(
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
        });*/
