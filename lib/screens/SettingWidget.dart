import 'package:flutter/material.dart';

import 'DrawerWidget.dart';
import 'Widgets/AppBarCustom.dart';

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

class SettingsWidget extends StatelessWidget {
   SettingsWidget({Key? key}) : super(key: key);
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBarCustom(scaffoldKey:scaffoldKey, key: null,),
      drawer: DrawerWidget(),
        backgroundColor: Colors.white,
        body: SafeArea(
            child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
              const Text('Settings Page'),
              TextButton.icon(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blue),
                    foregroundColor:
                        MaterialStateProperty.all(Colors.deepPurpleAccent)),
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back),
                label: const Text('Назад'),
              ),
            ]))),
);
  }
}
