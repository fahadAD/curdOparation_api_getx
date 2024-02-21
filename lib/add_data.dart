import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'controller.dart';
class AddDataScreen extends StatelessWidget {
    AddDataScreen({super.key});

  final AllController allController=Get.put(AllController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Data")),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14.0),
        child: Column(
          children: [
            TextFormField(
              controller: allController.tittle_controller,
              decoration: InputDecoration(hintText: 'Tittle'),
            ),
            TextFormField(
              controller: allController.desc_controller,
              decoration: InputDecoration(hintText: 'Description'),
            ),
                SizedBox(height: 20,),
                ElevatedButton(onPressed: () {
                   allController.postData();

                }, child: Text("Data Post"))
          ],
        ),
      ),
    );
  }
}
