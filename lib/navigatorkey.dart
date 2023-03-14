import 'package:flutter/material.dart';

class MyNavigatorKey{
  static final GlobalKey<NavigatorState> navigatorKeyMain = GlobalKey();
  static final GlobalKey<NavigatorState> navigatorKeySecondary =
  GlobalKey();
  static final GlobalKey<NavigatorState> bottomNavigationBarSecondItem =
  GlobalKey();
  static final GlobalKey<NavigatorState> bottomNavigationBarThirdtItem =
  GlobalKey();


  MyNavigatorKey();


}