import 'package:flutter/material.dart';
import 'package:recrutterapp/widgets/AppBarCustom.dart';
import '../model/Redmine/Projects.dart';
import '../widgets/card_project.dart';
import '../widgets/drawer_widget.dart';
import '../widgets/searchline_widget.dart';
final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();


class SelectionScreen extends StatelessWidget {

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
              ProjectSearchWidget()
            ],
          ),
        ),
      ),
      drawer: DrawerWidget(),
    );
  }
}

