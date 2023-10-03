import 'dart:math';

import 'package:get/get.dart';
import 'package:topjoy/constants.dart' as constant;

class HomeviewController extends GetxController{
  int bottlecapstate = 0;
  int random = 0;
  String giveMeMessage() {
    return(bottlecapstate==10) ? constant.messages[random].toUpperCase() : "";
  }
  void flipTheBottleCap() async{
    bool condition =(bottlecapstate==0);
    random = Random().nextInt(constant.messages.length);
    for(int i=(condition)?0:10; (condition)? i<11 : i>=0; (condition)? i++: i--){
      bottlecapstate = i;
      await Future.delayed(Duration(milliseconds: 15));
      update();
    }
  }
}