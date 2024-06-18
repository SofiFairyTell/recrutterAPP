import 'package:flutter/material.dart';

class CriterionTable extends StatefulWidget {

  @override
  _CriterionTableState  createState() => _CriterionTableState ();
}

class _CriterionTableState  extends State<CriterionTable> {
  final List<Map<String, dynamic>> _data = [
    {'name': 'Критерий 1', 'selected': false},
    {'name': 'Критерий 2', 'selected': false},
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        columns: [
          DataColumn(label: Text('Критерий')),
          DataColumn(label: Text('Выбрать')),
        ],
        rows: _data.map((item) {
          return DataRow(
            cells: [
              DataCell(Text(item['crit'])),
              DataCell(
                Checkbox(
                  value: item['selected'],
                  onChanged: (bool? value) {
                    setState(() {
                      item['selected'] = value!;
                    });
                  },
                ),
              ),
            ],
          );
        }).toList(),
      ),
    );
  }
}
