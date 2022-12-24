import 'package:flutter/material.dart';
import 'package:news_app/layout/Anim_search_bar.dart';
import 'package:news_app/models/category.dart';
import 'package:news_app/screens/categories_screen.dart';
import 'package:news_app/screens/drawer_widget.dart';
import 'package:news_app/screens/home_screen.dart';
import 'package:news_app/shared/styles/colors.dart';


class HomeLayout extends StatefulWidget {
  static const String routeName = 'home';

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {

  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/images/pattern.png'),
          )),
      child: Scaffold(
        drawer: DrawerWidget(whenOpenDrawer),
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          shape: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.transparent
            ),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(12),
              bottomRight: Radius.circular(12),
            ),
          ),
          backgroundColor: colorGreen,
          centerTitle: true,
          title: Text('News'),
          actions: [
            SearchBarAnim(),
          ],
        ),
        body:SelectedCategorItem == null?CategoriesScreen
          (SelectedCategoryCallBack) : HomeScreen(SelectedCategorItem!),
      ),
    );
  }

  Category? SelectedCategorItem = null;

  void whenOpenDrawer(selectedNumber){
    if(selectedNumber==DrawerWidget.CATEGORY_NUMBER){
      SelectedCategorItem=null;
    }else if(selectedNumber==DrawerWidget.SETTING_NUMBER){
      // open settings screen
    }
    setState(() {
      Navigator.pop(context);
    });
  }

  void SelectedCategoryCallBack(Category category) {
    SelectedCategorItem = category;
    setState(() {});
  }
}
