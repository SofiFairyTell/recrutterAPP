import 'package:flutter/material.dart';
import 'package:recrutterapp/widgets/selectioncriter_widget.dart';
import 'package:recrutterapp/widgets/criteriontable_widget.dart';

class SearchWidget extends StatelessWidget {
  final Function(bool) onVisibilityChanged;

  final String searchTitle;
  // final Function() onShowTable;
  // final Function() onHideTable;

  SearchWidget({required this.onVisibilityChanged, required this.searchTitle});

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
                labelText: searchTitle,
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