import 'package:flutter/material.dart';
import 'package:news_app/models/sourcesResponse.dart';

class TabItem extends StatelessWidget {

  Sources sources;
  bool isSelected;
  TabItem(this.sources,this.isSelected);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4,horizontal: 15),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.green,
        ),
        borderRadius: BorderRadius.circular(25),
        color: isSelected?Colors.green:Colors.transparent,
      ),
      child: Text(sources.name??"",style: Theme.of(context).textTheme.subtitle1?.copyWith(
        color: isSelected?Colors.white:Colors.green,
      ),),
    );
  }
}
