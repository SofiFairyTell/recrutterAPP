import 'package:flutter/material.dart';
import 'DrawerWidget.dart';
import 'Widgets/CustomButton.dart';
import 'Widgets/AppBarCustom.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);

  final scaffoldKey = GlobalKey<ScaffoldState>();

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
                        onPressed: () => Navigator.pushNamed(context,'/candidats'), key: null,
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
                        onPressed: () => print('Pressed Аналитика'), key: null,
                      ),
                      const SizedBox(width: 10),
                      CustomButton(
                        firstText: 'Чаты',
                        secondText:'Общайтесь с проектной командой',
                        onPressed: () => print('Pressed Чаты'), key: null,
                      ),
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

