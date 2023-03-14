import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:get/get.dart';

final _advancedDrawerController = AdvancedDrawerController();
class MyDrawerController extends GetxController {


  static AdvancedDrawerController getDrawerController() {
    return _advancedDrawerController;
  }

}