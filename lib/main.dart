import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:recrutterapp/screens/CandidatScreen.dart';
import 'package:recrutterapp/screens/ProfileScreen.dart';
import 'package:recrutterapp/screens/SignUpScreen.dart';
import 'package:recrutterapp/screens/SettingWidget.dart';
import 'package:recrutterapp/screens/StartWidget.dart';
import 'package:recrutterapp/screens/VacancScreen.dart';

//Выполнение приложений на Flutter начинается с функции Main

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => const Main(),
      '/settings': (context) => SettingsWidget(),
      '/signup': (context) =>  SignUpScreen(key: null,),
      '/profile': (context) =>  ProfileScreen(),
      '/vac':(context) => VacancScreen(key: null,),
      '/candidats':(context) => CandidatScreen(),
    },
  ));
}

class Main extends StatelessWidget {
  const Main({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('RECRUITER APP'),
        backgroundColor: const Color.fromRGBO(255, 205, 176, 100),
      ),
      //backgroundColor: Colors.greenAccent,
      body: const StartWidget(key: null,),
    );
  }
}
