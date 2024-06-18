import 'package:flutter/material.dart';
import 'package:recrutterapp/widgets/selectioncriter_widget.dart';
import 'package:recrutterapp/widgets/criteriontable_widget.dart';

class SearchWidget extends StatelessWidget {
  final Function(bool) onVisibilityChanged;
  // final Function() onShowTable;
  // final Function() onHideTable;

  SearchWidget({required this.onVisibilityChanged});

  final TextEditingController _controller = TextEditingController();

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
            onPressed: () {
              onVisibilityChanged(true);
            },
            child: Text('Поиск'),
          ),

        ],
      ),
    );
  }
}