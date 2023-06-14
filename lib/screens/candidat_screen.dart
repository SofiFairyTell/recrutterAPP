import 'package:flutter/material.dart';
import '../widgets/drawer_widget.dart';

import '../widgets/AppBarCustom.dart';
import '../widgets/actions_button.dart';

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

class CandidatScreen extends StatelessWidget {
  CandidatScreen({Key? key}) : super(key: key);

  final scaffoldKey = GlobalKey<ScaffoldState>();

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