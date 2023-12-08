import 'package:flutter/material.dart';
import 'package:recrutterapp/widgets/AppBarCustom.dart';
import '../model/Redmine/Issue.dart';
import '../widgets/card_project.dart';
import '../widgets/drawer_widget.dart';
import '../widgets/card_widget.dart';

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

// Пример преобразования списка Issue в список ProjectData
List<ProjectData> convertIssuesToProjectDataList(List<Issue> issues) {
  return issues.map((issue) {
    return ProjectData(
      title: issue.project,
      description: issue.subject ?? '', // Замените на соответствующее поле из Issue
      icon:     IconData(issue.subject.hashCode, fontFamily: 'MaterialIcons'),
      startDate: issue.createdOn,
      endDate: '',
    );
  }).toList();
}


class ProjectsScreen extends StatelessWidget {
  ProjectsScreen({required this.issues});

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final List<Issue> issues;

  @override
  Widget build(BuildContext context) {
    List<ProjectData> projectDataList = convertIssuesToProjectDataList(issues);

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBarCustom(scaffoldKey:scaffoldKey, key: null,),
      backgroundColor: Colors.white,
      body:  ListView.builder(
        itemCount: issues.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(issues[index].project),
            subtitle: Text('Project: ${issues[index].subject},Date:${issues[index].createdOn}'),
          );
        },),
      drawer: DrawerWidget(),
    );
  }

  Widget buildMultipleCardWidgets(List<ProjectData> ProjectDataList) {
    return Column(
      children: ProjectDataList.map((cardData) {
        return CardWidget(
          title: cardData.title,
          description: cardData.description,
          imageUrl: cardData.imageUrl, key: null,
        );
      }).toList(),
    );
  }

  PreferredSizeWidget buildCustomAppBarWithActions() {
    return PreferredSize(
      preferredSize: Size.fromHeight(kToolbarHeight),
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            toolbarHeight: kToolbarHeight,
            actions: [
              IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  // Заглушка для обработки нажатия на кнопку "Добавить"
                  print('Нажата кнопка "Добавить"');
                },
              ),
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  // Заглушка для обработки нажатия на кнопку "Искать"
                  print('Нажата кнопка "Искать"');
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

