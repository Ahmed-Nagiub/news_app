import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/NewsResponse.dart';
import 'package:news_app/shared/styles/colors.dart';
import 'package:url_launcher/url_launcher.dart';

class ArticleDetailsScreen extends StatelessWidget {

  static const String routName = "ArticleDetailsScreen";

  @override
  Widget build(BuildContext context) {
    Articles articles = ModalRoute
        .of(context)!
        .settings
        .arguments as Articles;
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/images/pattern.png'),
          )),
      child: Scaffold(
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
        ),
        body: Padding(
          padding: EdgeInsets.all(14.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CachedNetworkImage(
                  imageUrl: articles.urlToImage ?? "",
                  width: double.infinity,
                  height: 180,
                  fit: BoxFit.fill,
                  placeholder: (context, url) =>
                      Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
                SizedBox(height: 10,),
                Text(articles.source!.name!,
                  style: TextStyle(fontSize: 12, color: Colors.grey.shade600),),
                Text(articles.title!, style: TextStyle(fontSize: 13,
                    color: Colors.black,
                    fontWeight: FontWeight.w700),),
                SizedBox(height: 8,),
                Text(articles.publishedAt?.substring(0, 10) ?? "",
                  style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                  textAlign: TextAlign.right,),
                SizedBox(height: 10,),
                Text(articles.description!,
                  style: TextStyle(
                    fontSize: 12, color: Colors.grey.shade900,),),
                SizedBox(height: 15,),
                InkWell(
                  onTap: () {
                    _launchUrl(Uri.parse(articles.url!));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('View Full Article',
                          style: TextStyle(fontSize: 11, color: Colors.black,)),
                      Icon(
                        Icons.arrow_right,
                        color: Colors.black,
                        size: 30,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _launchUrl(Uri url) async {
    if (!await launchUrl(url)) {
      throw 'Could not launch $url';
    }
  }
}
