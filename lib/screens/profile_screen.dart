import 'package:flutter/material.dart';
import 'package:recrutterapp/model/Redmine/Projects.dart';
import 'package:recrutterapp/screens/candidat_screen.dart';
import 'package:recrutterapp/screens/project_screen.dart';
import '../common/Redmine-api.dart';
import '../model/Redmine/Issue.dart';
import '../model/Redmine/Person.dart';
import '../model/Redmine/User.dart';
import '../widgets/drawer_widget.dart';
import '../widgets/custom_button.dart';
import '../widgets/AppBarCustom.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final String baseUrl = 'https://dev.sciener.ru';
  final String baseKey = 'de1b88738e2a19ec994caf6f88d4581d6edd16bb';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBarCustom(scaffoldKey:scaffoldKey, key: null,),
      backgroundColor: Colors.white,
      body:  SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomButton(
                        firstText: 'Вакансии',
                        secondText:'Получите данные от проектной команды',
                        onPressed: () => Navigator.pushNamed(context,'/vac'), key: null,
                      ),
                      const SizedBox(width: 10),
                      CustomButton(
                        firstText: 'Кандидаты',
                        secondText:'Подходящие участники команд',
                        onPressed:() async{
                          try{
                            List<List<Person>> Users = await RedmineApi.fetchPeopleInProjects(baseKey,baseUrl);
                            List<Person> UniqUser = Person.getUniquePeople(Users);
                            //Navigator.pushNamed(context,'/candidates',arguments: CandidatScreen(Persons: UniqUser),);
                            Navigator.push(context,
                              MaterialPageRoute(
                                builder:(context)=>CandidatScreen(Persons: UniqUser),),);
                          }
                          catch(e){
                            print('Error: $e');
                          }

                        },key:null,
                        //onPressed: () => Navigator.pushNamed(context,'/candidates'), key: null,
                      ),
                    ],
                  ),
                ),

                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomButton(
                        firstText: 'Аналитика',
                        secondText:'Выполните подбор проектной команды',
                        onPressed: () => Navigator.pushNamed(context,'/chart'), key: null,
                      ),
                      const SizedBox(width: 10),
                      CustomButton(
                        firstText: 'Чаты',
                        secondText:'Общайтесь с проектной командой',
                        onPressed: () => Navigator.pushNamed(context,'/chats'), key: null,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomButton(
                        firstText: 'Проекты',
                        secondText:'А что по проектам?',
                        onPressed:() async {
                          try {
                            List<Projects> projects = await RedmineApi.getProjects(baseKey,baseUrl);
                            Navigator.push(context,
                              MaterialPageRoute(
                                builder:(context)=>ProjectsScreen(projects: projects),),);
                            // print(issues.length);
                          } catch (e) {
                            print('Error: $e');
                          }
                        }, key: null,
                      ),
                      const SizedBox(width: 10),
                    ],
                  ),
                ),
              ],
            ),
          ),
      ),
      drawer: DrawerWidget(),
    );
  }



}

