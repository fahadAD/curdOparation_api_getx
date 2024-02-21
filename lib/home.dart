import 'package:caud_api_getx/add_data.dart';
import 'package:caud_api_getx/controller.dart';
import 'package:caud_api_getx/custom_cart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class HomePage extends StatelessWidget {
    HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final AllController allController=Get.put(AllController());
    return Scaffold(
      appBar: AppBar(title: Text("data list"),),
    floatingActionButton: FloatingActionButton(onPressed: () {
      Get.to(AddDataScreen());
    },),
    body: Obx(() => GridView.count(
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      crossAxisCount: 2,

      children: allController.model_list.map((element) => CustomWidgetCart(alldata: element,)).toList(),

    )),
    );
  }
}
