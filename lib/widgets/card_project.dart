import 'package:flutter/material.dart';
import 'package:recrutterapp/widgets/card_widget.dart';


class ProjectData extends CardData {
  final String startDate;
  final String endDate;
  final IconData icon;

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
  final void Function()? onPressed;

  ProjectWidget (this.onPressed, {
    Key? key,
    required this.projectData, required String title, required String description,
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
      color: Color(0xFFB9C2D7),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: Icon(projectData.icon, size: 32),
            title: Text(
              projectData.title,
              style: TextStyle(
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
                  label: Text(projectData.title, style: TextStyle(color: Colors.white)),
                  backgroundColor: Colors.brown,
                ),
              ],
            ),
            trailing: PopupMenuButton(
              itemBuilder: (context) => [
                PopupMenuItem(child: Text('View Project')),
                PopupMenuItem(child: Text('View Details')),
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
