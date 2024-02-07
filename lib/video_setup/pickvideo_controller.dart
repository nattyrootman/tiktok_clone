

import 'dart:io';
import 'dart:typed_data';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tiktok_clone/video_setup/confirm_video.dart';

class PickVideoController extends GetxController{

  static  PickVideoController instance =Get.find();
 
   //File? file;
   //Uint8List ?uint8list;


  void PickVideo(ImageSource source)async{
      
      try{

        var pickVideo= await ImagePicker().pickVideo(source: source);
       if(pickVideo!=null){

      Uint8List uint8list=await pickVideo.readAsBytes();

     Get.to(ConfirmVideo( uint8list: uint8list,videoPath:pickVideo.path));
    }else{

      Get.snackbar("title","somthing wrong went happened");
    }
  }catch(e){

      print(e.toString());
      Get.snackbar("error:", e.toString());
  }



}
    
}