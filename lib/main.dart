import 'package:flutter/material.dart';
import 'package:news_app/layout/details_screen.dart';
import 'package:news_app/layout/home_layout.dart';
import 'package:news_app/providers/app_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp( ChangeNotifierProvider(
      create: (context) => AppProvider(),
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: HomeLayout.routeName,
      routes: {
        HomeLayout.routeName: (context) => HomeLayout(),
        ArticleDetailsScreen.routName: (context) => ArticleDetailsScreen(),
      },
      debugShowCheckedModeBanner: false,
      title: 'News App',
    );
  }
}


