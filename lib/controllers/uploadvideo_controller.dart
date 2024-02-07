

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:tiktok_clone/consttants/firesbases_initialized.dart';
import 'package:tiktok_clone/main_screen/home.dart';
import 'package:tiktok_clone/models/video_model.dart';

class UplaodVideoController extends GetxController{



      

    Future<String> FirestorageVideoUrl(  String id , Uint8List uint8list) async{


      var storage=await fireStorage.ref().child("videos").child(id);

      final uploadTask= storage.putData(uint8list).whenComplete(() =>print("video is Upload"));

    TaskSnapshot taskSnapshot= await uploadTask;

    String videoUrl= await taskSnapshot.ref.getDownloadURL();

    return videoUrl;


      }


      fireStoreDoc(String songName,String caption,Uint8List ?videoPath)async{


        try {

        
        String uid= firebaseAuth.currentUser!.uid;
         String videoId=DateTime.now().millisecondsSinceEpoch.toString();

          final userDoc= await  fireStore.collection("users").doc(uid).get();
        final  doc= await fireStore.collection("videos").get();


       final url= await FirestorageVideoUrl(videoId,videoPath!);
          

          VideoModel videoModel= VideoModel(
             userName:(userDoc.data()!as dynamic )["userName"],
             uid:  uid,
             id: videoId, 
             likes: [],
             commentsCount: 0, 
             shareCount: 0, 
             songName: songName,
            caption: caption,
             userPhoto: (userDoc.data()!as dynamic)["userPhoto"],
             videourl: url);


            await  fireStore.collection("videos").doc(videoId).set(videoModel.toMap())
            .whenComplete((){Get.snackbar("title", "docs are ulpoaded");
               print("docs are ulpoaded");

               Get.to(HomePage());
            });
             
           

          
        }on FirebaseException catch(e){

            Get.snackbar("title", e.message!);
        }
        
         catch (e) {
             Get.snackbar("title", e.toString());
          
        }


      }



}