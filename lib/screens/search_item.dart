import 'package:flutter/material.dart';

import '../models/SearchResponse.dart';

class SearchItem extends StatelessWidget {


  // Articles articles;
  // SearchItem(this.articles);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Text('articles.title!',style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),),
        ],
      ),
    );
  }
}
