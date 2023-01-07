import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/NewsResponse.dart';

import '../layout/details_screen.dart';
import '../models/SearchResponse.dart';

class SearchItem extends StatelessWidget {

  SearchArticles articles;
  SearchItem(this.articles);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CachedNetworkImage(
            imageUrl: articles.urlToImage??"",
            width: double.infinity,
            height: 180,
            fit: BoxFit.fill,
            placeholder: (context, url) => Center(child: CircularProgressIndicator()),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
          Text(articles.author??"",style: TextStyle(fontSize: 12,color: Colors.grey.shade400),),
          Text(articles.title??"",style: TextStyle(fontSize: 14,color: Colors.black,fontWeight: FontWeight.w700),),
          SizedBox(height: 5,),
          Text(articles.publishedAt?.substring(0,10)??"",style: TextStyle(fontSize: 12,color: Colors.black),textAlign: TextAlign.right,),
          Divider(color: Colors.black,thickness: 2,height: 2),
        ],
      ),
    );
  }
}
