import 'package:flutter/material.dart';
import 'package:news_app/models/sourcesResponse.dart';
import 'package:news_app/models/NewsResponse.dart';
import 'package:news_app/screens/news_item.dart';
import 'package:news_app/screens/tab_item.dart';
import 'package:news_app/shared/network/remote/api_manager.dart';

class TabControllerScreen extends StatefulWidget {
  List<Sources> sources;

  TabControllerScreen(this.sources);

  @override
  State<TabControllerScreen> createState() => _TabControllerScreenState();
}

class _TabControllerScreenState extends State<TabControllerScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget.sources.length,
      child: Column(
        children: [
          TabBar(
            onTap: (index) {
              selectedIndex = index;
              setState(() {});
            },
            padding: EdgeInsets.symmetric(vertical: 8),
            labelColor: Colors.green,
            indicatorColor: Colors.transparent,
            isScrollable: true,
            tabs: widget.sources
                .map((source) => TabItem(
                    source,
                    selectedIndex == widget.sources.indexOf(source)
                        ? true
                        : false))
                .toList(),
          ),
          FutureBuilder<NewsResponse>(
            future: ApiManager.getNews(widget.sources[selectedIndex].id!),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (snapshot.hasError) {
                return Center(
                  child: Column(
                    children: [
                      Text('Something Went Wrong'),
                      TextButton(
                        onPressed: () {},
                        child: Text('Try Again'),
                      ),
                    ],
                  ),
                );
              }
              if (snapshot.data!.status != "ok") {
                return Center(
                  child: Column(
                    children: [
                      Text(snapshot.data?.message ?? ""),
                      TextButton(
                        onPressed: () {},
                        child: Text('Try Again'),
                      ),
                    ],
                  ),
                );
              }
              var newsData = snapshot.data?.articles ?? [];
              return Expanded(
                child: ListView.builder(
                  itemCount: newsData.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: NewsItem(newsData[index]),
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
