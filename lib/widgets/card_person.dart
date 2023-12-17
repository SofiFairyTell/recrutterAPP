import 'package:flutter/material.dart';
import 'package:recrutterapp/widgets/card_widget.dart';


class PersonData extends CardData {
  final String role;
  final String id;
  final Icon icon;

  PersonData({
    required String title,
    required String description,
    required this.role,
    required this.id,
    required this.icon,
  }) : super(title: title, description: description);
}

class PersonWidget extends CardWidget {
  final PersonData personData;
  final void Function()? onPressed;

  PersonWidget (this.onPressed, {
    Key? key,
    required this.personData, required title, required description,
  }) : super(
    key: key,
    title: personData.title,
    description: personData.role,
    imageUrl: personData.imageUrl,
    onPressed: onPressed,
  );

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xFFB9C2D7),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: FlutterLogo(),
            title: Text(
              personData.title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('ID: ${personData.id}'),
                Text('Роль:'),
                Chip(
                  label: Text(personData.title, style: TextStyle(color: Colors.white)),
                  backgroundColor: Colors.brown,
                ),
              ],
            ),
            trailing: PopupMenuButton(
              itemBuilder: (context) => [
                PopupMenuItem(child: Text('Профиль')),
                PopupMenuItem(child: Text('Проекты')),
                /// to-do нажатие на выбранные Задачи - выводит список задач только по выбранному проекту
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(personData.description),
          ),
        ],
      ),
    );
  }
}
