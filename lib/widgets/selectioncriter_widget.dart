import 'package:flutter/material.dart';

class ProjectTable extends StatefulWidget {


  @override
  _ProjectTableState createState() => _ProjectTableState();
}

class _ProjectTableState extends State<ProjectTable> {
  final List<Map<String, dynamic>> _data = [
    {'name': 'Иванов Иван', 'score': 90, 'selected': false},
    {'name': 'Петров Петр', 'score': 85, 'selected': false},
    {'name': 'Сидоров Сидор', 'score': 78, 'selected': false},
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
              DataCell(Text(item['name'])),
              DataCell(Text(item['score'].toString())),
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
              DataCell(
                IconButton(
                  icon: Icon(Icons.arrow_forward),
                  onPressed: () {
                    // Действие при нажатии на кнопку-стрелку
                    print('Перейти по ${item['name']}');
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
