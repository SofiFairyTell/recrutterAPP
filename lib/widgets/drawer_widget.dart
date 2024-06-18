import 'package:flutter/material.dart';
import 'package:recrutterapp/model/HH-RU/user.dart';
import 'package:recrutterapp/screens/vacanc_screen.dart';

class DrawerWidget extends StatelessWidget {
  late final UserData userData = UserData(id: 'uidy1', name: 'Ярослава К', email:'example@mail.com' );

  DrawerWidget({super.key});


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
            decoration: const BoxDecoration(
              color: Color.fromRGBO(217, 146, 85, 100),
            ),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('${userData.name}',style: const TextStyle(fontSize: 12)),
                    Text('${userData.email}',style: const TextStyle(fontSize: 10)),
                    // Text('Ярослава К', style: TextStyle(fontSize: 16)),
                    // Text('example@mail.com', style: TextStyle(fontSize: 12)),
                    const Text('Фехтование.Дизайн. Маркетинг.HR', style: TextStyle(fontSize: 12)),
                  ],
                ),
                const SizedBox(width: 10),
                Container(
                  width:45,
                  height: 45,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage('assets/images/userlogo.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.admin_panel_settings),
            title: const Text('Панель'),
            onTap: ()=> Navigator.pushNamed(context,'/profile'),
          ),
          ListTile(
            leading: const Icon(Icons.work),
            title: const Text('Вакансии'),
            onTap: ()=> Navigator.pushNamed(context,'/vac'),
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Кандидаты'),
            onTap:  ()=> Navigator.pushNamed(context,'/candidates'),
          ),
          ListTile(
            leading: const Icon(Icons.analytics),
            title: const Text('Аналитика'),
            onTap: () {
              // TODO: Обработчик нажатия на элемент "Аналитика"
            },
          ),
          ListTile(
            leading: const Icon(Icons.chat),
            title: const Text('Чаты'),
            onTap: () {
              // TODO: Обработчик нажатия на элемент "Чаты"
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Настройки'),
            onTap: ()=> Navigator.pushNamed(context,'/settings'),
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Выход'),
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