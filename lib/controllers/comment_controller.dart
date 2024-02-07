
// ignore_for_file: empty_catches

 

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:tiktok_clone/consttants/firesbases_initialized.dart';
import 'package:tiktok_clone/models/comments.dart';

class CommentController extends GetxController{


   Rx<List<Comments>>listComments=Rx<List<Comments>>([]);


      List<Comments>getCommentList ()=>listComments.value;

   String postId="";

     updateComment(String id){

      postId=id;
      getAllComments();
     }



   getAllComments(){

     listComments.bindStream(

       fireStore.collection("videos").doc(postId).collection("comments")
       .snapshots().map(( QuerySnapshot querySnapshot ) {

        List<Comments>commentList=[];

        for(var item in querySnapshot.docs){

          commentList.add(Comments.fromMap(item));
        }

          return commentList;
       })




     );




   }

   PostComments(String comment)async{
  

    try {
        
        var uid= authController.user.uid;

      DocumentSnapshot userDoc= await fireStore.collection("users").doc(uid).get();

      final videoDocs=await fireStore.collection('videos').doc(postId).collection("comments").get();

      var date =DateTime.now();

      if (comment.trim().isNotEmpty) {

       
       Comments comments=Comments(
          userName: (userDoc.data()!as dynamic)["userName"],
          uid: uid,
          id: '${videoDocs.docs.length}',
          comment: comment, 
          datePublished: date.toIso8601String(), 
          likes: [], 
          userPhoto:(userDoc.data()!as dynamic)["userPhoto"]
          );
      
       await fireStore.collection("videos").doc(postId).collection("comments").doc("${videoDocs.docs.length}")
          .set(comments.tojson()).whenComplete(() => print(" comments is upload"));

        DocumentSnapshot doc=await fireStore.collection("videos").doc(postId).get();

        await fireStore.collection("videos").doc(postId)
        .update({"commentsCount":(doc.data()! as dynamic)["commentsCount"]+1


        });
         
        
      }
      
    }on FirebaseException catch(e){
        
        Get.snackbar("title", e.message!);

      
    }
     catch (e) {
       Get.snackbar("title", e.toString());

    }

    
   }



   likedComments(String id) async{

          var uid= authController.user.uid;

      DocumentSnapshot doc= await fireStore.collection("videos").doc(postId).collection("comments").doc(id).get();
    
    try {


       if((doc.data()!as dynamic)["likes"].contains(uid)){

         await fireStore.collection("videos").doc(postId)
         .collection("comments").doc(id)
         .update({"likes":FieldValue.arrayRemove([uid])});

       }else{
          
          await fireStore.collection("videos").doc(postId)
          .collection("comments").doc(id)
          .update({"likes":FieldValue.arrayUnion([uid])});

       }
      
    } on FirebaseException catch(e){
        
        Get.snackbar("title", e.message!);

      
    }
    
    catch (e) {
       Get.snackbar("title", e.toString());
      
    }
   }
  
}