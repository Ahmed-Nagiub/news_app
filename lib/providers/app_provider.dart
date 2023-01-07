
import 'package:flutter/material.dart';

class AppProvider extends ChangeNotifier{

  String searchValue='';
  void changeSearchValue(String newValue){
    searchValue = newValue;
    notifyListeners();
  }
}