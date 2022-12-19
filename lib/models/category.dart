import 'package:flutter/material.dart';

class Category{
  String id;
  String title;
  String image;
  Color colorBG;

  Category(this.id, this.title, this.image, this.colorBG);

  static List<Category> getCategories(){
    return [
      Category('sports', 'Sports', 'assets/images/sports.png', Color(0xffC91C22)),
      Category('general', 'General', 'assets/images/Politics.png', Color(0xff003E90)),
      Category('health', 'Health', 'assets/images/health.png', Color(0xffED1E79)),
      Category('business', 'Business', 'assets/images/bussines.png',Color(0xffCF7E48)),
      Category('technology', 'Technology', 'assets/images/environment.png',Color(0xff4882CF)),
      Category('science', 'Science','assets/images/science.png', Color(0xffF2D352)),
    ];
  }
}