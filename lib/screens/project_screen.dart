import 'package:flutter/material.dart';
import 'package:recrutterapp/widgets/AppBarCustom.dart';
import '../model/Redmine/Projects.dart';
import '../widgets/card_project.dart';
import '../widgets/drawer_widget.dart';
final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

// Преобразование списка Issue в список ProjectData
List<ProjectData> convertIssuesToProjectDataList(List<Projects> issues) {
  return issues.map((issue) {
    return ProjectData(
      title: issue.name,
      description: '', // Замените на соответствующее поле из Issue
      startDate: issue.createdOn,
      icon:     const Icon(Icons.cases),
      endDate: '',
    );
  }).toList();
}


class ProjectsScreen extends StatelessWidget {
  ProjectsScreen({super.key, required this.projects});

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final List<Projects> projects;

  @override
  Widget build(BuildContext context) {
   List<ProjectData> projectDataList = convertIssuesToProjectDataList(projects);


    return Scaffold(
      key: scaffoldKey,
      appBar: AppBarCustom(scaffoldKey:scaffoldKey, key: null,),
      backgroundColor: Colors.white,
      body:  SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Виджет 1 - ссылка на заглушку виджета с редактированием текущего экрана
              // buildCustomAppBarWithActions(),
              // Виджет 2 - область для листа из виджетов
              buildMultipleCardWidgets(projectDataList),
            ],
          ),
        ),
      ),
      drawer: DrawerWidget(),
    );
  }


  Widget buildMultipleCardWidgets(List<ProjectData> ProjectDataList) {
    return Column(
      children: ProjectDataList.map((projectData) {
        return ProjectWidget(() { }, projectData: projectData, title: projectData.title, description: projectData.description);
      }).toList(),
    );
  }

  PreferredSizeWidget buildCustomAppBarWithActions() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(kToolbarHeight),
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            toolbarHeight: kToolbarHeight,
            actions: [
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: () {
                  // Заглушка для обработки нажатия на кнопку "Добавить"
                  print('Нажата кнопка "Добавить"');
                },
              ),
              IconButton(
                icon: const Icon(Icons.search),
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

