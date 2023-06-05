import 'package:flutter/material.dart';
import 'DrawerWidget.dart';

import 'Widgets/AppBarCustom.dart';
import 'Widgets/CardWidget.dart';

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

class VacancScreen extends StatelessWidget {
  VacancScreen({required Key? key}) : super(key: key);

  final scaffoldKey = GlobalKey<ScaffoldState>();

  List<CardData> cardDataList = [
    CardData(
      title: 'Бизнес-аналитик',
      description: 'Количество требуемых специалистовв. Требования. Тестовое',
      imageUrl: 'assets/images/image1.jpg',
    ),
    CardData(
      title: 'Jun-DEV',
      description: 'Количество требуемых специалистовв. Требования. Тестовое',
      imageUrl: 'assets/images/image2.jpg',
    ),
    CardData(
      title: 'Senior-DEV',
      description: 'Количество требуемых специалистовв. Требования. Тестовое',
      imageUrl: 'assets/images/image3.jpg',
    ),
    CardData(
      title: 'Архитектор',
      description: 'Количество требуемых специалистовв. Требования. Тестовое',
      imageUrl: 'assets/images/image3.jpg',
    ),
    CardData(
      title: 'Тестировщик',
      description: 'Количество требуемых специалистовв. Требования. Тестовое',
      imageUrl: 'assets/images/image3.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBarCustom(scaffoldKey:scaffoldKey, key: null,),
      backgroundColor: Colors.white,
      body:  SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Виджет 1 - ссылка на заглушку виджета с редактированием текущего экрана
              buildCustomAppBarWithActions(),
              // Виджет 2 - область для листа из виджетов
              buildMultipleCardWidgets(cardDataList),
            ],
          ),
        ),
      ),
      drawer: DrawerWidget(),
    );
  }

  Widget buildMultipleCardWidgets(List<CardData> cardDataList) {
    return Column(
      children: cardDataList.map((cardData) {
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

