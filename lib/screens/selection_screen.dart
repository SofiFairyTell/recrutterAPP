import 'package:flutter/material.dart';
import 'package:recrutterapp/widgets/AppBarCustom.dart';
import '../model/Redmine/Projects.dart';
import '../widgets/card_project.dart';
import '../widgets/drawer_widget.dart';
import '../widgets/recommendationtable_widget.dart';
import '../widgets/searchline_widget.dart';
import '../widgets/criteriontable_widget.dart';
import '../widgets/criteriontable_widget.dart';
final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

class SelectionScreen extends StatefulWidget {
  final String projectTitle;

  SelectionScreen({super.key, required this.projectTitle});

  @override
  _SelectionScreenState createState() => _SelectionScreenState();
}
class _SelectionScreenState extends State<SelectionScreen >{
  bool _isVisible = false;
  bool _isShow    = false;

  void _updateVisibility(isVisible) {
    setState(() {
      _isVisible = !_isVisible;
    });
  }
  void _showVisibility(isShow) {
    setState(() {
      _isShow = !_isShow;
    });
  }
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
              SearchWidget(searchTitle:widget.projectTitle, onVisibilityChanged: _updateVisibility),
              CriterionTable(isShow: _isVisible,),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _isShow = !_isShow;
                  });
                },
                child: Text('Подобрать'),
              ),

              RecommendationTable(isShow:_isShow),
              ElevatedButton(
                onPressed: () {
                },
                child: Text('Отправить на согласование'),
              ),
            ],
          ),
        ),
      ),
      drawer: DrawerWidget(),
    );
  }



}



