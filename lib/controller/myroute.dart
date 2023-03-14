import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../mainhome.dart';
import '../ui/home.dart';

class MyRoute {
  static late BuildContext playercontext;

  var navindex = 0.obs;

  var  pageController = PageController(
    initialPage: 0,
    keepPage: true,
  ).obs;

  void changeNavIndex(int index) {
    navindex.value = index;
    pageController.value.animateToPage(index,
        duration: const Duration(milliseconds: 300), curve: Curves.ease);
  }



static  Map<String, WidgetBuilder> secondaryrouteBuilders(
      BuildContext context,
      ) {
    return {
      '/': (context) => Home(),
    };
  }

}