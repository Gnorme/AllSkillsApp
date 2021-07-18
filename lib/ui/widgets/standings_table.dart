import 'package:flutter/material.dart';
import 'package:data_table_2/data_table_2.dart';

class StandingsTable extends StatelessWidget {
  const StandingsTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return DataTable2(
      headingTextStyle: TextStyle(
          color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
      horizontalMargin: 10,
      dataRowColor: MaterialStateProperty.all<Color>(Colors.white),
      columnSpacing: 0,
      columns: <DataColumn>[
        DataColumn2(size: ColumnSize.S, label: Container(child: Text('Rank'))),
        DataColumn2(size: ColumnSize.L, label: Text('Name')),
        DataColumn2(size: ColumnSize.S, label: Text('Wins')),
        DataColumn2(size: ColumnSize.M, label: Text('Matches')),
        DataColumn2(size: ColumnSize.S, label: Text('Points')),
      ],
      rows: [
        DataRow(cells: [
          DataCell(Text('1')),
          DataCell(Text('Christopher Thompson')),
          DataCell(Text('10')),
          DataCell(Text('15')),
          DataCell(Text('100'))
        ]),
        DataRow(cells: [
          DataCell(Text('1')),
          DataCell(Text('Christopher Thompson')),
          DataCell(Text('10')),
          DataCell(Text('15')),
          DataCell(Text('100'))
        ]),
        DataRow(cells: [
          DataCell(Text('1')),
          DataCell(Text('Christopher Thompson')),
          DataCell(Text('10')),
          DataCell(Text('15')),
          DataCell(Text('100'))
        ]),
        DataRow(cells: [
          DataCell(Text('1')),
          DataCell(Text('Christopher Thompson')),
          DataCell(Text('10')),
          DataCell(Text('15')),
          DataCell(Text('100'))
        ]),
        DataRow(cells: [
          DataCell(Text('1')),
          DataCell(Text('Christopher Thompson')),
          DataCell(Text('10')),
          DataCell(Text('15')),
          DataCell(Text('100'))
        ]),
        DataRow(cells: [
          DataCell(Text('1')),
          DataCell(Text('Christopher Thompson')),
          DataCell(Text('10')),
          DataCell(Text('15')),
          DataCell(Text('100'))
        ]),
        DataRow(cells: [
          DataCell(Text('1')),
          DataCell(Text('Christopher Thompson')),
          DataCell(Text('10')),
          DataCell(Text('15')),
          DataCell(Text('100'))
        ]),
        DataRow(cells: [
          DataCell(Text('1')),
          DataCell(Text('Christopher Thompson')),
          DataCell(Text('10')),
          DataCell(Text('15')),
          DataCell(Text('100'))
        ]),
        DataRow(cells: [
          DataCell(Text('1')),
          DataCell(Text('Christopher Thompson')),
          DataCell(Text('10')),
          DataCell(Text('15')),
          DataCell(Text('100'))
        ]),
        DataRow(cells: [
          DataCell(Text('1')),
          DataCell(Text('Christopher Thompson')),
          DataCell(Text('10')),
          DataCell(Text('15')),
          DataCell(Text('100'))
        ]),
        DataRow(cells: [
          DataCell(Text('1')),
          DataCell(Text('Christopher Thompson')),
          DataCell(Text('10')),
          DataCell(Text('15')),
          DataCell(Text('100'))
        ]),
      ],
    );
  }
}
