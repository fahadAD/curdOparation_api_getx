import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'controller.dart';
import 'model.dart';
class EditDataScreen extends StatelessWidget {
  EditDataScreen({super.key, required this.editdata});

  final AllModel editdata;

  @override
  Widget build(BuildContext context) {
    final AllController allController=Get.put(AllController());

   allController.edit_tittle_controller.text=editdata.tittle.toString();
   allController.edit_desc_controller.text=editdata.description.toString();


    return Scaffold(
      appBar: AppBar(title: Text("Edit Data"),
      actions: [
        IconButton(onPressed: () {
          allController.deleteTask(editdata.id!);
        }, icon: Icon(Icons.delete))
      ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14.0),
        child: Column(
          children: [
            TextFormField(
              controller: allController.edit_tittle_controller,
              decoration: InputDecoration(hintText: 'Edit Tittle'),
            ),
            TextFormField(
              controller: allController.edit_desc_controller,
              decoration: InputDecoration(hintText: 'Edit Description'),
            ),
            SizedBox(height: 20,),
            ElevatedButton(onPressed: () {
              allController.updateData(editdata.id!);

            }, child: Text("Data Edit"))
          ],
        ),
      ),
    );
  }
}
