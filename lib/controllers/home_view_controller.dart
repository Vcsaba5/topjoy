import 'dart:math';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:topjoy/constants.dart' as constant;

class HomeviewController extends GetxController{
  BuildContext context;
  HomeviewController(this.context);

  bool isInitialized=false;

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
    Future<void> preloadAllImages() async {
      for (int i=0;i<11;i++) {
        await precacheImage(AssetImage('images/bottlecap_$i.png'), context);
      }
  }
  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    await preloadAllImages();
    isInitialized=true;
    await Future.delayed(Duration(milliseconds: 2000));
    update();
  }
}