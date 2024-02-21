import 'package:caud_api_getx/add_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'model.dart';
import 'note_edits.dart';
class CustomWidgetCart extends StatelessWidget {
  const CustomWidgetCart({super.key, required this.alldata});
 final AllModel alldata;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(EditDataScreen(editdata: alldata,));
      },
      child: Container(
             child: Card(
               child: Row(
                 children: [
                   Expanded(
                     child: Column(
                       children: [
                         Text(alldata.id!,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue),maxLines: 1),
                         Text(alldata.tittle!,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red),maxLines: 1),
                         Flexible(child: Text(alldata.description!,style: TextStyle(fontWeight: FontWeight.w300,color: Colors.black),maxLines: 8, )),
                          Text(alldata.date!,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.deepOrange),maxLines: 1),
                         Text(alldata.time!,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.teal),maxLines: 1),

                       ],
                     ),
                   )
                 ],
               ),
             ),

      ),
    );
  }
}
