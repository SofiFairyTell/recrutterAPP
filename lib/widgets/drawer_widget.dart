import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:recrutterapp/model/user.dart';
import 'package:recrutterapp/screens/vacanc_screen.dart';

class DrawerWidget extends StatelessWidget {
  late final UserData userData = UserData(id: 'uidy1', name: 'Ярослава К', email:'example@mail.com' );


  @override
  Widget build(BuildContext context) {
    RouteSettings settings = ModalRoute.of(context)!.settings;
    if (settings.arguments != null) {
      late final UserData userData2;
      userData == settings.arguments as UserData;
    }

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('${this.userData.name}',style: TextStyle(fontSize: 16)),
                    Text('${this.userData.email}',style: TextStyle(fontSize: 12)),
                    // Text('Ярослава К', style: TextStyle(fontSize: 16)),
                    // Text('example@mail.com', style: TextStyle(fontSize: 12)),
                    Text('Фехтование.Дизайн. Маркетинг.HR', style: TextStyle(fontSize: 12)),
                  ],
                ),
                SizedBox(width: 10),
                Container(
                  width:50,
                  height: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage('assets/images/userlogo.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

              ],
            ),
            decoration: BoxDecoration(
              color: Color.fromRGBO(217, 146, 85, 100),
            ),
          ),
          ListTile(
            leading: Icon(Icons.admin_panel_settings),
            title: Text('Панель'),
            onTap: ()=> Navigator.pushNamed(context,'/profile'),
          ),
          ListTile(
            leading: Icon(Icons.work),
            title: Text('Вакансии'),
            onTap: ()=> Navigator.pushNamed(context,'/vac'),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Кандидаты'),
            onTap:  ()=> Navigator.pushNamed(context,'/candidats'),
          ),
          ListTile(
            leading: Icon(Icons.analytics),
            title: Text('Аналитика'),
            onTap: () {
              // TODO: Обработчик нажатия на элемент "Аналитика"
            },
          ),
          ListTile(
            leading: Icon(Icons.chat),
            title: Text('Чаты'),
            onTap: () {
              // TODO: Обработчик нажатия на элемент "Чаты"
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Настройки'),
            onTap: ()=> Navigator.pushNamed(context,'/settings'),
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Выход'),
            onTap: () => goToScreen(context,'/home')),
        ],
      ),
    );
  }
}


void goToScreen(BuildContext context, String route) {
  Navigator.pushNamed(context, route);
}

void goToVacanScreen(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => VacancScreen(key: null,),
    ),
  );
}