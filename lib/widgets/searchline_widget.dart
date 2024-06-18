import 'package:flutter/material.dart';

class ProjectSearchWidget extends StatefulWidget {
  @override
  _ProjectSearchWidgetState createState() => _ProjectSearchWidgetState();
}

class _ProjectSearchWidgetState extends State<ProjectSearchWidget> {
  final TextEditingController _controller = TextEditingController();

  void _searchProject() {
    String projectName = _controller.text;
    // Здесь вы можете добавить код для поиска проекта
    print('Ищем проект: $projectName');
    // Для примера выведем текст в SnackBar
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Ищем проект: $projectName'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Введите название проекта',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          SizedBox(width: 10),
          ElevatedButton(
            onPressed: _searchProject,
            child: Text('Поиск'),
          ),
        ],
      ),
    );
  }
}