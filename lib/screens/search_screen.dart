import 'package:flutter/material.dart';
import 'package:news_app/models/SearchResponse.dart';
import 'package:news_app/screens/search_item.dart';
import '../shared/network/remote/api_manager.dart';

class SearchScreen extends StatelessWidget {

  Articles articles;

  SearchScreen(this.articles);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SearchResponse>(
        future: ApiManager.searchInAll(articles.title!),
        builder: (context, snapshot) {
          if(snapshot.connectionState== ConnectionState.waiting){
            return Center(child: CircularProgressIndicator(),);
          }
          if(snapshot.hasError){
            return Center(
              child: Column(
                children: [
                  Text('Something Went Wrong'),
                  TextButton(onPressed: (){

                  }, child: Text('Try Again'),),
                ],
              ),
            );
          }
          var articles = snapshot.data?.articles??[];
          return ListView.builder(
              itemCount: articles.length,
              itemBuilder: (context, index) {
                return SearchItem();
              },);
        },);
  }
}
