import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AppBarCustom extends StatelessWidget implements PreferredSizeWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  late final user = FirebaseAuth.instance.currentUser;

  AppBarCustom({required Key? key, required this.scaffoldKey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(' '),
      backgroundColor: const Color.fromRGBO(255, 205, 176, 100),
      leading: IconButton(
        icon: const Icon(Icons.menu),
        onPressed: () {
          if (scaffoldKey.currentState!.isDrawerOpen) {
            scaffoldKey.currentState?.openEndDrawer();
          } else {
            scaffoldKey.currentState?.openDrawer();
          }
        },
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.logout),
          onPressed: () {
            if(user != null)
              {
              // Выполнить logout для пользователя
              FirebaseAuth.instance.signOut();
              }
            Navigator.pushNamed(context, '/');

          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => AppBar().preferredSize;
}
