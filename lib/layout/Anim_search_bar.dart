import 'package:animation_search_bar/animation_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/SearchResponse.dart';
import 'package:news_app/providers/app_provider.dart';
import 'package:provider/provider.dart';
import '../screens/search_screen.dart';

 class SearchBarAnim extends StatefulWidget {

   bool isShow;
   SearchBarAnim(this.isShow);

  @override
  State<SearchBarAnim> createState() => _SearchBarAnimState();
}

class _SearchBarAnimState extends State<SearchBarAnim> {
  late TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }
  late AppProvider myProvider;

  @override
  Widget build(BuildContext context) {
    myProvider = Provider.of(context);
    controller.addListener(() {
      if(controller.text == ""){
        myProvider.changeSearchValue("");
      }else{
        myProvider.changeSearchValue(controller.text);
      }
    });
    return Visibility(
      visible: widget.isShow,
      child: AnimationSearchBar(
        centerTitle: 'News',
        centerTitleStyle: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        searchIconColor: Colors.white,
        hintStyle: TextStyle(color: Colors.white),
        textStyle: TextStyle(color: Colors.white),
        searchTextEditingController: controller,
        isBackButtonVisible: false,
        horizontalPadding: 5,
        searchBarWidth: MediaQuery.of(context).size.width*0.85,
        searchFieldDecoration: BoxDecoration(
            border: Border.all(color: Colors.white, width: 1),
            borderRadius: BorderRadius.circular(15)),
        onChanged: (value) {
          myProvider.changeSearchValue(value);
        },
      ),
    );
  }
}
