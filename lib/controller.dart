
import 'dart:convert';

import 'package:caud_api_getx/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import 'model.dart';
import 'package:http/http.dart' as http;

class AllController extends GetxController{
  final String _url= "https://65d5bca1f6967ba8e3bc64fd.mockapi.io/note";

RxList<AllModel>  model_list=RxList<AllModel>();

    //add_contriller
  TextEditingController tittle_controller= TextEditingController();
  TextEditingController desc_controller= TextEditingController();

  //edit_contriller
  TextEditingController edit_tittle_controller= TextEditingController();
  TextEditingController edit_desc_controller= TextEditingController();

  @override
  void onInit() {
    super.onInit();
    getAllData();
    // postData();
   }

Future<void> getAllData()async{
  var response=await http.get(Uri.parse(_url));
  var data=jsonDecode(response.body);


     model_list.clear();  // not dplicate data

 if(response.statusCode==200){
   for(var list in data){

     model_list.add(AllModel.fromJson(list));
   }
   EasyLoading.showSuccess("Success");
 }else{
   Text("NO Data");
   EasyLoading.showError("Error");
 }


}


  Future<void> postData()async{

    var newData=AllModel(
      tittle: tittle_controller.text,
      description: desc_controller.text,
      date: DateTime.now().toString(),
      time:  DateTime.timestamp().toString()
    );


if(tittle_controller.text != '' && desc_controller.text != ''){
  var response=await http.post(Uri.parse(_url), body: jsonEncode(newData.toJson()), headers: {'content-type': 'application/json'});

  if(response.statusCode==201){
    tittle_controller.clear();
    desc_controller.clear();
    Get.to(HomePage());
    EasyLoading.showSuccess("❤️Success");

      getAllData();   // not dplicate data
  }else{
    EasyLoading.showError("❌ Error");
  }
}else{
  EasyLoading.showError("❌ Please enter something");
}

  }

  Future<void> updateData(String id) async {
    var newUrl = "https://65d5bca1f6967ba8e3bc64fd.mockapi.io/note/$id";
    var updatedData = AllModel(
      tittle: edit_tittle_controller.text,
      description: edit_desc_controller.text,
    );

    if(edit_tittle_controller.text != '' && edit_desc_controller.text != ''){
      var response = await http.put(Uri.parse(newUrl),
          body: jsonEncode(updatedData.toJson()),
          headers: {'content-type': 'application/json'});
      if (response.statusCode == 200) {
        print(response.body);
        print(response.statusCode);
        EasyLoading.showSuccess("❤️ Data Updated");
        getAllData();      // not dplicate data
        Get.back();

      }else{
        EasyLoading.showError("❌ Error");
      }
    }else{
      EasyLoading.showError("❌ Please enter something Editted");
    }


  }



  Future<void> deleteTask(String id) async {
    var newUrl = "https://65d5bca1f6967ba8e3bc64fd.mockapi.io/note/$id";
    final response = await http.delete(Uri.parse(newUrl));
    if (response.statusCode == 200) {
      print("❌ Note Delete");
      EasyLoading.showError("❌ Note Delete");
      getAllData();     // not dplicate data
      Get.back();
    }else{
      EasyLoading.showError("❌ Note Delete Unsuccessful");
    }
  }



}