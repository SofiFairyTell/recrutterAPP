import 'package:flutter/material.dart';
import 'package:recrutterapp/model/Redmine/Person.dart';
import '../widgets/drawer_widget.dart';

import '../widgets/AppBarCustom.dart';
import '../widgets/actions_button.dart';
import '../model/Redmine/Person.dart';

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

class CandidatScreen extends StatelessWidget {
  //CandidatScreen({Key? key}) : super(key: key);
  final List<Person> Persons;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  CandidatScreen({required this.Persons});




  @override
  Widget build(BuildContext context) {
    //final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    //final List<Person> Persons = args['Persons'];

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBarCustom(scaffoldKey:scaffoldKey, key: null,),
      backgroundColor: Colors.white,
      body:  SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Виджет 1 - ссылка на заглушку виджета с редактированием текущего экрана
              ActionsButtons(),

              // Виджет 2 - область для листа из виджетов
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text('Item $index'),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      drawer: DrawerWidget(),
    );
  }
}