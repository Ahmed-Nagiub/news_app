import 'package:flutter/material.dart';
import 'package:news_app/models/category.dart';
import 'package:news_app/models/sourcesResponse.dart';
import 'package:news_app/screens/tab_controller.dart';
import 'package:news_app/shared/network/remote/api_manager.dart';

class  HomeScreen extends StatelessWidget {

  Category category;

  HomeScreen(this.category);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SourcesResponse>(
      future: ApiManager.getSources(category.id),
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
        if(snapshot.data!.status != "ok"){
          return Center(
            child: Column(
              children: [
                Text(snapshot.data?.message??""),
                TextButton(onPressed: (){

                }, child: Text('Try Again'),),
              ],
            ),
          );
        }
        var sources = snapshot.data?.sources??[];
        return TabControllerScreen(sources);
      },
    );
  }
}
