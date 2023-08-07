import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailsController extends GetxController with GetSingleTickerProviderStateMixin{
  late TabController tabController;

  final List<Widget> tabList =  <Widget>[
    const Tab(child: Text("ABOUT"),),
    const Tab(child: Text("STATUS"),),
    const Tab(child: Text("MOVES"),),
  ];

  @override
  void onInit() {
    tabController = TabController(length: 3, vsync: this);
    super.onInit();
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }
}