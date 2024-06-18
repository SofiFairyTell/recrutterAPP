import 'package:flutter/material.dart';

class RecommendationTable extends StatefulWidget {
  final bool isShow;

  RecommendationTable({super.key, required this.isShow});

  @override
  _RecommendationTableState createState() => _RecommendationTableState();
}

class _RecommendationTableState extends State<RecommendationTable> {
  final List<Map<String, dynamic>> _data = [
    {'name': 'Привалова И', 'score': 90, 'selected': false},
    {'name': 'Костенко А', 'score': 85, 'selected': false},
    {'name': 'Шаповалов Е', 'score': 78, 'selected': false},
  ];

  @override
  Widget build(BuildContext context) {
    if (!widget.isShow) {
      return SizedBox.shrink(); // Если таблица не видима, возвращаем пустой контейнер
    }
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        columns: [
          DataColumn(label: Text('ФИО')),
          DataColumn(label: Text('Оценка (НВП)')),
          DataColumn(label: Text('Выбрать')),
          DataColumn(label: Text('...')),
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
