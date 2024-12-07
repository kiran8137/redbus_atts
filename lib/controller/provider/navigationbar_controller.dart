

import 'package:flutter/material.dart';

class NavigationbarController extends ChangeNotifier {

    int currentPage = 0;

    void setCurrentPage(int index){
      currentPage = index;
      notifyListeners();
    }
}