import 'package:get/get.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class MyPanelController extends GetxController {


  Rx<PanelController> panelController = PanelController().obs;
  var height = 0.0.obs;
  void onPanelSlide(double pos) {
    height.value = pos;
  }






}