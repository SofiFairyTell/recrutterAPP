import 'package:flutter/material.dart';
import 'package:recrutterapp/screens/candidat_screen.dart';
import 'package:recrutterapp/screens/selection_screen.dart';
import 'package:recrutterapp/widgets/card_widget.dart';


class ProjectData extends CardData {
  final String startDate;
  final String endDate;
  final Icon icon;

  ProjectData({
    required String title,
    required String description,
    required this.startDate,
    required this.endDate,
    required this.icon,
  }) : super(title: title, description: description);
}

class ProjectWidget extends CardWidget {
  final ProjectData projectData;
  @override
  final void Function()? onPressed;

  ProjectWidget (this.onPressed, {
    Key? key,
    required this.projectData, required title, required description,
  }) : super(
    key: key,
    title: projectData.title,
    description: projectData.description,
    imageUrl: projectData.imageUrl,
    onPressed: onPressed,
  );

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFFB9C2D7),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: const FlutterLogo(),
            title: Text(
              projectData.title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Start: ${projectData.startDate}'),
                Text('End: ${projectData.endDate}'),
                Chip(
                  label: Text(projectData.title, style: const TextStyle(color: Colors.white)),
                  backgroundColor: Colors.brown,
                ),
              ],
            ),
            trailing: PopupMenuButton<String>(
              onSelected: (String result) {
                if (result == 'selection') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SelectionScreen()),
                  );
                }
              },
              itemBuilder: (context) => [
                const PopupMenuItem(child: Text('О проекте')),
                const PopupMenuItem(child: Text('Задачи проекта')),
                const PopupMenuItem(value:'selection',child: Text('Подобрать кандидата')),
                /// to-do нажатие на выбранные Задачи - выводит список задач только по выбранному проекту
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(projectData.description),
          ),
        ],
      ),
    );
  }
}
