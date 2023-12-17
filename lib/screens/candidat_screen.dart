import 'package:flutter/material.dart';
import 'package:recrutterapp/model/Redmine/Person.dart';
import 'package:recrutterapp/widgets/card_person.dart';
import '../widgets/drawer_widget.dart';

import '../widgets/AppBarCustom.dart';
import '../widgets/actions_button.dart';
import '../model/Redmine/Person.dart';

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

List<PersonData> convertIssuesToProjectDataList(List<Person> person) {
  return person.map((person) {
    return PersonData(
      title: person.name,
      description: '',
      id: person.id,
      icon:     Icon(Icons.cases),
      role: person.roles,
    );
  }).toList();
}

class CandidatScreen extends StatelessWidget {
  //CandidatScreen({Key? key}) : super(key: key);
  final List<Person> Persons;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  CandidatScreen({required this.Persons});




  @override
  Widget build(BuildContext context) {
    List<PersonData> personDataList = convertIssuesToProjectDataList(Persons);
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
              buildMultipleCardWidgets(personDataList),
            ],
          ),
        ),
      ),
      drawer: DrawerWidget(),
    );
  }


  Widget buildMultipleCardWidgets(List<PersonData> PersonDataList) {r
    return Column(
      children: PersonDataList.map((personData) {
        return PersonWidget(() { }, personData: personData, title: personData.title, description: personData.description);
      }).toList(),
    );
  }
}