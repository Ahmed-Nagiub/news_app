import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:news_app/models/sourcesResponse.dart';
import 'package:news_app/models/NewsResponse.dart';
import 'package:news_app/shared/components/constants.dart';

import '../../../models/SearchResponse.dart';

class ApiManager {
  static Future<SourcesResponse> getSources(String categoryId) async {
    Uri URL = Uri.https(BASE, '/v2/top-headlines/sources', {"apiKey": APIKEY,"category":categoryId},);
    Response sources = await http.get(URL);
    try {
      var json = jsonDecode(sources.body);
      SourcesResponse sourcesResponse = SourcesResponse.fromJson(json);
      return sourcesResponse;
    } catch (e) {
      print('Erroooor Hereeee $e');
      throw e;
    }
  }

  static Future<NewsResponse> getNews(String sourceId) async {
    Uri URL = Uri.https(BASE, '/v2/everything', {
      "apiKey": APIKEY,
      "sources": sourceId,
    });
    Response newsData = await http.get(URL);

    var json = jsonDecode(newsData.body);

    NewsResponse newsResponse = NewsResponse.fromJson(json);

    return newsResponse;
  }

  //https://newsapi.org/v2/everything?apiKey=e5e9cbe315f84a52972b487b3ba0193c&q=abc-news

  static Future<SearchResponse> searchInAll(String value) async{
    Uri URL = Uri.https(BASE, '/v2/everything', {
      "apiKey": APIKEY,
      "q": value,
    });
    Response searchData = await http.get(URL);

    var json = jsonDecode(searchData.body);

    SearchResponse searchResonse = SearchResponse.fromJson(json);

    return searchResonse;

  }

}
