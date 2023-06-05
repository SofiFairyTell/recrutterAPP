import 'package:flutter/material.dart';

class AppBarCustom extends StatelessWidget implements PreferredSizeWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const AppBarCustom({required Key? key, required this.scaffoldKey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(' '),
      backgroundColor: Color.fromRGBO(255, 205, 176, 100),
      leading: IconButton(
        icon: Icon(Icons.menu),
        onPressed: () {
          if (scaffoldKey.currentState!.isDrawerOpen) {
            scaffoldKey.currentState?.openEndDrawer();
          } else {
            scaffoldKey.currentState?.openDrawer();
          }
        },
      ),
    );
  }

  @override
  Size get preferredSize => AppBar().preferredSize;
}
