import 'package:animation_search_bar/animation_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/SearchResponse.dart';

import '../screens/search_screen.dart';

 class SearchBarAnim extends StatefulWidget {

   bool isShow;
   SearchBarAnim(this.isShow);

  @override
  State<SearchBarAnim> createState() => _SearchBarAnimState();
}

class _SearchBarAnimState extends State<SearchBarAnim> {
  TextEditingController controller = TextEditingController();



  @override
  Widget build(BuildContext context) {
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
        onChanged: (value) {

        },
      ),
    );
  }
}
