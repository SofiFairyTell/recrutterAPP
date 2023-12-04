import 'package:flutter/material.dart';
import 'package:recrutterapp/bloc/jobs/firebase_stream.dart';
import 'package:recrutterapp/screens/candidat_screen.dart';
import 'package:recrutterapp/screens/modul_analysis/chart_screen.dart';
import 'package:recrutterapp/screens/profile_screen.dart';
import 'package:recrutterapp/screens/signup_screen.dart';
import 'package:recrutterapp/screens/setting_screen.dart';
import 'package:recrutterapp/screens/start_screen.dart';
import 'package:recrutterapp/screens/vacanc_screen.dart';
import 'package:recrutterapp/screens/project_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

//Выполнение приложений на Flutter начинается с функции Main

void main()  async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
  ///Цепочка регистрации отключена
      ///до тех пор пока не удастся подключить интернет на эмуляторе

      // '/': (context) => FirebaseStream(),
      '/': (context) => const Main(),
      // '/home': (context) => const Main(),
      '/settings': (context) => SettingsScreen(),
      '/signup': (context) =>  SignUpScreen(key: null,),
      '/profile': (context) =>  ProfileScreen(),
      '/vac':(context) => VacancScreen(key: null,),
      '/candidates':(context) => CandidatScreen(),
      '/chart':(context) => ChartScreen(),
      '/projects':(context) => ProjectsScreen(key: null,),
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
        title: const Text('RECRUITER'),
        backgroundColor: const Color.fromRGBO(255, 205, 176, 100),
      ),
      //backgroundColor: Colors.greenAccent,
      body: const StartScreen(key: null,),
    );
  }
}
