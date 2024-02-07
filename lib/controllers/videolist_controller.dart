
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:tiktok_clone/consttants/firesbases_initialized.dart';

import '../models/video_model.dart';

class VideoListContoller  extends GetxController{


   

 Rx<List<VideoModel>>_videolist=  Rx<List<VideoModel>>([]);


   List<VideoModel> get videoList =>_videolist.value;
    @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    _videolist.bindStream(getAllVideo());
  }





    getAllVideo(){


    return  fireStore.collection("videos").snapshots()
    .map((snapShot) => snapShot.docs.map((e) => VideoModel.fromMap(e)).toList());

 }



 likeVideo(String id)async{

  try {

    DocumentSnapshot userDoc=await fireStore.collection("videos").doc(id).get();

  var uid= firebaseAuth.currentUser!.uid;

  if ((userDoc.data()!as Map<String,dynamic>)["likes"].contains(uid)) {

    await fireStore.collection("videos").doc(id).update({"likes":FieldValue.arrayRemove([uid])});
        print(" is not liked");
    
  }else{

    await fireStore.collection("videos").doc(id).update({"likes":FieldValue.arrayUnion([uid])});
    print("is liked ");
  }
    
  } on FirebaseException catch(e){
    print(e.message);

  }
  
  catch (e) {

    print(e.toString());
    
  }

  
 }}